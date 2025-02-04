package com.example.Springboot1.service;

import org.springframework.stereotype.Service;

import com.example.Springboot1.domain.Role;
import com.example.Springboot1.repository.RoleRepository;

@Service
public class RoleService {
    private RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role findByName(String name) {
        return this.roleRepository.findByName(name);
    }
}
