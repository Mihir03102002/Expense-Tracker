package com.Grownited.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Grownited.entity.IncomeEntity;
import com.Grownited.entity.UserEntity;

public interface IncomeRepository extends JpaRepository<IncomeEntity, Integer> {

    @Query("SELECT SUM(i.amount) FROM IncomeEntity i WHERE i.date BETWEEN :startDate AND :endDate")
    Double sumIncomeBetweenDates(@Param("startDate") LocalDate startDate,
                                 @Param("endDate") LocalDate endDate);
    
    List<IncomeEntity> findByUser(UserEntity user);
}