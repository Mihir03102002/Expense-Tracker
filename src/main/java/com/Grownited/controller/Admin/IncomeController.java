package com.Grownited.controller.Admin;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.IncomeEntity;
import com.Grownited.entity.StatusEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.IncomeRepository;
import com.Grownited.repository.AccountRepository;
import com.Grownited.repository.StatusRepository;

@Controller
public class IncomeController {

    @Autowired
    private IncomeRepository incomeRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private StatusRepository statusRepository;

    // ================= OPEN INCOME PAGE =================
    @GetMapping("/admin/income")
    public String openIncomePage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Admin/Income";
    }

    // ================= SAVE INCOME =================
    @PostMapping("/admin/income/save")
    public String saveIncome(IncomeEntity income, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        income.setUser(user);

        if (income.getAccount() == null || income.getStatus() == null) {
            return "redirect:/admin/income";
        }

        AccountEntity account = accountRepository
                .findById(income.getAccount().getAccountId())
                .orElse(null);

        StatusEntity status = statusRepository
                .findById(income.getStatus().getStatusId())
                .orElse(null);

        if (account == null || status == null) {
            return "redirect:/admin/income";
        }

        income.setAccount(account);
        income.setStatus(status);

        incomeRepository.save(income);

        return "redirect:/admin/incomeList";
    }

    // ================= INCOME LIST =================
    @GetMapping("/admin/incomeList")
    public String incomeList(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("incomes",
                incomeRepository.findByUser(user));

        return "Admin/IncomeList";
    }

    // ================= DELETE INCOME =================
    @GetMapping("/admin/income/delete")
    public String deleteIncome(@RequestParam Integer incomeId,
                               HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        incomeRepository.deleteById(incomeId);

        return "redirect:/admin/incomeList";
    }
}