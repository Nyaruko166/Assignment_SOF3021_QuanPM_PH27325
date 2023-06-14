package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.entity.GioHangView;
import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDon;
import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDonChiTiet;
import com.example.assignment_sof3021_quanpm_ph27325.repository.HoaDonChiTietRepository;
import com.example.assignment_sof3021_quanpm_ph27325.repository.HoaDonRepository;
import com.example.assignment_sof3021_quanpm_ph27325.repository.TaiKhoanGameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class HoaDonService implements IHoaDonService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hdctRepository;

    @Autowired
    private TaiKhoanGameRepository tkgRepository;

    @Override
    public HoaDon themHoaDon(HoaDon hd) {
        return hoaDonRepository.save(hd);
    }

    @Override
    public void themHoaDonChiTiet(List<GioHangView> lstTK, HoaDon hd) {
        Date date = new Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        for (GioHangView x : lstTK) {
            HoaDonChiTiet hdct = new HoaDonChiTiet(null, hd, tkgRepository.findById(x.getId()).orElse(null),
                    x.getSoLuongTrongGio(), x.getDonGia(), x.getTongTien(), sqlDate);
            hdctRepository.save(hdct);
        }
    }

    @Override
    public List<HoaDon> getAll() {
        return hoaDonRepository.findAll();
    }
}
