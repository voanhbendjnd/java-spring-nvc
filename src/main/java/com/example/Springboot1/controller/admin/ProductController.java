package com.example.Springboot1.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.Springboot1.domain.Product;
import com.example.Springboot1.domain.User;
import com.example.Springboot1.repository.ProductRepository;
import com.example.Springboot1.service.ProductService;
import com.example.Springboot1.service.RoleService;
import com.example.Springboot1.service.UploadService;

@Controller
public class ProductController {
    private final ProductService productService;

    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // hien thi
    @GetMapping("/admin/product") // link
    public String getDashboardProduct(Model model) {
        model.addAttribute("tableProduct", this.productService.findAll()); // lay du lieu tu database hien thi
        return "admin/product/show"; // tra về
    }

    @GetMapping("/admin/product/createNew") // hien thi form tai moi san pham
    public String createProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create"; // tim file
    }

    @PostMapping("/admin/product/createPost")
    public String getProduct(Model model,
            @ModelAttribute("newProduct") Product product,
            @RequestParam("productFile") MultipartFile file) {
        String imageProduct = this.uploadService.handleSaveUploadFile(file, "product");

        product.setImage(imageProduct);

        // hoidanit.setRole(this.userService.findByName(hoidanit.getRole().getName()));
        this.productService.saveAll(product);
        return "redirect:/admin/product";
    }

}
