package com.Grownited.controller.Admin;

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
    @GetMapping("/admin/vendor")
    public String openVendorPage(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<VendorEntity> vendors = vendorRepository.findByUser(user);

        model.addAttribute("vendors", vendors);

        return "Admin/Vendor";
    }

    // ================= SAVE VENDOR =================
    @PostMapping("/admin/vendor")
    public String saveVendor(VendorEntity vendorEntity, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        vendorEntity.setUser(user);

        vendorRepository.save(vendorEntity);

        return "redirect:/admin/listVendor";
    }

    // ================= VENDOR LIST PAGE =================
    @GetMapping("/admin/listVendor")
    public String listVendor(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<VendorEntity> vendors = vendorRepository.findAll();

        model.addAttribute("vendors", vendors);

        return "Admin/ListVendor";
    }

    // ================= DELETE VENDOR =================
    @GetMapping("/admin/deleteVendor")
    public String deleteVendor(@RequestParam("vendorId") Integer vendorId,
                               HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        vendorRepository.deleteById(vendorId);

        return "redirect:/admin/listVendor";
    }
}