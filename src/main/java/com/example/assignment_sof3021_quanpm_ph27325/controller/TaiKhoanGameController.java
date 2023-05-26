package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.model.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.service.ITaiKhoanGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping
public class TaiKhoanGameController {

    @Autowired
    private ITaiKhoanGameService service;

    @GetMapping
    public String loadTbl(Model model) {
        List<TaiKhoanGame> lstTK = service.getAll();
        model.addAttribute("lstTK", lstTK);
        return "trang-chu/index";
    }

    @GetMapping("/detail/{maTK}")
    public String detailTK(Model model,
                           @PathVariable("maTK") UUID maTK) {
        TaiKhoanGame tk = service.findByMa(maTK);
        List<TaiKhoanGame> lstTK = service.getAll();
        model.addAttribute("lstTK", lstTK);
        model.addAttribute("tk", tk);
        return "trang-chu/detail";
    }

}
