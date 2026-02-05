package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
        return "category";   // category.jsp
    }

    // SAVE CATEGORY
    @PostMapping("/admin/category/save")
    public String saveCategory(CategoryEntity category) {

        categoryRepository.save(category);

        return "redirect:/dashboard";
    }
}