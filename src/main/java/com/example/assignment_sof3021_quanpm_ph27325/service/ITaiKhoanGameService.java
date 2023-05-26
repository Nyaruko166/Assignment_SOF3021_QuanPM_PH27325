package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.model.TaiKhoanGame;

import java.util.List;
import java.util.UUID;

public interface ITaiKhoanGameService {
    List<TaiKhoanGame> getAll();

    TaiKhoanGame findByMa(UUID maTK);
}
