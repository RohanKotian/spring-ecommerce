package com.rohan.ecommerce.payment_service.kafka;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PaymentConsumer {

    @KafkaListener(topics = "order-topic", groupId = "payment-group")
    public void consume(Order order) {
        log.info("Processing payment for order {}", order.getId());
    }
}
