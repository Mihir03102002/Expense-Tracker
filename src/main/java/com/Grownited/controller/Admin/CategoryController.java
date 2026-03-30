package com.Grownited.controller.Admin;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;          // ✅ ADDED
import org.springframework.data.domain.PageRequest;  // ✅ ADDED
import org.springframework.data.domain.Pageable;     // ✅ ADDED
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.CategoryEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.CategoryRepository;

@Controller
public class CategoryController {

    @Autowired
    CategoryRepository categoryRepository;

    // ================= OPEN CATEGORY PAGE =================
    @GetMapping("/admin/category")
    public String openCategoryPage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<CategoryEntity> listCategory = categoryRepository.findAll();
        model.addAttribute("listCategory", listCategory);

        return "Admin/Category";
    }

    // ================= SAVE CATEGORY =================
    @PostMapping("/admin/category")
    public String saveCategory(CategoryEntity categoryEntity,
                               HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        categoryEntity.setUserId(user.getUserId());

        categoryRepository.save(categoryEntity);

        return "redirect:/admin/category";
    }

    // ================= LIST CATEGORY PAGE (UPDATED 🔥) =================
    @GetMapping("/admin/listCategory")
    public String listCategory(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String keyword,
            Model model,
            HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        int size = 10;

        Pageable pageable = PageRequest.of(page, size);
        Page<CategoryEntity> categoryPage;

        // 🔍 SEARCH LOGIC
        if (keyword != null && !keyword.trim().isEmpty()) {
            categoryPage = categoryRepository
                    .findByCategoryNameContainingIgnoreCase(keyword, pageable);
        } else {
            categoryPage = categoryRepository.findAll(pageable);
        }

        model.addAttribute("listCategory", categoryPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", categoryPage.getTotalPages());
        model.addAttribute("keyword", keyword);

        return "Admin/ListCategory";
    }

    // ================= DELETE CATEGORY =================
    @GetMapping("/admin/deleteCategory")
    public String deleteCategory(Integer categoryId,
                                 HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        categoryRepository.deleteById(categoryId);

        return "redirect:/admin/listCategory";
    }
}