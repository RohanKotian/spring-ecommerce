package com.rohan.ecommerce.api_gateway.filter;

import com.rohan.ecommerce.api_gateway.util.JwtUtil;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;


@Component
@Slf4j
public class AuthenticationFilter
        extends AbstractGatewayFilterFactory<AuthenticationFilter.Config> {

    @Autowired
    private RouteValidator routeValidator;

    @Autowired
    private JwtUtil jwtUtil;

    public AuthenticationFilter() {
        super(Config.class);
    }

    @Override
    public GatewayFilter apply(Config config) {
        return (exchange, chain) -> {

            ServerHttpRequest request = exchange.getRequest();

            if (routeValidator.isSecured.test(request)) {

                if (!request.getHeaders()
                        .containsKey(HttpHeaders.AUTHORIZATION)) {
                    return onError(
                            exchange,
                            "Missing Authorization header",
                            HttpStatus.UNAUTHORIZED
                    );
                }

                String authHeader = request.getHeaders()
                        .getFirst(HttpHeaders.AUTHORIZATION);

                if (authHeader == null
                        || !authHeader.startsWith("Bearer ")) {
                    return onError(
                            exchange,
                            "Invalid Authorization header format",
                            HttpStatus.UNAUTHORIZED
                    );
                }

                String token = authHeader.substring(7);

                try {
                    jwtUtil.validateToken(token);

                    String username = jwtUtil.extractUsername(token);
                    String role = jwtUtil.extractRole(token);

                    ServerHttpRequest mutatedRequest = request.mutate()
                            .header("X-User-Name", username)
                            .header("X-User-Role",
                                    role != null ? role : "")
                            .build();

                    log.debug(
                            "JWT validated — user='{}' role='{}' path='{}'",
                            username,
                            role,
                            request.getURI().getPath()
                    );

                    return chain.filter(
                            exchange.mutate()
                                    .request(mutatedRequest)
                                    .build()
                    );

                } catch (Exception e) {
                    log.warn(
                            "JWT validation failed for path '{}': {}",
                            request.getURI().getPath(),
                            e.getMessage()
                    );
                    return onError(
                            exchange,
                            "Invalid or expired JWT token",
                            HttpStatus.UNAUTHORIZED
                    );
                }
            }

            return chain.filter(exchange);
        };
    }
    private Mono<Void> onError(ServerWebExchange exchange,
                               String message,
                               HttpStatus status) {
        ServerHttpResponse response = exchange.getResponse();
        response.setStatusCode(status);
        log.warn("Auth error [{}]: {}", status.value(), message);
        return response.setComplete();
    }
    
    public static class Config {
    }
}