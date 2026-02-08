package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.VendorEntity;
import com.Grownited.repository.VendorRepository;

@Controller
public class VendorController {
	
	@Autowired
	VendorRepository vendorRepository;
	
	@GetMapping ("vendor")
	public String openvendorpage() {
		return "vendor";
	}

	@PostMapping ("vendor")
	public String saveVendor(VendorEntity vendorEntity) {
		vendorRepository.save (vendorEntity);
		return "";
	}
	
}
