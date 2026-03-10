package com.Grownited.controller.Admin;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.CategoryEntity;
import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.StatusEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.entity.VendorEntity;
import com.Grownited.repository.AccountRepository;
import com.Grownited.repository.CategoryRepository;
import com.Grownited.repository.ExpenseRepository;
import com.Grownited.repository.StatusRepository;
import com.Grownited.repository.SubCategoryRepository;
import com.Grownited.repository.VendorRepository;

@Controller
public class ExpenseController {

    @Autowired
    private ExpenseRepository expenseRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private SubCategoryRepository subCategoryRepository;

    @Autowired
    private VendorRepository vendorRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private StatusRepository statusRepository;

    // ================= OPEN EXPENSE PAGE =================
    @GetMapping("/admin/expense")
    public String openExpensePage(Model model) {

        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("subCategories", subCategoryRepository.findAll());
        model.addAttribute("vendors", vendorRepository.findAll());
        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Admin/Expense";
    }

    // ================= SAVE EXPENSE =================
    @PostMapping("/admin/expense/save")
    public String saveExpense(ExpenseEntity expense, HttpSession session) {

        // 🔥 Get logged-in user from session
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        expense.setUser(user);

        // Fetch full objects from DB
        CategoryEntity category = categoryRepository
                .findById(expense.getCategory().getCategoryId())
                .orElse(null);

        VendorEntity vendor = vendorRepository
                .findById(expense.getVendor().getVendorId())
                .orElse(null);

        StatusEntity status = statusRepository
                .findById(expense.getStatus().getStatusId())
                .orElse(null);

        if (category == null || vendor == null || status == null) {
            return "redirect:/admin/expense";
        }

        expense.setCategory(category);
        expense.setVendor(vendor);
        expense.setStatus(status);

        expenseRepository.save(expense);

        return "redirect:/admin/expense-list";
    }

    // ================= EXPENSE LIST =================
    @GetMapping("/admin/expense-list")
    public String expenseList(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("expenseList",
                expenseRepository.findByUser(user));

        return "Admin/ExpenseList";
    }

    // ================= DELETE EXPENSE =================
    @GetMapping("/admin/expense/delete")
    public String deleteExpense(@RequestParam Integer expenseId) {

        if (expenseRepository.existsById(expenseId)) {
            expenseRepository.deleteById(expenseId);
        }

        return "redirect:/admin/expense-list";
    }
}