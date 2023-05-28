package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.model.TaiKhoanGame;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public interface ITaiKhoanGameService {
    List<TaiKhoanGame> getAll();

    TaiKhoanGame findByMa(UUID maTK);

    Boolean saveTK(TaiKhoanGame tk);

    String deleteTK(TaiKhoanGame tk);

    List<TaiKhoanGame> findByTenContains(String tenTK);

    List<TaiKhoanGame> findByDonGiaBetween(BigDecimal min, BigDecimal max);

}
