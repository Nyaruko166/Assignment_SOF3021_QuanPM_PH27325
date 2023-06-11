package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;

public interface ITaiKhoanGameService {
    Page<TaiKhoanGame> getAll(Pageable pageable);

    TaiKhoanGame findByMa(Integer maTK);

    Boolean saveTK(TaiKhoanGame tk);

    String deleteTK(TaiKhoanGame tk);

    Page<TaiKhoanGame> findByTenContains(String tenTK, Pageable pageable);

    Page<TaiKhoanGame> findByDonGiaBetween(BigDecimal min, BigDecimal max, Pageable pageable);

}
