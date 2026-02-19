package com.Grownited.controller;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.UserDetailEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.UserRepository;
import com.Grownited.service.MailerService;
import com.Grownited.repository.UserDetailRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserDetailRepository userDetailRepository;

    @Autowired
    MailerService mailerService;

    // ================= SIGNUP PAGE =================
    @GetMapping("/signup")
    public String openSignupPage() {
        return "Signup";
    }

    // ================= LOGIN PAGE =================
    @GetMapping("/login")
    public String openLoginPage() {
        return "Login";
    }

    // ================= AUTHENTICATE =================
    @PostMapping("/authenticate")
    public String authenticate(String email,
                               String password,
                               Model model,
                               HttpSession session) {

        Optional<UserEntity> op = userRepository.findByEmail(email);

        if (op.isPresent()) {

            UserEntity dbUser = op.get();

            if (dbUser.getPassword().equals(password)) {

                session.setAttribute("user", dbUser);

                if (dbUser.getRole().equals("ADMIN")) {
                    return "redirect:/AdminDashboard";
                } 
                else if (dbUser.getRole().equals("USER")) {
                    return "redirect:/participant-dashboard";
                }
            }
        }

        model.addAttribute("error", "Invalid Credentials");
        return "Login";
    }

    // ================= FORGET PASSWORD =================
    @GetMapping("/forgetpassword")
    public String openForgetPassword() {
        return "ForgetPassword";
    }

    // ================= REGISTER =================
    @PostMapping("/register")
    public String register(UserEntity userEntity,
                           UserDetailEntity userDetailEntity) {

        System.out.println(userEntity.getFirstName());
        System.out.println(userEntity.getLastName());
        System.out.println("Processor => " + Runtime.getRuntime().availableProcessors());
        System.out.println(userDetailEntity.getCountry());
        System.out.println(userDetailEntity.getState());

        userEntity.setRole("USER");
        userEntity.setActive(true);
        userEntity.setCreatedAt(LocalDate.now());

        // Save user
        userRepository.save(userEntity);

        // Save user details
        userDetailEntity.setUserId(userEntity.getUserId());
        userDetailRepository.save(userDetailEntity);

        // Send welcome mail
        mailerService.sendWelcomeMail(userEntity);

        return "redirect:/login";
    }

    // ================= LOGOUT =================
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
