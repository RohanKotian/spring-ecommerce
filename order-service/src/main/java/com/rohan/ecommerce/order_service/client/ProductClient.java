package com.rohan.ecommerce.order_service.client;

import com.rohan.ecommerce.order_service.dto.ProductResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "product-service", fallback = ProductClientFallback.class)
public interface ProductClient {

    @GetMapping("/api/v1/products/{productId}")
    ProductResponse getProductById(@PathVariable("productId") Long productId);

    @PutMapping("/api/v1/products/{productId}/reduce-stock")
    void reduceStock(
            @PathVariable("productId") Long productId,
            @RequestParam("quantity") int quantity
    );
}
