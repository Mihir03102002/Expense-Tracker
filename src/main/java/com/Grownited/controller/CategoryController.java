package com.Grownited.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.CategoryEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.CategoryRepository;

@Controller
public class CategoryController {

    @Autowired
    CategoryRepository categoryRepository;

    // ================= OPEN CATEGORY PAGE =================
    @GetMapping("/category")
    public String openCategoryPage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<CategoryEntity> listCategory = categoryRepository.findAll();
        model.addAttribute("listCategory", listCategory);

        return "Category";
    }

    // ================= SAVE CATEGORY =================
    @PostMapping("/category")
    public String saveCategory(CategoryEntity categoryEntity,
                               HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // 🔥 FIX: Set logged-in user's ID
        categoryEntity.setUserId(user.getUserId());

        categoryRepository.save(categoryEntity);

        return "redirect:/category";
    }

    // ================= LIST CATEGORY PAGE =================
    @GetMapping("/listCategory")
    public String listCategory(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<CategoryEntity> listCategory = categoryRepository.findAll();
        model.addAttribute("listCategory", listCategory);

        return "ListCategory";
    }

    // ================= DELETE CATEGORY =================
    @GetMapping("/deleteCategory")
    public String deleteCategory(Integer categoryId,
                                 HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        categoryRepository.deleteById(categoryId);

        return "redirect:/listCategory";
    }
}