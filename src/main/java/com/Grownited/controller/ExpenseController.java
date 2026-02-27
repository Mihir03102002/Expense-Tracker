package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.CategoryEntity;
import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.StatusEntity;
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
    @GetMapping("/expense")
    public String openExpensePage(Model model) {

        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("subCategories", subCategoryRepository.findAll());
        model.addAttribute("vendors", vendorRepository.findAll());
        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Expense";
    }

    // ================= SAVE EXPENSE =================
    @PostMapping("/expense/save")
    public String saveExpense(ExpenseEntity expense) {

        // Safety validation
        if (expense.getCategory() == null ||
            expense.getVendor() == null ||
            expense.getStatus() == null) {

            return "redirect:/expense";
        }

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
            return "redirect:/expense";
        }

        expense.setCategory(category);
        expense.setVendor(vendor);
        expense.setStatus(status);

        expenseRepository.save(expense);

        return "redirect:/expense-list";
    }

    // ================= EXPENSE LIST =================
    @GetMapping("/expense-list")
    public String expenseList(Model model) {

        model.addAttribute("expenseList", expenseRepository.findAll());

        return "ExpenseList";
    }

    // ================= DELETE EXPENSE =================
    @GetMapping("/expense/delete")
    public String deleteExpense(@RequestParam Integer expenseId) {

        if (expenseRepository.existsById(expenseId)) {
            expenseRepository.deleteById(expenseId);
        }

        return "redirect:/expense-list";
    }
}