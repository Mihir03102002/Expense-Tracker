package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.StatusEntity;
import com.Grownited.repository.StatusRepository;

@Controller
public class StatusController {
	
	@Autowired
	StatusRepository statusRepository;
	
	@GetMapping ("status")
	public String openstatuspage(){
	return "status";
	
	}
	
	@PostMapping ("status")
	public String saveStatus (StatusEntity statusEntity) {
		statusRepository.save (statusEntity);
		return " ";
	}
}
