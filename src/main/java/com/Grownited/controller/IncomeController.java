package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.IncomeEntity;
import com.Grownited.entity.StatusEntity;
import com.Grownited.repository.IncomeRepository;
import com.Grownited.repository.AccountRepository;
import com.Grownited.repository.StatusRepository;

@Controller
public class IncomeController {

    @Autowired
    IncomeRepository incomeRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    StatusRepository statusRepository;

    // OPEN INCOME PAGE
    @GetMapping("/income")
    public String openIncomePage(Model model) {

        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Income";
    }

    // SAVE INCOME
    @PostMapping("/income/save")
    public String saveIncome(IncomeEntity income,
                             @RequestParam Integer accountId,
                             @RequestParam Integer statusId) {

        AccountEntity account = accountRepository.findById(accountId).orElse(null);
        StatusEntity status = statusRepository.findById(statusId).orElse(null);

        income.setAccount(account);
        income.setStatus(status);

        incomeRepository.save(income);

        return "redirect:/incomeList";
    }
    // INCOME LIST
    @GetMapping("/incomeList")
    public String incomeList(Model model) {

        model.addAttribute("incomes", incomeRepository.findAll());

        return "IncomeList";
    }
}
