package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.entity.ThongKe;
import com.example.assignment_sof3021_quanpm_ph27325.repository.ThongKeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/thong-ke")
public class ThongKeController {

    @Autowired
    private ThongKeRepository repository;

    @GetMapping
    public String view() {

        return "quan-tri/thong-ke";
    }

    @PostMapping("/loc/thang")
    public String locThang(Model model,
                           @RequestParam("thang") Integer thang,
                           @RequestParam("nam") Integer nam) {

        List<ThongKe> lstTK = repository.banChayNhatTheoThang(thang, nam);
        model.addAttribute("lstTK", lstTK);
        return "quan-tri/thong-ke";
    }
}
