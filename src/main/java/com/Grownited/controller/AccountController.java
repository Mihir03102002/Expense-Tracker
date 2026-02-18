package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.AccountEntity;
import com.Grownited.repository.AccountRepository;

@Controller
public class AccountController {

    @Autowired
    private AccountRepository accountRepository;

    // ================= OPEN ACCOUNT PAGE (Add + List) =================
    @GetMapping("/account")
    public String openAccountPage(Model model) {

        model.addAttribute("accounts", accountRepository.findAll());

        return "Account";   // Account.jsp
    }

    // ================= SAVE ACCOUNT =================
    @PostMapping("/account")
    public String saveAccount(AccountEntity accountEntity) {

        accountRepository.save(accountEntity);

        return "redirect:/account";   // Reload Account.jsp
    }

    // ================= OPEN ACCOUNT LIST PAGE =================
    @GetMapping("/accountList")
    public String openAccountListPage(Model model) {

        model.addAttribute("accounts", accountRepository.findAll());

        return "AccountList";   // AccountList.jsp
    }

    // ================= DELETE ACCOUNT =================
    @GetMapping("/account/delete")
    public String deleteAccount(@RequestParam Integer accountId) {

        accountRepository.deleteById(accountId);

        return "redirect:/account";   // After delete go back to Account.jsp
    }
}
