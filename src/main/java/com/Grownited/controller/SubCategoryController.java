package com.Grownited.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.CategoryEntity;
import com.Grownited.entity.SubCategoryEntity;
import com.Grownited.repository.CategoryRepository;
import com.Grownited.repository.SubCategoryRepository;



@Controller
public class SubCategoryController {
	
	@Autowired
	SubCategoryRepository subCategoryRepository;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@GetMapping ("subCategory")
	public String openSubcategorypage(Model model) {
		//List<Entity> 
				List<CategoryEntity> categories = categoryRepository.findAll();
				model.addAttribute("categories",categories);//
		return "SubCategory";
	}

	
	@PostMapping ("subCategory")
	public String saveSubCategory(SubCategoryEntity subCategoryEntity) {
		subCategoryRepository.save(subCategoryEntity);
		return "SubCategory";
		
		
	}
}
