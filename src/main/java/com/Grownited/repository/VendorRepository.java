package com.Grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Grownited.entity.UserEntity;
import com.Grownited.entity.VendorEntity;

public interface VendorRepository extends JpaRepository<VendorEntity, Integer> {

    // 🔥 Fetch only logged-in user's vendors
    List<VendorEntity> findByUser(UserEntity user);
}