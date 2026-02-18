package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.VendorEntity;
import com.Grownited.repository.VendorRepository;

@Controller
public class VendorController {

    @Autowired
    VendorRepository vendorRepository;

    // OPEN ADD VENDOR PAGE
    @GetMapping("/vendor")
    public String openVendorPage(Model model) {

        List<VendorEntity> vendors = vendorRepository.findAll();
        model.addAttribute("vendors", vendors);   // FIXED NAME

        return "Vendor";  // Vendor.jsp
    }

    // SAVE VENDOR
    @PostMapping("/vendor")
    public String saveVendor(VendorEntity vendorEntity) {

        vendorRepository.save(vendorEntity);

        return "redirect:/vendor";  // ✅ VERY IMPORTANT
    }


    // LIST PAGE
    @GetMapping("/listVendor")
    public String listVendor(Model model) {

        List<VendorEntity> vendors = vendorRepository.findAll();
        model.addAttribute("vendors", vendors);   // FIXED NAME

        return "ListVendor";
    }

    // DELETE
    @GetMapping("/deleteVendor")
    public String deleteVendor(@RequestParam("vendorId") Integer vendorId) {

        vendorRepository.deleteById(vendorId);

        return "redirect:/listVendor";  // CORRECT REDIRECT
    }
}
