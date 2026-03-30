package com.Grownited.controller.Admin;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;   // ✅ ADDED
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

    @GetMapping("/admin/listVendor")
    public String listVendor(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String keyword,   // 🔍 search
            Model model,
            HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        int size = 10;

        Pageable pageable = PageRequest.of(page, size);
        Page<VendorEntity> vendorPage;

        // ================= SEARCH LOGIC =================
        if (keyword != null && !keyword.trim().isEmpty()) {
            vendorPage = vendorRepository
                    .findByVendorNameContainingIgnoreCase(keyword, pageable);
        } else {
            vendorPage = vendorRepository.findAll(pageable);
        }

        model.addAttribute("vendors", vendorPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", vendorPage.getTotalPages());
        model.addAttribute("keyword", keyword); // keep search value

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