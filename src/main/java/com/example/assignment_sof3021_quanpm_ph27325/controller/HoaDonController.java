package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDon;
import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDonChiTiet;
import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoan;
import com.example.assignment_sof3021_quanpm_ph27325.service.IHoaDonService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/crud/hoa-don")
public class HoaDonController {

    @Autowired
    private IHoaDonService service;

    @GetMapping
    public String viewHD(Model model, HttpSession session) {

        TaiKhoan user = (TaiKhoan) session.getAttribute("user");

        if (user.getRole().equals("Admin")) {
            List<HoaDon> lstHD = service.getAll();
            model.addAttribute("lstHD", lstHD);

            return "quan-tri/hoa-don";
        } else {
            return "redirect:/";
        }

//        List<HoaDon> lstHD = service.getAll();
//        model.addAttribute("lstHD", lstHD);

//        return "quan-tri/hoa-don";
    }

    @GetMapping("/detail/{idHD}")
    public String detailHD(@PathVariable("idHD") Integer idHD, Model model) {

        List<HoaDonChiTiet> lstHDCT = service.findByID(idHD);
        model.addAttribute("lstHDCT", lstHDCT);

        return "quan-tri/hoa-don-ct";
    }

}
