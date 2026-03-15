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
public class UserIncomeController {

    @Autowired
    private IncomeRepository incomeRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private StatusRepository statusRepository;


    // ==========================
    // OPEN ADD INCOME PAGE
    // ==========================
    @GetMapping("/addIncome")
    public String addIncomePage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // ✅ FIX: show only logged-in user's accounts
        model.addAttribute("accounts",
                accountRepository.findByUserId(user.getUserId()));

        model.addAttribute("statuses", statusRepository.findAll());

        model.addAttribute("income", new IncomeEntity());

        return "User/AddIncome";
    }


    // ==========================
    // SAVE INCOME
    // ==========================
    @PostMapping("/saveIncome")
    public String saveIncome(@ModelAttribute IncomeEntity income,
                             HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        income.setUser(user);

        // Save Income
        incomeRepository.save(income);

        // ===== UPDATE ACCOUNT BALANCE =====
        Optional<AccountEntity> accOpt =
                accountRepository.findById(income.getAccount().getAccountId());

        if(accOpt.isPresent()) {

            AccountEntity account = accOpt.get();

            Float balance = account.getAmount();
            if(balance == null){
                balance = 0f;
            }

            Float incomeAmount = income.getAmount();

            account.setAmount(balance + incomeAmount);

            accountRepository.save(account);
        }

        return "redirect:/user/incomeList";
    }

    // ==========================
    // INCOME LIST
    // ==========================
    @GetMapping("/incomeList")
    public String incomeList(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<IncomeEntity> incomes = incomeRepository.findByUser(user);

        model.addAttribute("incomes", incomes);

        return "User/UserIncomeList";
    }


    // ==========================
    // DELETE INCOME (SECURE)
    // ==========================
    @GetMapping("/deleteIncome")
    public String deleteIncome(@RequestParam Integer incomeId,
                               HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        Optional<IncomeEntity> incomeOpt =
                incomeRepository.findById(incomeId);

        if (incomeOpt.isPresent()) {

            IncomeEntity income = incomeOpt.get();

            if (income.getUser().getUserId().equals(user.getUserId())) {

                AccountEntity account = income.getAccount();

                Float balance = account.getAmount();
                if(balance == null){
                    balance = 0f;
                }

                Float incomeAmount = income.getAmount();

                account.setAmount(balance - incomeAmount);

                accountRepository.save(account);

                incomeRepository.delete(income);
            }
        }

        return "redirect:/user/incomeList";
    }


}