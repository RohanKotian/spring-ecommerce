package com.rohan.ecommerce.order_service.repository;

import com.rohan.ecommerce.order_service.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order,Integer> {
}
