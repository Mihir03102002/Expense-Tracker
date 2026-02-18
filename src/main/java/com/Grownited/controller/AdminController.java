package com.Grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping (value =  {"AdminDashboard","/"})
	public String adminDashboard() {
		return "AdminDashboard";

       }
}