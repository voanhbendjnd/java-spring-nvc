package com.example.Springboot1.service;

import java.util.List;
import java.util.Optional;

import org.springframework.core.Ordered;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.Springboot1.domain.Cart;
import com.example.Springboot1.domain.CartDetail;
import com.example.Springboot1.domain.Order;
import com.example.Springboot1.domain.OrderDetail;
import com.example.Springboot1.domain.Product;
import com.example.Springboot1.domain.Product_;
import com.example.Springboot1.domain.User;
import com.example.Springboot1.domain.dto.ProductCriteriaDTO;
import com.example.Springboot1.repository.CartDetailRepository;
import com.example.Springboot1.repository.CartRepository;
import com.example.Springboot1.repository.OrderDetailRepository;
import com.example.Springboot1.repository.OrderRepository;
import com.example.Springboot1.repository.ProductRepository;
import com.example.Springboot1.service.sepecification.ProductSpecs;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    //
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(
            ProductRepository productRepository,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserService userService,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
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

    // name
    public Page<Product> findAllWithSpec(Pageable page, String name) {
        return this.productRepository.findAll(ProductSpecs.nameLike(name), page);
    }

    private Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }
    // end name

    // min price
    public Page<Product> findAllWithSpec(Pageable page, Integer price) {
        return this.productRepository.findAll(ProductSpecs.priceMin(price), page);
    }

    public Specification<Product> priceMin(Integer price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThanOrEqualTo(root.get(Product_.PRICE), price);
    }

    // end min price
    public Page<Product> findAll(Pageable page) {
        return this.productRepository.findAll(page);
    }

    // max price
    public Page<Product> findAllWithFilterMaxValue(Pageable page, Integer price) {
        return this.productRepository.findAll(ProductSpecs.priceMax(price), page);
    }

    // factory
    public Page<Product> findAllByFactory(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getFactory() == null && productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(page);

        }
        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpec = ProductSpecs.targetInP(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpec = ProductSpecs.factoryInP(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpec = this.buildPriceFilter(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }

        return this.productRepository.findAll(combinedSpec, page);
    }

    // factory in
    public Page<Product> findAllFactoryIn(Pageable pageable, List<String> factories) {
        return this.productRepository.findAll(ProductSpecs.factoryIn(factories), pageable);
    }

    public Page<Product> findAllFactoryInP(Pageable pageable, List<String> factories) {
        return this.productRepository.findAll(ProductSpecs.factoryInP(factories), pageable);
    }

    // public Specification<Product> priceMaxValue(Integer price) {
    // return (root, query, cb) -> cb.lessThanOrEqualTo(root.get(Product_.PRICE),
    // price);
    // }
    // end max price

    public Page<Product> findAllFormTo(Pageable pageable, String price) {
        if (price.equals("10-toi-15-trieu")) {
            Integer from = 10000000;
            Integer to = 15000000;
            return this.productRepository.findAll(ProductSpecs.priceFromTo(from, to), pageable);
        } else if (price.equals("20-toi-30-trieu")) {
            Integer from = 20000000;
            Integer to = 30000000;
            return this.productRepository.findAll(ProductSpecs.priceFromTo(from, to), pageable);
        } else {
            return this.productRepository.findAll(pageable);
        }

    }

    public void addProducttoCart(String email, long productId, HttpSession session) {

        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user đã có Cart chưa ? nếu chưa -> tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // save cart_detail
            // tìm product by id

            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();

                // check sản phẩm đã từng được thêm vào giỏ hàng trước đây chưa ?
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                //
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1L);
                    this.cartDetailRepository.save(cd);

                    // update cart (sum);
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }
    }

    public Specification<Product> buildPriceFilter(List<String> price) {
        // public Page<Product> fetchProductWithSpec(Pageable pageable, List<String>
        // price) {

        // can use
        // Specification<Product> specs = Specification.where(null);
        Specification<Product> specs = (root, query, cb) -> cb.disjunction();
        int cnt = 0;
        for (String x : price) {
            Integer min = 0;
            Integer max = 0;
            switch (x) {
                case "10-toi-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    // ++cnt;
                    break;
                case "20-toi-30-trieu":
                    min = 20000000;
                    max = 30000000;
                    // ++cnt;
                    break;
                case "duoi-10-trieu":
                    min = 1;
                    max = 10000000;
                    break;
                case "15-toi-20-trieu":
                    min = 15000000;
                    max = 20000000;
                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = 200000000;
                    break;
            }
            if (min != 0 && max != 0) {
                Specification<Product> spec = ProductSpecs.priceFromTo(min, max);
                specs = specs.or(spec);
            }
        }
        // if (cnt == 0) {
        // return this.productRepository.findAll(pageable);
        // }
        // return this.productRepository.findAll(specs, pageable);
        return specs;
    }

    public Page<Product> functionTaiTao(Pageable pageable, List<String> price) {
        Specification<Product> specs = (r, q, cb) -> cb.disjunction();
        boolean check = false;
        for (String x : price) {
            Integer min = 0;
            Integer max = 0;
            switch (x) {
                case "10-toi-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    check = true;
                    break;
                case "20-toi-30-trieu":
                    min = 20000000;
                    max = 30000000;
                    check = true;
                    break;
            }
            if (check) {
                Specification<Product> spec = ProductSpecs.funtionBetween(min, max);
                specs = specs.or(spec);
            }
        }
        if (!check) {
            return this.productRepository.findAll(pageable);
        }

        return this.productRepository.findAll(specs, pageable);
    }

    public Cart findByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void deleteCartDetail(Long cartDetailId, HttpSession session) {
        CartDetail cartDetail = this.cartDetailRepository.findById(cartDetailId).get();
        Cart cart = cartDetail.getCart();
        this.cartDetailRepository.deleteById(cartDetailId);
        if (cart.getSum() > 1) {
            int sum = cart.getSum() - 1;
            session.setAttribute("sum", sum);
            cart.setSum(sum);
            this.cartRepository.save(cart);
        } else {
            this.cartRepository.deleteById(cartDetail.getCart().getId());
            session.setAttribute("sum", 0);
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {

        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone) {
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(receiverName);
        order.setReceiverAddress(receiverAddress);
        order.setReceiverPhone(receiverPhone);
        order = this.orderRepository.save(order);
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                    session.setAttribute("sum", 0);
                }
            }
        }

    }

}
