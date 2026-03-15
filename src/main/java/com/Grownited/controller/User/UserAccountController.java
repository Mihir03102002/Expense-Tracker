package com.Grownited.controller.User;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.AccountRepository;
import com.Grownited.repository.ExpenseRepository;
import com.Grownited.repository.IncomeRepository;

@Controller
@RequestMapping("/user")
public class UserAccountController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private ExpenseRepository expenseRepository;

    @Autowired
    private IncomeRepository incomeRepository;

    // ================= OPEN ADD ACCOUNT PAGE =================
    @GetMapping("/account")
    public String openAccountPage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<AccountEntity> accounts =
                accountRepository.findByUserId(user.getUserId());

        model.addAttribute("accounts", accounts);

        return "User/AddAccount";
    }

    // ================= SAVE ACCOUNT =================
    @PostMapping("/account")
    public String saveAccount(AccountEntity accountEntity,
                              HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        accountEntity.setUserId(user.getUserId());

        accountRepository.save(accountEntity);

        return "redirect:/user/account";
    }

    // ================= ACCOUNT LIST =================
    @GetMapping("/accountList")
    public String openAccountListPage(Model model,
                                      HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<AccountEntity> accounts =
                accountRepository.findByUserId(user.getUserId());

        model.addAttribute("accounts", accounts);

        return "User/UserAccountList";
    }

    // ================= DELETE ACCOUNT =================
    @GetMapping("/account/delete")
    public String deleteAccount(@RequestParam Integer accountId,
                                HttpSession session,
                                Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // check if account has expenses
        boolean hasExpense =
                expenseRepository.existsByAccountAccountId(accountId);

        // check if account has income
        boolean hasIncome =
                incomeRepository.existsByAccountAccountId(accountId);

        if (hasExpense || hasIncome) {

            model.addAttribute("error",
                    "Cannot delete account. Please delete transactions first.");

            return "redirect:/user/accountList";
        }

        accountRepository.deleteById(accountId);

        return "redirect:/user/accountList";
    }

}