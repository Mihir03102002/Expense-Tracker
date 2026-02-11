package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.CategoryEntity;
import com.Grownited.repository.CategoryRepository;

@Controller
public class CategoryController {

    @Autowired
    CategoryRepository categoryRepository;

    // OPEN CATEGORY PAGE
    @GetMapping("/category")
    public String openCategoryPage() {
        return "Category";   // category.jsp
    }

    // SAVE CATEGORY
    @PostMapping("/category")
    public String saveCategory(CategoryEntity categoryEntity) {
         
        // FIXED LINE
        categoryRepository.save(categoryEntity);

        return "ListCategory";
    }
    
    @GetMapping("listCategory")
	public String listCategory(Model model) {
		//select * from categories ; 
		
		//List<Entity> 
		List<CategoryEntity> listCategory = categoryRepository.findAll();
		model.addAttribute("listCategory",listCategory);//
		
		return "ListCategory";
	}
    
    @GetMapping("deleteCategory")
    public String deleteCategory(Integer categoryId) {
        categoryRepository.deleteById(categoryId);
        return "redirect:/listCategory";
    }//do not open jsp , open another url -> listHackathon
	
		

}
