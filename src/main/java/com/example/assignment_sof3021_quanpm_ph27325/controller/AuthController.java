package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoan;
import com.example.assignment_sof3021_quanpm_ph27325.service.ITaiKhoanService;
import com.example.assignment_sof3021_quanpm_ph27325.ultis.UsefulShit;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class AuthController {

    UsefulShit usefulShit = new UsefulShit();

    List<TaiKhoan> lstTK = new ArrayList<>();

    @Autowired
    private ITaiKhoanService service;

    @PostMapping("/login")
    public String check(Model model,
                        HttpSession session,
                        @RequestParam("username") String username,
                        @RequestParam("password") String password
    ) {

        resetSession(session);

        TaiKhoan user = null;

        user = (TaiKhoan) session.getAttribute("user");

        if (user == null) {
            lstTK = service.getAll();
            for (TaiKhoan x : lstTK) {
                if (x.getUsername().equals(username) && x.getPassword().equals(password)) {
                    session.setAttribute("user", x);
                    return "redirect:/";
                }
            }
            model.addAttribute("err", "Username hoặc Password sai!!");
            return "auth/login";
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/dat-mk")
    public String datMK(Model model, @RequestParam("email") String email, HttpSession session) {

        resetSession(session);

        lstTK = service.getAll();

        for (TaiKhoan x : lstTK) {
            if (x.getEmail().equals(email)) {
                String newPass = usefulShit.randomPass(10);
                x.setPassword(newPass);
                service.saveTK(x);
                usefulShit.sendEmail(email, newPass);
                session.setAttribute("datmk", "Yêu cầu đặt lại mật khẩu thành công!! Vui lòng check email của bạn.");
                return "redirect:/dang-nhap";
            }
        }
        model.addAttribute("err", "Email không tồn tại !!!");
        return "auth/forgor";
    }

    @PostMapping("/register")
    public String register(Model model, HttpSession session,
                           @RequestParam("username") String username,
                           @RequestParam("email") String email,
                           @RequestParam("password") String password,
                           @RequestParam("rePassword") String rePassword
    ) {

        resetSession(session);

        if (password.equals(rePassword)) {
            service.saveTK(new TaiKhoan(null, username, password, email, "Khách Hàng"));
            model.addAttribute("mess", "Đăng ký thành công!! ");
            return "auth/login";
        } else {
            model.addAttribute("err", "Mật khẩu không trùng!! ");
            return "auth/reg";
        }
    }

    @GetMapping("/thong-tin")
    public String profile(Model model, HttpSession session) {

        TaiKhoan user = null;

        user = (TaiKhoan) session.getAttribute("user");

        if (user == null) {
            return "redirect:/";
        } else {
            return "auth/profile";
        }
    }

    @PostMapping("/change-pass")
    public String doimk(Model model,
                        @RequestParam("email") String email,
                        @RequestParam("currentPass") String currentPass,
                        @RequestParam("newPass") String newPass,
                        @RequestParam("reNewPass") String reNewPass,
                        HttpSession session
    ) {
        resetSession(session);
        lstTK = service.getAll();
        for (TaiKhoan x : lstTK) {
            if (x.getEmail().equals(email) && x.getPassword().equals(currentPass)) {
                if (newPass.equals(reNewPass)) {
                    x.setPassword(newPass);
                    service.saveTK(x);
                    session.setAttribute("mess", "Cập nhật mật khẩu thành công");
                    return "redirect:/dang-nhap";

                } else {
                    session.setAttribute("err", "Mật khẩu không trùng");
                    return "redirect:/doi-mk";

                }
            } else {
                session.setAttribute("err", "Sai email hoặc mật khẩu");
                return "redirect:/doi-mk";

            }
        }
        return null;
    }

    @GetMapping("/dang-xuat")
    public String logout(Model model, HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }

    @GetMapping("/dang-nhap")
    public String login(Model model) {

        return "auth/login";
    }

    @GetMapping("/doi-mk")
    public String changepass(Model model) {

        return "auth/changepass";
    }

    @GetMapping("/dang-ky")
    public String reg(Model model) {

        return "auth/reg";
    }

    @GetMapping("/quen-mk")
    public String forgor(Model model) {

        return "auth/forgor";
    }

    private void resetSession(HttpSession session) {
        session.removeAttribute("err");
        session.removeAttribute("mess");
        session.removeAttribute("datmk");
    }
}
