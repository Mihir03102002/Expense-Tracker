package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

    @GetMapping("/expense")
    public String openExpensePage(Model model) {

        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("subCategories", subCategoryRepository.findAll());
        model.addAttribute("vendors", vendorRepository.findAll());
        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Expense";
    }

    @PostMapping("/expense/save")
    public String saveExpense(ExpenseEntity expense) {

        CategoryEntity category = categoryRepository
                .findById(expense.getCategory().getCategoryId())
                .orElse(null);

        VendorEntity vendor = vendorRepository
                .findById(expense.getVendor().getVendorId())
                .orElse(null);

        StatusEntity status = statusRepository
                .findById(expense.getStatus().getStatusId())
                .orElse(null);

        expense.setCategory(category);
        expense.setVendor(vendor);
        expense.setStatus(status);

        expenseRepository.save(expense);

        return "redirect:/expense-list";
    }

    
    @GetMapping("/expense-list")
    public String expenseList(Model model) {

        model.addAttribute("expenseList", expenseRepository.findAll());

        return "ExpenseList";
    }

}
