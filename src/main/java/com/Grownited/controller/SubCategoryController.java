package com.Grownited.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.SubCategoryEntity;
import com.Grownited.repository.CategoryRepository;
import com.Grownited.repository.SubCategoryRepository;



@Controller
public class SubCategoryController {

    @Autowired
    SubCategoryRepository subCategoryRepository;

    @Autowired
    CategoryRepository categoryRepository;

    // OPEN PAGE
    @GetMapping("/subCategory")
    public String openSubCategoryPage(Model model) {

        model.addAttribute("subCategories", subCategoryRepository.findAll());
        model.addAttribute("categories", categoryRepository.findAll());

        return "SubCategory";
    }

    // SAVE
    @PostMapping("/subCategory")
    public String saveSubCategory(
            @RequestParam("subCategoryName") String subCategoryName,
            @RequestParam("categoryId") Integer categoryId) {

        SubCategoryEntity sub = new SubCategoryEntity();

        sub.setSubCategoryName(subCategoryName);
        sub.setCategory(categoryRepository.findById(categoryId).get());
        
        subCategoryRepository.save(sub);
        return "redirect:/subCategory";
    }

 // LIST PAGE
    @GetMapping("/listSubCategory")
    public String listSubCategory(Model model) {

        model.addAttribute("subCategories", subCategoryRepository.findAll());

        return "ListSubCategory";   // must match JSP file name
    }

    
    // DELETE
    @GetMapping("/deleteSubCategory")
    public String deleteSubCategory(Integer subCategoryId) {
        subCategoryRepository.deleteById(subCategoryId);
        return "redirect:/subCategory";
    }
}

