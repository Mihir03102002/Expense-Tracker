package com.Grownited.controller.User;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.*;
import com.Grownited.repository.*;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserExpenseController {

    @Autowired
    ExpenseRepository expenseRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    SubCategoryRepository subCategoryRepository;

    @Autowired
    VendorRepository vendorRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    StatusRepository statusRepository;


    // =============================
    // OPEN ADD EXPENSE PAGE
    // =============================
    @GetMapping("/addExpense")
    public String addExpensePage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("subCategories", subCategoryRepository.findAll());
        model.addAttribute("vendors", vendorRepository.findAll());

        // ✅ FIX: show only logged-in user's accounts
        model.addAttribute("accounts",
                accountRepository.findByUserId(user.getUserId()));

        model.addAttribute("statuses", statusRepository.findAll());

        model.addAttribute("expense", new ExpenseEntity());

        return "User/AddExpense";
    }


    // =============================
    // SAVE EXPENSE
    // =============================
    @PostMapping("/saveExpense")
    public String saveExpense(@ModelAttribute ExpenseEntity expense,
                              HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        expense.setUser(user);

        expenseRepository.save(expense);

        return "redirect:/user/expenseList";
    }


    // =============================
    // USER EXPENSE LIST
    // =============================
    @GetMapping("/expenseList")
    public String expenseList(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<ExpenseEntity> expenses = expenseRepository.findByUser(user);

        model.addAttribute("expenses", expenses);

        return "User/UserExpenseList";
    }


    // =============================
    // DELETE EXPENSE (SECURE)
    // =============================
    @GetMapping("/deleteExpense")
    public String deleteExpense(@RequestParam Integer expenseId,
                                HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        Optional<ExpenseEntity> expenseOpt =
                expenseRepository.findById(expenseId);

        if (expenseOpt.isPresent()) {

            ExpenseEntity expense = expenseOpt.get();

            // ✅ Ensure user deletes only their expense
            if (expense.getUser().getUserId()
                    .equals(user.getUserId())) {

                expenseRepository.deleteById(expenseId);
            }
        }

        return "redirect:/user/expenseList";
    }

}