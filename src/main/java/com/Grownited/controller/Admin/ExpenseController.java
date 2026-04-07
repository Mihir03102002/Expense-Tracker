package com.Grownited.controller.Admin;

import java.time.LocalDate;
import java.util.Optional;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.*;
import com.Grownited.repository.*;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;


@Controller
@RequestMapping("/admin")
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


    // ================= HELPER METHOD =================
    private UserEntity getAdmin(HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return null;
        }

        return user;
    }


    // ================= OPEN EXPENSE PAGE =================
    @GetMapping("/expense")
    public String openExpensePage(Model model, HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("subCategories", subCategoryRepository.findAll());
        model.addAttribute("vendors", vendorRepository.findAll());
        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Admin/Expense";
    }


 // ================= SAVE EXPENSE =================
    @PostMapping("/expense/save")
    public String saveExpense(ExpenseEntity expense,
                              HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        expense.setUser(admin);

        CategoryEntity category = categoryRepository
                .findById(expense.getCategory().getCategoryId())
                .orElse(null);

        VendorEntity vendor = vendorRepository
                .findById(expense.getVendor().getVendorId())
                .orElse(null);

        StatusEntity status = statusRepository
                .findById(expense.getStatus().getStatusId())
                .orElse(null);

        AccountEntity account = accountRepository   // 🔥 ADD THIS
                .findById(expense.getAccount().getAccountId())
                .orElse(null);

        if (category == null || vendor == null || status == null || account == null) {
            return "redirect:/admin/expense";
        }

        expense.setCategory(category);
        expense.setVendor(vendor);
        expense.setStatus(status);
        expense.setAccount(account); // 🔥 IMPORTANT

        // 🔥 BALANCE MINUS
        if (account.getAmount() == null) {
            account.setAmount(0.0);
        }

        account.setAmount(account.getAmount() - expense.getAmount());

        expenseRepository.save(expense);
        accountRepository.save(account); // 🔥 SAVE UPDATED BALANCE

        return "redirect:/admin/expense-list?success=added";
    }

    // ================= EXPENSE LIST =================
    @GetMapping("/expense-list")
    public String expenseList(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate,
            Model model,
            HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        int size = 10;
        Pageable pageable = PageRequest.of(page, size);
        Page<ExpenseEntity> expensePage;

        // 🔥 DATE + SEARCH LOGIC
        if (startDate != null && endDate != null && !startDate.isEmpty() && !endDate.isEmpty()) {

            LocalDate start = LocalDate.parse(startDate);
            LocalDate end = LocalDate.parse(endDate);

            expensePage = expenseRepository
                    .findByDateBetweenAndTitleContainingIgnoreCase(start, end,
                            keyword == null ? "" : keyword, pageable);

        } else if (keyword != null && !keyword.trim().isEmpty()) {

            expensePage = expenseRepository
                    .findByTitleContainingIgnoreCase(keyword, pageable);

        } else {
            expensePage = expenseRepository.findAll(pageable);
        }

        model.addAttribute("expenseList", expensePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", expensePage.getTotalPages());

        model.addAttribute("keyword", keyword);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        return "Admin/ExpenseList";
    }

    // ================= DELETE EXPENSE =================
    @GetMapping("/expense/delete")
    public String deleteExpense(@RequestParam Integer expenseId,
                                HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        Optional<ExpenseEntity> expenseOpt =
                expenseRepository.findById(expenseId);

        if (expenseOpt.isPresent()) {
            expenseRepository.deleteById(expenseId);
        }

        return "redirect:/admin/expense-list?success=deleted";
    }
    
 // ================= EDIT EXPENSE =================
    @GetMapping("/expense/edit")
    public String editExpense(@RequestParam Integer expenseId,
                              Model model,
                              HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        ExpenseEntity expense = expenseRepository.findById(expenseId).orElse(null);

        model.addAttribute("expense", expense);
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("subCategories", subCategoryRepository.findAll());
        model.addAttribute("vendors", vendorRepository.findAll());
        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Admin/EditExpense";
    }
    
 // ================= UPDATE EXPENSE =================
    @PostMapping("/expense/update")
    public String updateExpense(ExpenseEntity expense,
                                HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        expense.setUser(admin);

        expense.setCategory(
            categoryRepository.findById(expense.getCategory().getCategoryId()).orElse(null)
        );

        expense.setSubCategory(
            subCategoryRepository.findById(expense.getSubCategory().getSubCategoryId()).orElse(null)
        );

        expense.setVendor(
            vendorRepository.findById(expense.getVendor().getVendorId()).orElse(null)
        );

        expense.setAccount(
            accountRepository.findById(expense.getAccount().getAccountId()).orElse(null)
        );

        expense.setStatus(
            statusRepository.findById(expense.getStatus().getStatusId()).orElse(null)
        );

        expenseRepository.save(expense);

        return "redirect:/admin/expense-list?success=updated";
    }
}