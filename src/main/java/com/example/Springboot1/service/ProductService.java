package com.example.Springboot1.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.Springboot1.domain.Cart;
import com.example.Springboot1.domain.CartDetail;
import com.example.Springboot1.domain.Product;
import com.example.Springboot1.domain.User;
import com.example.Springboot1.repository.CartDetailRepository;
import com.example.Springboot1.repository.CartRepository;

import com.example.Springboot1.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    //
    private final ProductRepository productRepository;
    private final CartDetailRepository cartDetailRepository;
    private final CartRepository CartRepository;
    private final UserService userService;

    // constructor
    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.CartRepository = cartRepository;
        this.userService = userService;
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

    public void addProducttoCart(String email, Long id, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.CartRepository.findByUser(user);
            if (cart == null) {

                // tao moi cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.CartRepository.save(otherCart);
            }
            Product p = this.productRepository.findById(id).get();

            // check quantity

            boolean isExistProductIncart = this.cartDetailRepository.existsByCartAndProduct(cart, p);

            //
            CartDetail cart_Detail = this.cartDetailRepository.findByCartAndProduct(cart, p);
            if (cart_Detail == null) {
                CartDetail cartDetail = new CartDetail();
                cartDetail.setCart(cart);
                cartDetail.setProduct(p);
                cartDetail.setPrice(p.getPrice());
                cartDetail.setQuantity(1L);
                this.cartDetailRepository.save(cartDetail);
                // update sum
                int sum = cart.getSum() + 1;
                cart.setSum(sum);
                this.CartRepository.save(cart);
                // update session
                session.setAttribute("sum", sum); // anh xa qua view
                // khong tang duoi vi tong no da tang
            } else {
                cart_Detail.setQuantity(cart_Detail.getQuantity() + 1);
                this.cartDetailRepository.save(cart_Detail);
            }

        }
    }
}
