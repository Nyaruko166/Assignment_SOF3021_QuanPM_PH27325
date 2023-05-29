package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.model.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.repository.ITaiKhoanGameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.UUID;

@Service
public class TaiKhoanGameService implements ITaiKhoanGameService {

    @Autowired
    private ITaiKhoanGameRepository repository;

    @Override
    public String deleteTK(TaiKhoanGame tk) {
        repository.delete(tk);
        return "Xoá Thành Công.";
    }

    @Override
    public Page<TaiKhoanGame> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public Boolean saveTK(TaiKhoanGame tk) {
        repository.save(tk);
        return true;
    }

    @Override
    public TaiKhoanGame findByMa(UUID maTK) {
        return repository.findById(maTK).orElse(null);
    }

    @Override
    public Page<TaiKhoanGame> findByTenContains(String tenTK, Pageable pageable) {
        return repository.findByTenContains(tenTK, pageable);
    }

    @Override
    public Page<TaiKhoanGame> findByDonGiaBetween(BigDecimal min, BigDecimal max, Pageable pageable) {
        return repository.findByDonGiaBetween(min, max, pageable);
    }
}
