package com.Grownited.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.UserEntity;
import com.Grownited.entity.VendorEntity;
import com.Grownited.repository.VendorRepository;

@Controller
public class VendorController {

    @Autowired
    private VendorRepository vendorRepository;

    // ================= ADD VENDOR PAGE =================
    @GetMapping("/vendor")
    public String openVendorPage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // 🔥 Get vendors of logged-in user
        List<VendorEntity> vendors = vendorRepository.findByUser(user);

        model.addAttribute("vendors", vendors);

        return "Vendor";
    }

    // ================= SAVE VENDOR =================
    @PostMapping("/vendor")
    public String saveVendor(VendorEntity vendorEntity, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // 🔥 Important: Set logged-in user
        vendorEntity.setUser(user);

        vendorRepository.save(vendorEntity);

        return "redirect:/listVendor";
    }

    // ================= VENDOR LIST PAGE =================
    @GetMapping("/listVendor")
    public String listVendor(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // Optional: show only logged-in user's vendors
        List<VendorEntity> vendors = vendorRepository.findAll();

        model.addAttribute("vendors", vendors);

        return "ListVendor";  // Must match JSP file name exactly
    }

    // ================= DELETE VENDOR =================
    @GetMapping("/deleteVendor")
    public String deleteVendor(@RequestParam("vendorId") Integer vendorId,
                               HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        vendorRepository.deleteById(vendorId);

        return "redirect:/listVendor";
    }
}