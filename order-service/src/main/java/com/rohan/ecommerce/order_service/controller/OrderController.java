package com.rohan.ecommerce.order_service.controller;

import com.rohan.ecommerce.order_service.entity.Order;
import com.rohan.ecommerce.order_service.kafka.OrderProducer;
import com.rohan.ecommerce.order_service.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderRepository repository;
    private final OrderProducer producer;

    @PostMapping
    public Order save(@RequestBody Order order) {
        Order saved = repository.save(order);
//        producer.sendOrder(saved);
        return saved;
    }
}
