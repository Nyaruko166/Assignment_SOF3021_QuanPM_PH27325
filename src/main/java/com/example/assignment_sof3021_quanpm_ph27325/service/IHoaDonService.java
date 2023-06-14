package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.entity.GioHangView;
import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDon;
import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDonChiTiet;

import java.util.List;

public interface IHoaDonService {

    List<HoaDon> getAll();

    List<HoaDonChiTiet> getAllHDCT();

    List<HoaDonChiTiet> findByID(Integer idHD);

    HoaDon themHoaDon(HoaDon hd);

    void themHoaDonChiTiet(List<GioHangView> lstTK, HoaDon hd);
}
