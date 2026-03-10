package com.Grownited.controller.Admin;

import java.util.Optional;
import java.util.Random;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.UserEntity;
import com.Grownited.repository.UserRepository;

@Controller
public class ForgotPasswordController {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    PasswordEncoder passwordEncoder;

    // Step 1: Open Forgot Page
    @GetMapping("/forgot-password")
    public String forgotPage() {
        return "Forgot-Password";
    }

    // Step 2: Send OTP
    @PostMapping("/send-otp")
    public String sendOtp(@RequestParam String email, HttpSession session) {

        Optional<UserEntity> user = userRepo.findByEmail(email);

        if (!user.isPresent()) {
            return "redirect:/forgot-password?error=notfound";
        }

        int otp = new Random().nextInt(900000) + 100000;

        session.setAttribute("otp", otp);
        session.setAttribute("email", email);
        session.setAttribute("otpTime", System.currentTimeMillis());

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Password Reset OTP");
        message.setText("Your OTP is: " + otp + "\nValid for 5 minutes.");

        mailSender.send(message);

        return "redirect:/verify-otp";
    }

    // Step 3: OTP Page
    @GetMapping("/verify-otp")
    public String otpPage() {
        return "Verify-otp";
    }

    // Step 4: Verify OTP
    @PostMapping("/verify-otp")
    public String verifyOtp(@RequestParam int otp, HttpSession session) {

        Integer sessionOtp = (Integer) session.getAttribute("otp");
        Long otpTime = (Long) session.getAttribute("otpTime");

        if (sessionOtp == null || otpTime == null) {
            return "redirect:/forgot-password";
        }

        if (System.currentTimeMillis() - otpTime > 300000) {
            session.invalidate();
            return "redirect:/forgot-password?error=expired";
        }

        if (otp == sessionOtp) {
            return "redirect:/reset-password";
        }

        return "redirect:/verify-otp?error=invalid";
    }

    // Step 5: Reset Page
    @GetMapping("/reset-password")
    public String resetPage(HttpSession session) {

        if (session.getAttribute("email") == null) {
            return "redirect:/forgot-password";
        }

        return "ResetPassword";
    }

    // Step 6: Update Password
    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam String password,
                                @RequestParam String cpassword,
                                HttpSession session) {

        if (!password.equals(cpassword)) {
            return "redirect:/reset-password?error=nomatch";
        }

        String email = (String) session.getAttribute("email");

        if (email == null) {
            return "redirect:/forgot-password";
        }

        Optional<UserEntity> optionalUser = userRepo.findByEmail(email);

        if (!optionalUser.isPresent()) {
            return "redirect:/forgot-password?error=notfound";
        }

        UserEntity user = optionalUser.get();
        String encodedPassword = passwordEncoder.encode(user.getPassword());

        user.setPassword(encodedPassword);

        userRepo.save(user);

        session.invalidate();

        return "redirect:/login";
    }
}