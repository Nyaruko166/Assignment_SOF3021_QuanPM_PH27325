package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoan;
import com.example.assignment_sof3021_quanpm_ph27325.repository.TaiKhoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaiKhoanService implements ITaiKhoanService {

    @Autowired
    private TaiKhoanRepository repository;

    @Override
    public List<TaiKhoan> getAll() {
        return repository.findAll();
    }

    @Override
    public TaiKhoan findById(Integer id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public Boolean saveTK(TaiKhoan tk) {
        repository.save(tk);
        return true;
    }

    @Override
    public String deleteTK(TaiKhoan tk) {
        repository.delete(tk);
        return "Xoá Thành Công.";
    }
}
