package com.Grownited.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.UserEntity;
import com.Grownited.repository.UserRepository;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/users")
    public String listUsers(Model model) {

        List<UserEntity> users = userRepository.findAll();

        model.addAttribute("users", users);

        return "Users";   // Users.jsp
    }
    
    @GetMapping("viewUser")
    public String viewUser(@RequestParam("userId") Integer userId, Model model) {

        Optional<UserEntity> op = userRepository.findById(userId);

        if (op.isPresent()) {
            model.addAttribute("user", op.get());
            return "ViewUser";   // JSP Name
        }

        return "redirect:/users";
    }
    

    
    @GetMapping("/deleteUser")
    public String deleteUser(Integer userId) {

        userRepository.deleteById(userId);

        return "redirect:/users";
    }

}
