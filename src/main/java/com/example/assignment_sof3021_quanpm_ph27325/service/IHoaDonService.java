package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.entity.GioHangView;
import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDon;

import java.util.List;

public interface IHoaDonService {

    List<HoaDon> getAll();

    HoaDon themHoaDon(HoaDon hd);

    void themHoaDonChiTiet(List<GioHangView> lstTK, HoaDon hd);
}
