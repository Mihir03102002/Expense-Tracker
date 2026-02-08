package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.SubCategoryEntity;
import com.Grownited.repository.SubCategoryRepository;

@Controller
public class SubCategoryController {
	
	@Autowired
	SubCategoryRepository subCategoryRepository;
	
	@GetMapping ("subCategory")
	public String openSubcategorypage() {
		return "SubCategory";
	}

	
	@PostMapping ("subCategory")
	public String SavesubCategory(SubCategoryEntity subCategoryEntity) {
		
		subCategoryRepository.save(subCategoryEntity);
		return "AdminController";
		
		
	}
}
