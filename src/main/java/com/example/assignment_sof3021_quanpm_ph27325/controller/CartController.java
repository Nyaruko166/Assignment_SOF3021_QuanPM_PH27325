package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.entity.GioHangView;
import com.example.assignment_sof3021_quanpm_ph27325.repository.TaiKhoanGameRepository;
import com.example.assignment_sof3021_quanpm_ph27325.service.IGioHangService;
import com.example.assignment_sof3021_quanpm_ph27325.service.IGioHangViewService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    @Autowired
    private IGioHangService service;

    @Autowired
    private TaiKhoanGameRepository service1;

    @Autowired
    private IGioHangViewService gioHangViewService;

    @GetMapping("/cart")
    public String viewCart(Model model, HttpSession session) {

        BigDecimal tongTien = BigDecimal.valueOf(0);
        List<GioHangView> cart = gioHangViewService.getCartView();
        for (GioHangView x : cart) {
            tongTien = tongTien.add(x.getTongTien());
//            System.out.println(x.getTongTien());
        }
//        System.out.println(tongTien);
        session.setAttribute("cart", cart);
        model.addAttribute("tongTien", tongTien);
        return "trang-chu/cart";
    }

    @PostMapping("/cart/add/{maTK}")
    public String addToCart(@PathVariable("maTK") Integer maTK, @RequestParam("soLuong") Integer soLuong) {
        service.addToCart(maTK, soLuong);
        return "redirect:/cart";
    }

//    @PostMapping("/cart/update/{id}")
//    public String updateCart(@PathVariable("id") Integer idTK, @RequestParam("soLuong") Integer soLuong) {
//        service.updateCart(idTK, soLuong);
//        return "redirect:/cart";
//    }

    @PostMapping("/cart/del1/{id}")
    public String del1(@PathVariable("id") Integer id) {
        Map<Integer, Integer> cart = service.getCart();
        Integer slHienTai = null;
        for (Map.Entry<Integer, Integer> x : cart.entrySet()) {
            if (id == x.getKey()) {
                slHienTai = x.getValue();
                break;
            }
        }
        if (slHienTai == 1) {
            service.deleteCart(id);
        } else {
            service.addToCart(id, -1);

        }
        return "redirect:/cart";
    }

    @PostMapping("/cart/add1/{id}")
    public String add1(@PathVariable("id") Integer id) {
        service.addToCart(id, 1);
        return "redirect:/cart";
    }

    @PostMapping("/cart/delete/{id}")
    public String deleteCart(@PathVariable("id") Integer id) {
        service.deleteCart(id);
        return "redirect:/cart";
    }
}
