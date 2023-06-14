package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.service.ITaiKhoanGameService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Controller
@RequestMapping("/crud")
public class TaiKhoanGameController {

    @Autowired
    private ITaiKhoanGameService service;

    private TaiKhoanGame tk = new TaiKhoanGame();

    private void loadTbl(Model model, int page) {
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<TaiKhoanGame> pageTK = service.getAll(pageable);
        model.addAttribute("pageTK", pageTK);
    }

    @GetMapping("/tk-game")
    public String view(Model model,
                       @RequestParam(value = "findByName", required = false) String tenTK,
                       @RequestParam(value = "page", defaultValue = "1") int page,
                       HttpSession session
    ) {
        Page<TaiKhoanGame> pageTK;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 2);
//        List<TaiKhoanGame> lstTK;
        if (tenTK == null || tenTK.isBlank()) {
            pageTK = service.getAll(pageable);
        } else {
            pageTK = service.findByTenContains(tenTK, pageable);
        }
        model.addAttribute("pageTK", pageTK);
//        return "trang-chu/index";
        return "quan-tri/tk-game";
    }

    @GetMapping(value = "/tk-game", params = "findRange")
    public String findByRange(Model model,
                              @RequestParam(value = "min", required = false) BigDecimal min,
                              @RequestParam(value = "max", required = false) BigDecimal max,
                              @RequestParam(value = "page", defaultValue = "1") int page) {
        Page<TaiKhoanGame> pageTK;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 2);
        pageTK = service.findByDonGiaBetween(min, max, pageable);
        model.addAttribute("pageTK", pageTK);
        return "quan-tri/tk-game";
    }

    @GetMapping("/reset")
    public String rest(Model model,
                       HttpSession session
    ) {
        session.removeAttribute("mess");
        session.removeAttribute("tk");
        return "redirect:/crud/tk-game";
    }

    @PostMapping(value = "/tk-game/add")
    public String addTK(Model model,
                        @RequestParam(name = "ma") String ma,
                        @RequestParam(name = "ten") String ten,
                        @RequestParam(name = "soLuong") Integer soLuong,
                        @RequestParam(name = "donGia") BigDecimal donGia,
                        @RequestParam(name = "server") String server,
                        @RequestParam(name = "anh") MultipartFile anh,
                        HttpSession session
    ) {
        session.removeAttribute("mess");
        session.removeAttribute("tk");
        String fileName = StringUtils.cleanPath(anh.getOriginalFilename());
        copyImg(anh, fileName);
        service.saveTK(new TaiKhoanGame(null, ma, ten, soLuong, donGia, server, "/img/" + fileName));
        session.setAttribute("mess", "Thêm Thành Công.");
//        loadTbl(model, page);
//        model.addAttribute("mess", "Thêm Thành Công.");
//        return "quan-tri/tk-game";
        return "redirect:/crud/tk-game";
    }

    @GetMapping("/delete/{idTK}")
    public String deleteTK(@PathVariable("idTK") Integer id, Model model,
                           HttpSession session) throws IOException {
        session.removeAttribute("mess");
        session.removeAttribute("tk");
        TaiKhoanGame tk = service.findByMa(id);
        Files.deleteIfExists(Path.of("./src/main/webapp" + tk.getAnh()));
//        loadTbl(model, page);
//        model.addAttribute("mess", service.deleteTK(tk));
//        return "quan-tri/tk-game";
        session.setAttribute("mess", service.deleteTK(tk));
        return "redirect:/crud/tk-game";
    }

    @GetMapping("/detail/{idTK}")
    public String detailTK(@PathVariable("idTK") Integer id, Model model,
                           @RequestParam(value = "page", defaultValue = "1") int page,
                           HttpSession session) {
        session.removeAttribute("mess");
        session.removeAttribute("tk");
        tk = service.findByMa(id);
        loadTbl(model, page);
        session.setAttribute("tk", tk);
        return "quan-tri/tk-game";
    }

    @PostMapping("/tk-game/update")
    public String updateTK(Model model,
                           @RequestParam(name = "ma") String ma,
                           @RequestParam(name = "ten") String ten,
                           @RequestParam(name = "soLuong") Integer soLuong,
                           @RequestParam(name = "donGia") BigDecimal donGia,
                           @RequestParam(name = "server") String server,
                           @RequestParam(name = "anh") MultipartFile anh,
                           HttpSession session) throws IOException {
        session.removeAttribute("mess");
        session.removeAttribute("tk");
        if (tk.getId() == null) {
            session.setAttribute("mess", "Vui lòng chọn mục muốn sửa !!!");
        } else {
            tk.setMa(ma);
            tk.setTen(ten);
            tk.setSoLuong(soLuong);
            tk.setDonGia(donGia);
            tk.setServer(server);
            if (!anh.isEmpty()) {
                String fileName = StringUtils.cleanPath(anh.getOriginalFilename());
                Files.deleteIfExists(Path.of("./src/main/webapp" + tk.getAnh()));
                tk.setAnh("/img/" + fileName);
                copyImg(anh, fileName);
            }
            if (service.saveTK(tk)) {
//                loadTbl(model, page);
                session.setAttribute("mess", "Sửa Thành Công.");
            }

        }
//        return "quan-tri/tk-game";
        return "redirect:/crud/tk-game";
    }

    public void copyImg(MultipartFile anh, String fileName) {
        try {
            String uploadDir = "./src/main/webapp/img";
            Path path = Paths.get(uploadDir);
            try (InputStream inputStream = anh.getInputStream()) {
                Path filePath = path.resolve(fileName);
                Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
