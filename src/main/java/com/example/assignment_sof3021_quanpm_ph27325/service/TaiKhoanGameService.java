package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.model.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.repository.ITaiKhoanGameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class TaiKhoanGameService implements ITaiKhoanGameService {

    @Autowired
    private ITaiKhoanGameRepository repository;

    @Override
    public List<TaiKhoanGame> getAll() {
        return repository.findAll();
    }

    @Override
    public TaiKhoanGame findByMa(UUID maTK) {
        return repository.findById(maTK).orElse(null);
    }
}
