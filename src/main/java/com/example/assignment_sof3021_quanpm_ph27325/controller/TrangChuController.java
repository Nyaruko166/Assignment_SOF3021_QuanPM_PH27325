package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.model.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.repository.ITaiKhoanGameRepository;
import com.example.assignment_sof3021_quanpm_ph27325.service.ITaiKhoanGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping
public class TrangChuController {

    @Autowired
    private ITaiKhoanGameRepository service;

    @GetMapping
    public String view(Model model) {
        List<TaiKhoanGame> lstTK = service.findAll();
        model.addAttribute("lstTK", lstTK);
        return "trang-chu/index";
    }
}
