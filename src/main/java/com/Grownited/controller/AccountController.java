package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.AccountEntity;
import com.Grownited.repository.AccountRepository;

@Controller
public class AccountController {

	
	@Autowired 
	AccountRepository accountRepository;
	
	@GetMapping ("account")
	public String openAccountpage() {
		return "account";
	}
	
	
	@PostMapping("account")
	public String Saveaccount(AccountEntity accountEntity) {
		
		accountRepository.save(accountEntity);
		return ""; 
		
	}
}
