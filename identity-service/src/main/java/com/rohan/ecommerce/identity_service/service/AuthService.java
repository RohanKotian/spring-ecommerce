package com.rohan.ecommerce.identity_service.service;

import com.rohan.ecommerce.identity_service.dto.AuthResponse;
import com.rohan.ecommerce.identity_service.dto.LoginRequest;
import com.rohan.ecommerce.identity_service.dto.RegisterRequest;
import com.rohan.ecommerce.identity_service.dto.UserResponse;
import com.rohan.ecommerce.identity_service.entity.Role;
import com.rohan.ecommerce.identity_service.entity.User;
import com.rohan.ecommerce.identity_service.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final UserDetailsService userDetailsService;

    @Transactional
    public UserResponse register(RegisterRequest request) {

        if (userRepository.existsByUsername(request.getUsername())) {
            throw new ResourceAlreadyExistsException(
                    "Username already taken: " + request.getUsername()
            );
        }

        if (userRepository.existsByEmail(request.getEmail())) {
            throw new ResourceAlreadyExistsException(
                    "Email already registered: " + request.getEmail()
            );
        }

        Role role = Role.CUSTOMER;
        if (request.getRole() != null) {
            try {
                role = Role.valueOf(request.getRole().toUpperCase());
            } catch (IllegalArgumentException e) {
                log.warn(
                        "Unknown role '{}' in register request, defaulting to CUSTOMER",
                        request.getRole()
                );
            }
        }


        User user = User.builder()
                .username(request.getUsername())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .firstName(request.getFirstName())
                .lastName(request.getLastName())
                .role(role)
                .build();

        /*
         * save() performs an INSERT because this entity has no id yet.
         * JPA detects this via the null id field and issues INSERT.
         * The returned entity has the database-generated id populated.
         */
        User saved = userRepository.save(user);
        log.info("Registered new user: username={}, role={}",
                saved.getUsername(), saved.getRole());

        return toUserResponse(saved);
    }

    public AuthResponse login(LoginRequest request) {

        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );

        User user = userRepository
                .findByUsername(request.getUsername())
                .orElseThrow(() -> new ResourceNotFoundException(
                        "User not found: " + request.getUsername()
                ));

        UserDetails userDetails =
                userDetailsService.loadUserByUsername(request.getUsername());

        Map<String, Object> extraClaims = new HashMap<>();
        extraClaims.put("role", user.getRole().name());
        extraClaims.put("email", user.getEmail());

        String token = jwtService.generateToken(extraClaims, userDetails);

        log.info("User logged in: username={}", user.getUsername());


        return AuthResponse.builder()
                .token(token)
                .tokenType("Bearer")
                .username(user.getUsername())
                .email(user.getEmail())
                .role(user.getRole().name())
                .expiresIn(jwtService.getExpirationSeconds())
                .build();
    }

    public UserResponse getUserByUsername(String username) {
        User user = userRepository
                .findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "User not found: " + username
                ));
        return toUserResponse(user);
    }


    private UserResponse toUserResponse(User user) {
        return UserResponse.builder()
                .id(user.getId())
                .username(user.getUsername())
                .email(user.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .role(user.getRole().name())
                .enabled(user.isEnabled())
                .build();
    }
}
