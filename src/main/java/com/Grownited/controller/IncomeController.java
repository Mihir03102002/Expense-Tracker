package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.IncomeEntity;
import com.Grownited.repository.IncomeRepository;

@Controller
public class IncomeController {

    @Autowired
    IncomeRepository incomeRepository;

    @GetMapping("/income")
    public String openIncomePage() {
        return "income"; // income.jsp
    }

    @PostMapping("/income")
    public String saveIncome(IncomeEntity incomeEntity) {
        incomeRepository.save(incomeEntity); // ✅ correct
        return "redirect:/income"; // redirect after save
    }
}
