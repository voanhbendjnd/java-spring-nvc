package com.example.Springboot1.controller.client;

import org.springframework.web.bind.annotation.RestController;

import com.example.Springboot1.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

class CartRequest {
    private Long quantity;

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    private Long productId;

}

@RestController
public class CartAPI {
    private final ProductService productService;

    public CartAPI(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/api/add-product-to-cart")
    public ResponseEntity<Integer> postMethodName(
            @RequestBody() CartRequest cartRequest,
            HttpServletRequest request) {
        // TODO: process POST request
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.addProducttoCart(email, cartRequest.getProductId(), session);

        int sum = (int) session.getAttribute("sum");
        return ResponseEntity.ok().body(sum);
    }

}
