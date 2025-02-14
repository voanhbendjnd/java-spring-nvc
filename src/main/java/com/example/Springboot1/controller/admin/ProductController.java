package com.example.Springboot1.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import jakarta.*;
import jakarta.validation.Valid;

import com.example.Springboot1.domain.Product;

import com.example.Springboot1.service.ProductService;

import com.example.Springboot1.service.UploadService;

@Controller
public class ProductController {
    private final ProductService productService;

    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // , defaultValue = "1"
    // hien thi
    @GetMapping("/admin/product")
    public String getDashboardProduct(Model model,
            @RequestParam(name = "page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            } else {

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        org.springframework.data.domain.Pageable pageable = PageRequest.of(page - 1, 2);

        Page<Product> pr = this.productService.findAll(pageable);

        List<Product> listPro = pr.getContent();
        model.addAttribute("tableProduct", listPro);
        model.addAttribute("totalPages", pr.getTotalPages());
        model.addAttribute("currentPage", page);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/createNew") // hien thi form tai moi san pham
    public String createProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create"; // tim file
    }

    @PostMapping("/admin/product/createPost")
    public String getProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("productFile") MultipartFile file) {
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " + error.getDefaultMessage() + "<<<<");
            System.out.println();
        }
        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/create"; // dung redirect se lm mat du lieu
        }
        String imageProduct = this.uploadService.handleSaveUploadFile(file, "product");

        product.setImage(imageProduct);

        // hoidanit.setRole(this.userService.findByName(hoidanit.getRole().getName()));
        this.productService.saveAll(product);
        return "redirect:/admin/product";
    }

    // update
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProduct(Model model, @PathVariable Long id) {
        model.addAttribute("updateProduct", this.productService.findById(id));
        return "admin/product/update";
    }
    // lấy dữ liệu từ form được gọi là modelAttribute

    @PostMapping("/admin/product/update")
    public String updateProduct(@ModelAttribute("updateProduct") Product product,
            @RequestParam("productFile") MultipartFile file) {
        Product updateProduct = this.productService.findById(product.getId());
        updateProduct.setName(product.getName());
        updateProduct.setDetailDesc(product.getDetailDesc());
        updateProduct.setFactory(product.getFactory());
        updateProduct.setPrice(product.getPrice());
        updateProduct.setQuantity(product.getQuantity());
        updateProduct.setShortDesc(product.getShortDesc());

        updateProduct.setSold(1L);
        updateProduct.setTarget(product.getTarget());
        if (!file.isEmpty()) {
            try {
                String image = this.uploadService.handleSaveUploadFile(file, "product");

                updateProduct.setImage(image);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        this.productService.saveAll(updateProduct);
        return "redirect:/admin/product";
    }

    // Delete
    @GetMapping("/admin/product/delete/{id}")
    public String formDeleteProduct(Model model, @PathVariable Long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/deleteProduct")
    public String deleteProduct(Model model, @ModelAttribute("newProduct") Product product) {
        // TODO: process POST request
        this.productService.deleteById(product.getId());
        return "redirect:/admin/product";
    }

    // detail
    @GetMapping("/admin/product/{id}")
    public String viewDetailProduct(Model model, @PathVariable Long id) {
        model.addAttribute("product", this.productService.findById(id));

        return "admin/product/detail";
    }

}
