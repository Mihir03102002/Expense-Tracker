package com.Grownited.controller.Admin;

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

    @GetMapping(value =  {"/admin/dashboard","/"})
   
    public String adminDashboard(Model model) {

        YearMonth currentMonth = YearMonth.now();
        LocalDate startDate = currentMonth.atDay(1);
        LocalDate endDate = currentMonth.atEndOfMonth();

        Double totalIncome = incomeRepository.sumIncomeBetweenDates(startDate, endDate);
        if (totalIncome == null) {
            totalIncome = 0.0;
        }

        Double totalExpense = expenseRepository.sumExpenseBetweenDates(startDate, endDate);
        if (totalExpense == null) {
            totalExpense = 0.0;
        }

        Double currentBalance = totalIncome - totalExpense;

        List<Object[]> topCategory = expenseRepository.findTopExpenseCategory(startDate, endDate);

        String topCategoryName = "N/A";
        Double topCategoryAmount = 0.0;

        if (!topCategory.isEmpty()) {
            topCategoryName = (String) topCategory.get(0)[0];
            topCategoryAmount = (Double) topCategory.get(0)[1];
        }

        Double incomeGrowth = 0.0;
        Double expenseGrowth = 0.0;

        model.addAttribute("totalIncome", totalIncome);
        model.addAttribute("totalExpense", totalExpense);
        model.addAttribute("currentBalance", currentBalance);
        model.addAttribute("topCategoryName", topCategoryName);
        model.addAttribute("topCategoryAmount", topCategoryAmount);
        model.addAttribute("incomeGrowth", incomeGrowth);
        model.addAttribute("expenseGrowth", expenseGrowth);

        return "Admin/AdminDashboard";
    }
}