package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.entity.GioHangView;
import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDon;
import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoan;
import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.service.IGioHangService;
import com.example.assignment_sof3021_quanpm_ph27325.service.IGioHangViewService;
import com.example.assignment_sof3021_quanpm_ph27325.service.IHoaDonService;
import com.example.assignment_sof3021_quanpm_ph27325.service.ITaiKhoanGameService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    @Autowired
    private IGioHangService gioHangService;

    @Autowired
    private IGioHangViewService gioHangViewService;

    @Autowired
    private IHoaDonService hoaDonService;

    @Autowired
    private ITaiKhoanGameService taiKhoanGameService;

    @PostMapping("/cart/thanh-toan")
    public String thanhToan(Model model, HttpSession session) {

        List<GioHangView> cart = null;

        cart = (List<GioHangView>) session.getAttribute("cart");

        TaiKhoan user = null;

        user = (TaiKhoan) session.getAttribute("user");

        if (cart.isEmpty()) {
            model.addAttribute("mess1", "Bạn chưa thêm sản phẩm nào vào giỏ");
            return "trang-chu/cart";
        } else if (user == null) {
            model.addAttribute("err", "Bạn chưa đăng nhập");
            return "redirect:/dang-nhap";
        } else {
            Date date = new Date();
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            BigDecimal tongTien = BigDecimal.valueOf(0);
            for (GioHangView x : cart) {
                tongTien = tongTien.add(x.getTongTien());
            }
            HoaDon hoaDon = new HoaDon(null, tongTien, user.getUsername(), sqlDate);

            for (GioHangView x : cart) {
                TaiKhoanGame tkg = taiKhoanGameService.findByMa(x.getId());
                Integer soLuongHienTai = tkg.getSoLuong();
                tkg.setSoLuong(soLuongHienTai - x.getSoLuongTrongGio());
                taiKhoanGameService.saveTK(tkg);
            }

            HoaDon lastHD = hoaDonService.themHoaDon(hoaDon);

            hoaDonService.themHoaDonChiTiet(cart, lastHD);

            session.removeAttribute("cart");
            gioHangViewService.deleteCart();

            session.setAttribute("mess1", "Thanh toán thành công, vui lòng check Email để nhận account");
            return "redirect:/cart";
        }
    }

    @GetMapping("/cart")
    public String viewCart(Model model, HttpSession session) {

        BigDecimal tongTien = BigDecimal.valueOf(0);
        List<GioHangView> cart = gioHangViewService.getCartView();
        for (GioHangView x : cart) {
            tongTien = tongTien.add(x.getTongTien());
        }
        session.setAttribute("cart", cart);
        model.addAttribute("tongTien", tongTien);
        return "trang-chu/cart";
    }

    @PostMapping("/cart/add/{maTK}")
    public String addToCart(@PathVariable("maTK") Integer maTK, @RequestParam("soLuong") Integer soLuong) {
        gioHangService.addToCart(maTK, soLuong);
        return "redirect:/cart";
    }

//    @PostMapping("/cart/update/{id}")
//    public String updateCart(@PathVariable("id") Integer idTK, @RequestParam("soLuong") Integer soLuong) {
//        service.updateCart(idTK, soLuong);
//        return "redirect:/cart";
//    }

    @PostMapping("/cart/del1/{id}")
    public String del1(@PathVariable("id") Integer id) {
        Map<Integer, Integer> cart = gioHangService.getCart();
        Integer slHienTai = null;
        for (Map.Entry<Integer, Integer> x : cart.entrySet()) {
            if (id == x.getKey()) {
                slHienTai = x.getValue();
                break;
            }
        }
        if (slHienTai == 1) {
            gioHangService.deleteCart(id);
        } else {
            gioHangService.addToCart(id, -1);

        }
        return "redirect:/cart";
    }

    @PostMapping("/cart/add1/{id}")
    public String add1(@PathVariable("id") Integer id) {
        gioHangService.addToCart(id, 1);
        return "redirect:/cart";
    }

    @PostMapping("/cart/delete/{id}")
    public String deleteCart(@PathVariable("id") Integer id) {
        gioHangService.deleteCart(id);
        return "redirect:/cart";
    }
}
