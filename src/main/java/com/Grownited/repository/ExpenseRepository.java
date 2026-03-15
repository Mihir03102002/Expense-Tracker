package com.Grownited.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.UserEntity;

public interface ExpenseRepository extends JpaRepository<ExpenseEntity, Integer> {

    // Admin
    @Query("""
        select coalesce(sum(e.amount), 0)
        from ExpenseEntity e
        where e.date between :startDate and :endDate
    """)
    Double sumExpenseBetweenDates(@Param("startDate") LocalDate startDate,
                                  @Param("endDate") LocalDate endDate);

    @Query("""
        select e.category.categoryName, sum(e.amount)
        from ExpenseEntity e
        where e.date between :startDate and :endDate
        group by e.category.categoryName
        order by sum(e.amount) desc
    """)
    List<Object[]> findTopExpenseCategory(@Param("startDate") LocalDate startDate,
                                          @Param("endDate") LocalDate endDate);

    // User
    @Query("""
        select coalesce(sum(e.amount), 0)
        from ExpenseEntity e
        where e.user.userId = :userId
          and e.date between :startDate and :endDate
    """)
    Double sumExpenseBetweenDatesByUser(@Param("userId") Integer userId,
                                        @Param("startDate") LocalDate startDate,
                                        @Param("endDate") LocalDate endDate);

    @Query("""
        select e.category.categoryName, sum(e.amount)
        from ExpenseEntity e
        where e.user.userId = :userId
          and e.date between :startDate and :endDate
        group by e.category.categoryName
        order by sum(e.amount) desc
    """)
    List<Object[]> findTopExpenseCategoryByUser(@Param("userId") Integer userId,
                                                @Param("startDate") LocalDate startDate,
                                                @Param("endDate") LocalDate endDate);

    // Get all expenses of a specific user
    List<ExpenseEntity> findByUser(UserEntity user);

	boolean existsByAccountAccountId(Integer accountId);
    
    
}