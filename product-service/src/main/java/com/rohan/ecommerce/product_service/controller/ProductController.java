package com.rohan.ecommerce.product_service.controller;

import com.rohan.ecommerce.product_service.entity.Product;
import com.rohan.ecommerce.product_service.repository.ProductRepository;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductRepository repository;

    @PostMapping
    public Product create(@RequestBody Product product) {
        return repository.save(product);
    }

    @GetMapping
    public List<Product> all() {
        return repository.findAll();
    }

}
