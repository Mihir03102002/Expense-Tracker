package com.Grownited.controller;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.Grownited.repository.ExpenseRepository;
import com.Grownited.repository.IncomeRepository;

@Controller
public class AdminController {

    @Autowired
    private IncomeRepository incomeRepository;

    @Autowired
    private ExpenseRepository expenseRepository;

    @GetMapping(value = { "AdminDashboard", "/" })
    public String adminDashboard(Model model) {

        // ===== Current Month Date Range =====
        YearMonth currentMonth = YearMonth.now();
        LocalDate startDate = currentMonth.atDay(1);
        LocalDate endDate = currentMonth.atEndOfMonth();

        // ===== 1. Total Income (This Month) =====
        Double totalIncome = incomeRepository.sumIncomeBetweenDates(startDate, endDate);
        if (totalIncome == null) {
            totalIncome = 0.0;
        }

        // ===== 2. Total Expense (This Month) =====
        Double totalExpense = expenseRepository.sumExpenseBetweenDates(startDate, endDate);
        if (totalExpense == null) {
            totalExpense = 0.0;
        }

        // ===== 3. Current Balance =====
        Double currentBalance = totalIncome - totalExpense;

        // ===== 4. Top Expense Category =====
        List<Object[]> topCategory = expenseRepository.findTopExpenseCategory(startDate, endDate);

        String topCategoryName = "N/A";
        Double topCategoryAmount = 0.0;

        if (!topCategory.isEmpty()) {
            topCategoryName = (String) topCategory.get(0)[0];
            topCategoryAmount = (Double) topCategory.get(0)[1];
        }

        // ===== Growth Placeholder (Optional) =====
        Double incomeGrowth = 0.0;
        Double expenseGrowth = 0.0;

        // ===== Send Data to JSP =====
        model.addAttribute("totalIncome", totalIncome);
        model.addAttribute("totalExpense", totalExpense);
        model.addAttribute("currentBalance", currentBalance);
        model.addAttribute("topCategoryName", topCategoryName);
        model.addAttribute("topCategoryAmount", topCategoryAmount);
        model.addAttribute("incomeGrowth", incomeGrowth);
        model.addAttribute("expenseGrowth", expenseGrowth);

        return "AdminDashboard";
    }
}