package com.Grownited.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.AccountRepository;

@Controller
public class AccountController {

    @Autowired
    private AccountRepository accountRepository;

    // ================= OPEN ACCOUNT PAGE (Add + List) =================
    @GetMapping("/account")
    public String openAccountPage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<AccountEntity> accounts = accountRepository.findAll();
        model.addAttribute("accounts", accounts);

        return "Account";
    }

    // ================= SAVE ACCOUNT =================
    @PostMapping("/account")
    public String saveAccount(AccountEntity accountEntity,
                              HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // 🔥 IMPORTANT FIX
        accountEntity.setUserId(user.getUserId());

        accountRepository.save(accountEntity);

        return "redirect:/account";
    }

    // ================= OPEN ACCOUNT LIST PAGE =================
    @GetMapping("/accountList")
    public String openAccountListPage(Model model,
                                      HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<AccountEntity> accounts = accountRepository.findAll();
        model.addAttribute("accounts", accounts);

        return "AccountList";
    }

    // ================= DELETE ACCOUNT =================
    @GetMapping("/account/delete")
    public String deleteAccount(@RequestParam Integer accountId,
                                HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        accountRepository.deleteById(accountId);

        return "redirect:/account";
    }
}