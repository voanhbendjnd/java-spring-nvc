package com.example.Springboot1.repository;

import org.springframework.stereotype.Repository;

import com.example.Springboot1.domain.Role;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);

}
