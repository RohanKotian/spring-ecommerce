package com.rohan.ecommerce.order_service.client;

import com.rohan.ecommerce.order_service.dto.ProductResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class ProductClientFallback implements ProductClient{

    @Override
    public ProductResponse getProductById(Long productId) {
        log.error(
                "FALLBACK: product-service unavailable — " +
                        "could not fetch product id={}",
                productId
        );

        ProductResponse fallback = new ProductResponse();
        fallback.setId(productId);
        fallback.setName("UNAVAILABLE");
        fallback.setAvailable(false);
        fallback.setStockQuantity(0);
        return fallback;
    }

    @Override
    public void reduceStock(Long productId, int quantity) {
        log.error(
                "FALLBACK: product-service unavailable — " +
                        "could not reduce stock for product id={} quantity={}",
                productId,
                quantity
        );

        throw new RuntimeException(
                "Product service is currently unavailable. " +
                        "Stock reduction failed for product id=" + productId +
                        ". Please retry the order."
        );
    }
}