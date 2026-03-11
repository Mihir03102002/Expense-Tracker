package com.Grownited.controller.User;

import java.time.LocalDate;
import java.time.YearMonth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.Grownited.entity.UserEntity;
import com.Grownited.repository.ExpenseRepository;
import com.Grownited.repository.IncomeRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private ExpenseRepository expenseRepository;

    @Autowired
    private IncomeRepository incomeRepository;

    // ================= USER DASHBOARD =================
    @GetMapping("/user/dashboard")
    public String userDashboard(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if(user == null) {
            return "redirect:/login";
        }

        Integer userId = user.getUserId();

        // CURRENT MONTH
        YearMonth month = YearMonth.now();
        LocalDate startDate = month.atDay(1);
        LocalDate endDate = month.atEndOfMonth();

        Double monthExpense = expenseRepository.sumExpenseBetweenDatesByUser(userId,startDate,endDate);
        Double monthIncome = incomeRepository.sumIncomeBetweenDatesByUser(userId,startDate,endDate);

        if(monthExpense == null) monthExpense = 0.0;
        if(monthIncome == null) monthIncome = 0.0;

        // QUARTER
        LocalDate quarterStart = LocalDate.now().minusMonths(3);

        Double quarterExpense = expenseRepository.sumExpenseBetweenDatesByUser(userId,quarterStart,endDate);
        Double quarterIncome = incomeRepository.sumIncomeBetweenDatesByUser(userId,quarterStart,endDate);

        if(quarterExpense == null) quarterExpense = 0.0;
        if(quarterIncome == null) quarterIncome = 0.0;

        model.addAttribute("monthExpense", monthExpense);
        model.addAttribute("quarterExpense", quarterExpense);
        model.addAttribute("monthIncome", monthIncome);
        model.addAttribute("quarterIncome", quarterIncome);

        return "User/UserDashboard";
    }

    // ================= LOGOUT =================
    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();   // destroy session

        return "redirect:/login";
    }
}