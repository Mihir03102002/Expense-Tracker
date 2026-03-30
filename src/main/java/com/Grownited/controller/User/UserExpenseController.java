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

        Optional<AccountEntity> accOpt =
                accountRepository.findById(expense.getAccount().getAccountId());

        Optional<StatusEntity> statusOpt =
                statusRepository.findById(expense.getStatus().getStatusId());

        if (accOpt.isPresent() && statusOpt.isPresent()) {

            AccountEntity account = accOpt.get();
            StatusEntity statusEntity = statusOpt.get();

            Double balance = account.getAmount();
            if(balance == null){
                balance = (double) 0f;
            }

            Float expenseAmount = expense.getAmount();

            String status = statusEntity.getStatus();

            if("Paid".equalsIgnoreCase(status)){

                balance = balance - expenseAmount;

            } 
            else if("Partial".equalsIgnoreCase(status)){

                balance = balance - (expenseAmount / 2);

            }
            // Unpaid → no balance change

            account.setAmount(balance);
            accountRepository.save(account);
        }

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

        Optional<ExpenseEntity> expenseOpt = expenseRepository.findById(expenseId);

        if (expenseOpt.isPresent()) {

            ExpenseEntity expense = expenseOpt.get();

            if (expense.getUser().getUserId().equals(user.getUserId())) {

                AccountEntity account = expense.getAccount();

                Double balance = account.getAmount();
                if(balance == null){
                    balance = (double) 0f;
                }

                Float expenseAmount = expense.getAmount();

                String status = "";
                if(expense.getStatus() != null){
                    status = expense.getStatus().getStatus();
                }

                if("Paid".equalsIgnoreCase(status)){
                    balance = balance + expenseAmount;
                }
                else if("Partial".equalsIgnoreCase(status)){
                    balance = balance + (expenseAmount / 2);
                }

                account.setAmount(balance);
                accountRepository.save(account);

                expenseRepository.delete(expense);
            }
        }

        return "redirect:/user/expenseList";
    }

}