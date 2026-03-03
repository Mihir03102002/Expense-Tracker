package com.Grownited.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.UserEntity;

public interface ExpenseRepository extends JpaRepository<ExpenseEntity, Integer> {

    @Query("SELECT SUM(e.amount) FROM ExpenseEntity e WHERE e.date BETWEEN :startDate AND :endDate")
    Double sumExpenseBetweenDates(@Param("startDate") LocalDate startDate,
                                  @Param("endDate") LocalDate endDate);


    @Query("SELECT e.category.categoryName, SUM(e.amount) " +
           "FROM ExpenseEntity e " +
           "WHERE e.date BETWEEN :startDate AND :endDate " +
           "GROUP BY e.category.categoryName " +
           "ORDER BY SUM(e.amount) DESC")
    List<Object[]> findTopExpenseCategory(@Param("startDate") LocalDate startDate,
                                          @Param("endDate") LocalDate endDate);
    
    List<ExpenseEntity> findByUser(UserEntity user);
}