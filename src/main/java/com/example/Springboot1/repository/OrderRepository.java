package com.example.Springboot1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Springboot1.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

}
