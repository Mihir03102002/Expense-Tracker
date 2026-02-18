package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.StatusEntity;
import com.Grownited.repository.StatusRepository;

@Controller
public class StatusController {

    @Autowired
    StatusRepository statusRepository;

    // OPEN STATUS PAGE
    @GetMapping("/status")
    public String openStatusPage(Model model) {

        model.addAttribute("statuses", statusRepository.findAll());
        return "Status";
    }

    // SAVE STATUS
    @PostMapping("/status")
    public String saveStatus(StatusEntity statusEntity) {

        statusRepository.save(statusEntity);
        return "redirect:/listStatus";   // IMPORTANT
    }

    // LIST PAGE
    @GetMapping("/listStatus")
    public String listStatus(Model model) {

        model.addAttribute("statuses", statusRepository.findAll());
        return "ListStatus";
    }

    // DELETE
    @GetMapping("/deleteStatus")
    public String deleteStatus(@RequestParam("statusId") Integer statusId) {

        statusRepository.deleteById(statusId);
        return "redirect:/listStatus";
    }
}
