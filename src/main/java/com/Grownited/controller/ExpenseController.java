package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.ExpenseEntity;
import com.Grownited.repository.ExpenseRepository;

@Controller
public class ExpenseController {

	
	@Autowired
	ExpenseRepository expenseRepository;
	
	@GetMapping ("expense")
	public String openexpensepage() {
		return "expense";
	}
	
    @PostMapping ("expense")
    public String saveExpense (ExpenseEntity expenseEntity) {
    	expenseRepository.save(expenseEntity);
    	return" ";
    }
	
	
	
}
