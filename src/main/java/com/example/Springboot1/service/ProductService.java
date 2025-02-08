package com.example.Springboot1.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.Springboot1.domain.Product;
import com.example.Springboot1.repository.ProductRepository;

@Service
public class ProductService {
    //
    private final ProductRepository productRepository;

    // constructor
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    // save all
    public Product saveAll(Product product) {
        return this.productRepository.save(product);
    }

    // find all
    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    // find by id
    public Product findById(Long id) {
        return this.productRepository.findById(id).get();
    }

    // delelte
    public void deleteById(Long id) {
        this.productRepository.deleteById(id);
    }
}
