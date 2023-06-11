package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.repository.ITaiKhoanGameRepository;
import com.example.assignment_sof3021_quanpm_ph27325.service.ITaiKhoanGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping
public class TrangChuController {

    @Autowired
    private ITaiKhoanGameService service;

    @Autowired
    private ITaiKhoanGameRepository service1;

    @GetMapping("/detail/{maTK}")
    public String detailTK(Model model,
                           @PathVariable("maTK") Integer maTK) {
        TaiKhoanGame tk = service.findByMa(maTK);
        List<TaiKhoanGame> lstTK = service1.findAll();
        model.addAttribute("lstTK", lstTK);
        model.addAttribute("tk", tk);
        return "trang-chu/detail";
    }

    @GetMapping
    public String view(Model model) {
        List<TaiKhoanGame> lstTK = service1.findAll();
        model.addAttribute("lstTK", lstTK);
        return "trang-chu/index";
    }
}
