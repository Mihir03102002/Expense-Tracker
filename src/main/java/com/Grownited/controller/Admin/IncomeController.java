package com.Grownited.controller.Admin;

import java.time.LocalDate;
import java.util.Optional;

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

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;

@Controller
@RequestMapping("/admin")
public class IncomeController {

    @Autowired
    private IncomeRepository incomeRepository;

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


    // ================= OPEN INCOME PAGE =================
    @GetMapping("/income")
    public String openIncomePage(Model model, HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Admin/Income";
    }

 // ================= SAVE INCOME =================
    @PostMapping("/income/save")
    public String saveIncome(IncomeEntity income,
                             HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        income.setUser(admin);

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

        // 🔥 BALANCE PLUS
        if (account.getAmount() == null) {
            account.setAmount(0.0);
        }

        account.setAmount(account.getAmount() + income.getAmount());

        incomeRepository.save(income);
        accountRepository.save(account); // 🔥 SAVE UPDATED BALANCE

        return "redirect:/admin/incomeList?success=added";
    }
   
    // ================= INCOME LIST =================
    @GetMapping("/incomeList")
    public String incomeList(
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
        Page<IncomeEntity> incomePage;

        if (startDate != null && endDate != null && !startDate.isEmpty() && !endDate.isEmpty()) {

            LocalDate start = LocalDate.parse(startDate);
            LocalDate end = LocalDate.parse(endDate);

            incomePage = incomeRepository
                    .findByDateBetweenAndTitleContainingIgnoreCase(start, end,
                            keyword == null ? "" : keyword, pageable);

        } else if (keyword != null && !keyword.trim().isEmpty()) {

            incomePage = incomeRepository
                    .findByTitleContainingIgnoreCase(keyword, pageable);

        } else {
            incomePage = incomeRepository.findAll(pageable);
        }

        model.addAttribute("incomes", incomePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", incomePage.getTotalPages());

        model.addAttribute("keyword", keyword);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        return "Admin/IncomeList";
    }

    // ================= DELETE INCOME =================
    @GetMapping("/income/delete")
    public String deleteIncome(@RequestParam Integer incomeId,
                               HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        Optional<IncomeEntity> incomeOpt =
                incomeRepository.findById(incomeId);

        if (incomeOpt.isPresent()) {
            incomeRepository.deleteById(incomeId);
        }

        return "redirect:/admin/incomeList?success=deleted";
    }
    
 // ================= EDIT INCOME =================
    @GetMapping("/income/edit")
    public String editIncome(@RequestParam Integer incomeId,
                             Model model,
                             HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        IncomeEntity income = incomeRepository.findById(incomeId).orElse(null);

        model.addAttribute("income", income);
        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());

        return "Admin/EditIncome";
    }
    
 // ================= UPDATE INCOME =================
    @PostMapping("/income/update")
    public String updateIncome(IncomeEntity income,
                               HttpSession session) {

        UserEntity admin = getAdmin(session);

        if (admin == null) {
            return "redirect:/login";
        }

        income.setUser(admin);

        income.setAccount(
            accountRepository.findById(income.getAccount().getAccountId()).orElse(null)
        );

        income.setStatus(
            statusRepository.findById(income.getStatus().getStatusId()).orElse(null)
        );

        incomeRepository.save(income);

        return "redirect:/admin/incomeList?success=updated";
    }
}