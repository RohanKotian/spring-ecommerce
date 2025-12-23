package com.rohan.ecommerce.email_service.kafka;

import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class EmailConsumer {

    @KafkaListener(topics = "order-topic", groupId = "email-group")
    public void consume(String message) {
        log.info("Sending email for order: {}", message);
    }
}
