package com.example.Springboot1.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.Springboot1.domain.Product;
import com.example.Springboot1.service.ProductService;

@Controller
public class ItemController {

    //
    private ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("product/{id}")
    public String getProductPage(Model model, @PathVariable Long id) {
        Product product = this.productService.findById(id);
        model.addAttribute("id", id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

}
