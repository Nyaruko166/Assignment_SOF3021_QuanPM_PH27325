package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoan;

import java.util.List;

public interface ITaiKhoanService {

    List<TaiKhoan> getAll();

    TaiKhoan findById(Integer id);

    Boolean saveTK(TaiKhoan tk);

    String deleteTK(TaiKhoan tk);

}
