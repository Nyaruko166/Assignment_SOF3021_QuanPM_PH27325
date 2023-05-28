package com.example.assignment_sof3021_quanpm_ph27325.controller;

import com.example.assignment_sof3021_quanpm_ph27325.model.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.service.ITaiKhoanGameService;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping
public class TaiKhoanGameController {

    @Autowired
    private ITaiKhoanGameService service;

    private TaiKhoanGame tk = new TaiKhoanGame();

    private void loadTbl(Model model) {
        List<TaiKhoanGame> lstTK = service.getAll();
        model.addAttribute("lstTK", lstTK);
    }

    @GetMapping
    public String view(Model model,
                       @RequestParam(value = "findByName", required = false) String tenTK,
                       @RequestParam(value = "min", required = false) BigDecimal min,
                       @RequestParam(value = "max", required = false) BigDecimal max) {
        List<TaiKhoanGame> lstTK;
        if (tenTK == null || tenTK.isBlank()) {
            lstTK = service.getAll();
        } else {
            lstTK = service.findByTenContains(tenTK);
        }
        model.addAttribute("lstTK", lstTK);
//        return "trang-chu/index";
        return "crud-tk-game/tk-game";
    }

//    @GetMapping("/detail/{maTK}")
//    public String detailTK(Model model,
//                           @PathVariable("maTK") UUID maTK) {
//        TaiKhoanGame tk = service.findByMa(maTK);
//        List<TaiKhoanGame> lstTK = service.getAll();
//        model.addAttribute("lstTK", lstTK);
//        model.addAttribute("tk", tk);
//        return "trang-chu/detail";
//    }

    @PostMapping(value = "/crud/tk-game/add")
    public String addTK(Model model,
                        @RequestParam(name = "ma") String ma,
                        @RequestParam(name = "ten") String ten,
                        @RequestParam(name = "soLuong") Integer soLuong,
                        @RequestParam(name = "donGia") BigDecimal donGia,
                        @RequestParam(name = "server") String server,
                        @RequestParam(name = "anh") MultipartFile anh
    ) {
        String fileName = StringUtils.cleanPath(anh.getOriginalFilename());
        copyImg(anh, fileName);
        service.saveTK(new TaiKhoanGame(null, ma, ten, soLuong, donGia, server, "/img/" + fileName));
        loadTbl(model);
        model.addAttribute("mess", "Thêm Thành Công.");
        return "crud-tk-game/tk-game";
    }

    @GetMapping("/crud/delete/{idTK}")
    public String deleteTK(@PathVariable("idTK") UUID id, Model model) throws IOException {
        TaiKhoanGame tk = service.findByMa(id);
        Files.deleteIfExists(Path.of("./src/main/webapp" + tk.getAnh()));
        loadTbl(model);
        model.addAttribute("mess", service.deleteTK(tk));
        return "crud-tk-game/tk-game";
    }

    @GetMapping("/crud/detail/{idTK}")
    public String detailTK(@PathVariable("idTK") UUID id, Model model) {
        tk = service.findByMa(id);
        loadTbl(model);
        model.addAttribute("tk", tk);
        return "crud-tk-game/tk-game";
    }

    @PostMapping("/crud/tk-game/update")
    public String updateTK(Model model,
                           @RequestParam(name = "ma") String ma,
                           @RequestParam(name = "ten") String ten,
                           @RequestParam(name = "soLuong") Integer soLuong,
                           @RequestParam(name = "donGia") BigDecimal donGia,
                           @RequestParam(name = "server") String server,
                           @RequestParam(name = "anh") MultipartFile anh) throws IOException {
        if (tk.getId() == null) {
            model.addAttribute("mess", "Vui lòng chọn mục muốn sửa !!!");
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
                loadTbl(model);
                model.addAttribute("mess", "Sửa Thành Công.");
            }

        }
        return "crud-tk-game/tk-game";
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
