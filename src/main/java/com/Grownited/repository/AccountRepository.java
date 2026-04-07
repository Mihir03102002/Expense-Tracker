package com.Grownited.repository;

import java.util.List;

import org.springframework.data.domain.Page;        // ✅ ADDED
import org.springframework.data.domain.Pageable;   // ✅ ADDED
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.AccountEntity;

@Repository
public interface AccountRepository extends JpaRepository<AccountEntity, Integer>{

    List<AccountEntity> findByUserId(Integer userId);

    @Query("SELECT SUM(a.amount) FROM AccountEntity a")
    Double getTotalBalance();

    // 🔍 SEARCH + PAGINATION (NEW)
    Page<AccountEntity> findByTitleContainingIgnoreCase(String title, Pageable pageable);
    
 // Pagination + User filter
    Page<AccountEntity> findByUserId(Integer userId, Pageable pageable);

    // Search + Pagination
    Page<AccountEntity> findByUserIdAndTitleContainingIgnoreCase(
            Integer userId, String title, Pageable pageable);
}