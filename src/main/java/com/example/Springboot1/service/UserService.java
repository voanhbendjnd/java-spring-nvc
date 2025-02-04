package com.example.Springboot1.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.Springboot1.domain.Role;
import com.example.Springboot1.domain.User;
import com.example.Springboot1.repository.RoleRepository;
import com.example.Springboot1.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public String getUserName() {
        return "Hello world";
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByEmailAndAddress(String email, String address) {
        return this.userRepository.findByEmailAndAddress(email, address);
    }

    public User findById(Long id) {
        return this.userRepository.findById(id).get();
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public void deleteById(Long id) {
        this.userRepository.deleteById(id);
    }

    public Role findByName(String name) {
        return this.roleRepository.findByName(name);
    }

   

}
