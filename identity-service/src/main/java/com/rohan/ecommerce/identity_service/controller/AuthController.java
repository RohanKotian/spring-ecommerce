package com.rohan.ecommerce.identity_service.controller;

import com.rohan.ecommerce.identity_service.dto.AuthResponse;
import com.rohan.ecommerce.identity_service.dto.LoginRequest;
import com.rohan.ecommerce.identity_service.dto.RegisterRequest;
import com.rohan.ecommerce.identity_service.dto.UserResponse;
import com.rohan.ecommerce.identity_service.service.AuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/register")
    public ResponseEntity<UserResponse> register(
            @Valid @RequestBody RegisterRequest request) {

        UserResponse response = authService.register(request);
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(
            @Valid @RequestBody LoginRequest request) {

        AuthResponse response = authService.login(request);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/me")
    public ResponseEntity<UserResponse> getCurrentUser(
            @AuthenticationPrincipal UserDetails userDetails) {

        UserResponse response =
                authService.getUserByUsername(userDetails.getUsername());
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/users/{username}")
    public ResponseEntity<UserResponse> getUserByUsername(
            @PathVariable String username) {

        UserResponse response = authService.getUserByUsername(username);
        return ResponseEntity.ok(response);
    }
}