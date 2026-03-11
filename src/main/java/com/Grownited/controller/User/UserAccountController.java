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

@Controller
@RequestMapping("/user")
public class UserAccountController {

    @Autowired
    private AccountRepository accountRepository;

    // ================= OPEN ADD ACCOUNT PAGE =================
    @GetMapping("/account")
    public String openAccountPage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // Load only logged-in user's accounts
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

        // Set logged-in user id
        accountEntity.setUserId(user.getUserId());

        accountRepository.save(accountEntity);

        return "redirect:/user/account";
    }

    // ================= ACCOUNT LIST PAGE =================
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
                                HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        accountRepository.deleteById(accountId);

        return "redirect:/user/account";
    }
}