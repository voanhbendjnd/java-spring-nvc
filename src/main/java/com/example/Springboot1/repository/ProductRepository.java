package com.example.Springboot1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Springboot1.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

}
