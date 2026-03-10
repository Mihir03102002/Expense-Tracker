package com.Grownited.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Grownited.entity.IncomeEntity;
import com.Grownited.entity.UserEntity;

public interface IncomeRepository extends JpaRepository<IncomeEntity, Integer> {

    // Admin
    @Query("""
        select coalesce(sum(i.amount), 0)
        from IncomeEntity i
        where i.date between :startDate and :endDate
    """)
    Double sumIncomeBetweenDates(@Param("startDate") LocalDate startDate,
                                 @Param("endDate") LocalDate endDate);

    // User
    @Query("""
        select coalesce(sum(i.amount), 0)
        from IncomeEntity i
        where i.user.userId = :userId
          and i.date between :startDate and :endDate
    """)
    Double sumIncomeBetweenDatesByUser(@Param("userId") Integer userId,
                                       @Param("startDate") LocalDate startDate,
                                       @Param("endDate") LocalDate endDate);

    // Get all income of a specific user
    List<IncomeEntity> findByUser(UserEntity user);
}