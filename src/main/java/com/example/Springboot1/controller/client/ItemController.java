package com.example.Springboot1.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.Springboot1.domain.Cart;
import com.example.Springboot1.domain.CartDetail;
import com.example.Springboot1.domain.Product;
import com.example.Springboot1.domain.Product_;
import com.example.Springboot1.domain.User;
import com.example.Springboot1.domain.dto.ProductCriteriaDTO;
import com.example.Springboot1.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Page;

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

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        Long productId = id;
        this.productService.addProducttoCart(email, productId, session);
        return "redirect:/";
        // return "client/product/show";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.findByUser(currentUser);
        List<CartDetail> cartDetails;
        if (cart == null) {
            cartDetails = new ArrayList<>();
        } else {
            cartDetails = cart.getCartDetails();
        }
        // List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() :
        // cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/show";
    }

    // product show
    @GetMapping("/product")
    public String getProductPageP(Model model, ProductCriteriaDTO productCriteriaDTO, HttpServletRequest request) {
        int page = 1;
        try {
            page = productCriteriaDTO.getPage().isPresent() ? Integer.parseInt(productCriteriaDTO.getPage().get()) : 1;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        // sort
        Pageable pageable = PageRequest.of(page - 1, 10);
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }
        // Pageable pageable = PageRequest.of(page - 1, 6);
        Page<Product> proList = this.productService.findAllByFactory(pageable, productCriteriaDTO);
        List<Product> products = proList.getContent();
        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }
        model.addAttribute("queryString", qs);
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", proList.getTotalPages());
        return "client/product/show";
    }

    // @GetMapping("/product")
    // public String getProductFilter(
    // Model model,
    // @RequestParam(name = "page") Optional<String> pageOptional,
    // @RequestParam(name = "name") Optional<String> nameOptional,
    // @RequestParam(name = "min-price") Optional<String> priceMinOptional,
    // @RequestParam(name = "max-price") Optional<String> priceMaxOptional,
    // @RequestParam(name = "price") Optional<String> priceOptional,
    // @RequestParam(name = "sort") Optional<String> sortOptional,
    // @RequestParam(name = "factory") Optional<String> factoryOptional) {
    // int page = 1;
    // try {
    // if (pageOptional.isPresent()) {
    // page = Integer.parseInt(pageOptional.get());
    // }
    // } catch (Exception ex) {
    // ex.printStackTrace();
    // }
    // List<String> listParam = Arrays.asList(priceOptional.get().split(","));
    // // List<String> factoryList =
    // Arrays.asList(factoryOptional.get().split(","));
    // // String priceFromTo = priceOptional.isPresent() ? priceOptional.get() : "";
    // Pageable pageable = PageRequest.of(page - 1, 60);
    // // Page<Product> products = this.productService.findAllFactoryInP(pageable,
    // // factoryList);
    // Page<Product> products = this.productService.functionTaiTao(pageable,
    // listParam);
    // List<Product> proList = products.getContent();
    // model.addAttribute("currentPage", page);
    // model.addAttribute("totalPages", products.getTotalPages());
    // model.addAttribute("products", proList);
    // return "client/product/show";
    // }

    // Pageable pageable = PageRequest.of(page - 1, 6);
    // String name = nameOptional.isPresent() ? nameOptional.get() : "";
    // Page<Product> products = this.productService.findAllWithSpec(pageable, name);
    // List<Product> proList = products.getContent();
    // model.addAttribute("products", proList);
    // model.addAttribute("currentPage", page);
    // model.addAttribute("totalPages", products.getTotalPages());
    // return "client/product/show";
    // }

    // @GetMapping("/product")
    // public String getProductFilterMin(
    // Model model,
    // @RequestParam(name = "page") Optional<String> pageOptional,
    // @RequestParam(name = "min-price") Optional<String> priceOptional) {
    // int page = 1;
    // try {
    // if (pageOptional.isPresent()) {
    // page = Integer.parseInt(pageOptional.get());
    // }

    // } catch (Exception ex) {
    // ex.printStackTrace();
    // }
    // Pageable pageable = PageRequest.of(page - 1, 6);
    // int priceMin = 1;
    // try {
    // if (priceOptional.isPresent()) {
    // priceMin = Integer.parseInt(priceOptional.get());
    // }
    // } catch (Exception ex) {
    // ex.printStackTrace();
    // }

    // Page<Product> products = this.productService.findAllWithSpec(pageable,
    // priceMin);
    // List<Product> proList = products.getContent();
    // model.addAttribute("products", proList);
    // model.addAttribute("totalPages", products.getTotalPages());
    // model.addAttribute("currentPage", page);
    // return "client/product/show";
    // }
    // @GetMapping("/product")
    // public String getProductFilterMax(
    // Model model,
    // @RequestParam(name = "page") Optional<String> pageOptional,

    // @RequestParam(name = "max-price") Optional<String> priceOptional) {
    // int page = 1;
    // try {
    // if (pageOptional.isPresent()) {
    // page = Integer.parseInt(pageOptional.get());
    // }
    // } catch (Exception ex) {
    // ex.printStackTrace();
    // }
    // int priceMax = 1;
    // try {
    // if (priceOptional.isPresent()) {
    // priceMax = Integer.parseInt(priceOptional.get());
    // }
    // } catch (Exception ex) {
    // ex.printStackTrace();
    // }
    // Pageable pageable = PageRequest.of(page - 1, 6);
    // Page<Product> products =
    // this.productService.findAllWithFilterMaxValue(pageable, priceMax);
    // List<Product> proList = products.getContent();
    // // List<Product> proList = this.productService.findAll();
    // model.addAttribute("products", proList);
    // model.addAttribute("currentPage", page);
    // model.addAttribute("totalPages", products.getTotalPages());
    // return "client/product/show";
    // }

    // factory
    // @GetMapping("/product")
    // public String getFactoryByFilter(
    // Model model,
    // @RequestParam(name = "page") Optional<String> pageOptional,
    // @RequestParam(name = "factory") Optional<String> factoryOptional) {
    // Integer page = pageOptional.isPresent() ?
    // Integer.parseInt(pageOptional.get()) : null;
    // String factory = factoryOptional.isPresent() ? factoryOptional.get() : "";
    // Pageable pageable = PageRequest.of(page - 1, 6);
    // Page<Product> products = this.productService.findAllByFactory(pageable,
    // factory);
    // List<Product> proList = products.getContent();
    // model.addAttribute("products", proList);
    // model.addAttribute("currentPage", page);
    // model.addAttribute("totalPages", products.getTotalPages());
    // return "client/product/show";
    // }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.deleteCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.findByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        HttpSession session = request.getSession(false);
        User currentUser = new User();
        Long id = (Long) session.getAttribute("id");
        currentUser.setId(id);
        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);

        return "client/cart/thanks";
    }

    @GetMapping("/thanks")
    public String getThanks(Model model) {
        return "client/cart/thanks";
    }

}
