package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.repository.ITaiKhoanGameRepository;
import com.example.assignment_sof3021_quanpm_ph27325.service.IGioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    @Autowired
    private IGioHangService service;

    @Autowired
    private ITaiKhoanGameRepository service1;

    @GetMapping("/cart")
    public String viewCart(Model model) {
        Map<Integer, Integer> cart = service.getCart();
        List<TaiKhoanGame> lstTK = service1.findAll();
        model.addAttribute("cart", cart);
        model.addAttribute("lstTK", lstTK);
        return "trang-chu/cart";
    }

    @PostMapping("/cart/add/{maTK}")
    public String addToCart(@PathVariable("maTK") Integer maTK, @RequestParam("soLuong") Integer soLuong) {
        service.addToCart(maTK, soLuong);
        return "redirect:/cart";
    }

}
