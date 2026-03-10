package com.Grownited.controller.Admin;

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
    private SubCategoryRepository subCategoryRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    // ================= OPEN ADD PAGE =================
    @GetMapping("/admin/subCategory")
    public String openSubCategoryPage(Model model) {

        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("subCategories", subCategoryRepository.findAll());

        return "Admin/SubCategory";
    }

    // ================= SAVE SUBCATEGORY =================
    @PostMapping("/admin/subCategory")
    public String saveSubCategory(
            @RequestParam("subCategoryName") String subCategoryName,
            @RequestParam("categoryId") Integer categoryId) {

        SubCategoryEntity sub = new SubCategoryEntity();

        sub.setSubCategoryName(subCategoryName);
        sub.setCategory(categoryRepository.findById(categoryId).get());

        subCategoryRepository.save(sub);

        return "redirect:/admin/listSubCategory";
    }

    // ================= LIST PAGE =================
    @GetMapping("/admin/listSubCategory")
    public String listSubCategory(Model model) {

        model.addAttribute("subCategories", subCategoryRepository.findAll());

        return "Admin/ListSubCategory";
    }

    // ================= DELETE =================
    @GetMapping("/admin/deleteSubCategory")
    public String deleteSubCategory(@RequestParam("subCategoryId") Integer subCategoryId) {

        subCategoryRepository.deleteById(subCategoryId);

        return "redirect:/admin/listSubCategory";
    }

}