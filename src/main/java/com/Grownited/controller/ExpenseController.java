package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.ExpenseEntity;
import com.Grownited.repository.ExpenseRepository;

@Controller
public class ExpenseController {

	
	@Autowired
	ExpenseRepository expenseRepository;
	
	@GetMapping ("Expense")
	public String openexpensepage() {
		return "Expense";
	}
	
    @PostMapping ("saveExpense")
    public String saveExpense (ExpenseEntity expenseEntity) {
    	expenseRepository.save(expenseEntity);
    	return"AdminController";
    }
	
    @GetMapping("/expense-list")
    public String expenseList(Model model) {

        List<ExpenseEntity> expenseList = expenseRepository.findAll();

        model.addAttribute("expenseList", expenseList);

        return "expense-list";
    }

	
}
