package com.example.Springboot1.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.Springboot1.domain.Product;
import com.example.Springboot1.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product saveAll(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> findAll() {
        return this.productRepository.findAll();
    }
}
