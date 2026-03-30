package com.Grownited.controller.Admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;          // ✅ ADDED
import org.springframework.data.domain.PageRequest;  // ✅ ADDED
import org.springframework.data.domain.Pageable;     // ✅ ADDED
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.UserEntity;
import com.Grownited.repository.UserRepository;

@Controller
public class AdminUserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/admin/users")
    public String listUsers(
            @RequestParam(defaultValue = "0") int page,     // ✅ ADDED
            @RequestParam(required = false) String keyword, // ✅ ADDED
            Model model) {

        int size = 10;

        Pageable pageable = PageRequest.of(page, size);
        Page<UserEntity> userPage;

        // 🔍 SEARCH LOGIC
        if (keyword != null && !keyword.trim().isEmpty()) {
            userPage = userRepository
                    .findByFirstNameContainingIgnoreCaseOrEmailContainingIgnoreCase(
                            keyword, keyword, pageable);
        } else {
            userPage = userRepository.findAll(pageable);
        }

        model.addAttribute("users", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("keyword", keyword);

        return "Admin/Users";
    }
    
    @GetMapping("/admin/viewUser")
    public String viewUser(@RequestParam("userId") Integer userId, Model model) {

        Optional<UserEntity> op = userRepository.findById(userId);

        if (op.isPresent()) {
            model.addAttribute("user", op.get());
            return "Admin/ViewUser";
        }

        return "redirect:/admin/users";
    }
    

    @GetMapping("/admin/deleteUser")
    public String deleteUser(Integer userId) {

        userRepository.deleteById(userId);

        return "redirect:/admin/users";
    }

}