package com.example.assignment_sof3021_quanpm_ph27325.repository;

import com.example.assignment_sof3021_quanpm_ph27325.model.TaiKhoanGame;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ITaiKhoanGameRepository extends JpaRepository<TaiKhoanGame, UUID> {
}
