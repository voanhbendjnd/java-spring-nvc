package com.example.Springboot1.service.sepecification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.example.Springboot1.domain.Product;
import com.example.Springboot1.domain.Product_;

import jakarta.persistence.criteria.CriteriaBuilder;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> priceMin(Integer price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThanOrEqualTo(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> priceMax(Integer price) {
        return (root, query, cb) -> cb.lessThanOrEqualTo(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> factoryEqual(String factory) {
        return (root, query, cb) -> cb.equal(root.get(Product_.FACTORY), factory);
    }

    // list factory'
    public static Specification<Product> factoryIn(List<String> factories) {
        return (r, q, cb) -> {
            CriteriaBuilder.In<String> wop = cb.in(r.get("factory"));
            for (String x : factories) {
                wop.value(x);
            }
            return wop;
        };
    }

    // list factory with in
    public static Specification<Product> factoryInP(List<String> factories) {
        return (r, q, cb) -> cb.in(r.get(Product_.FACTORY)).value(factories);
    }

    public static Specification<Product> targetInP(List<String> factories) {
        return (r, q, cb) -> cb.in(r.get(Product_.TARGET)).value(factories);
    }

    public static Specification<Product> priceFromTo(Integer from, Integer to) {
        return (r, q, cb) -> cb.and(
                cb.gt(r.get(Product_.PRICE), from),
                cb.le(r.get(Product_.PRICE), to));
    }

    public static Specification<Product> funtionBetween(Integer min, Integer max) {
        return (root, query, cb) -> cb.between(root.get(Product_.PRICE), min, max);
    }

}