package com.example.assignment_sof3021_quanpm_ph27325.repository;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigDecimal;
import java.util.List;

public interface TaiKhoanGameRepository extends JpaRepository<TaiKhoanGame, Integer> {

    Page<TaiKhoanGame> findByTenContains(String tenTK, Pageable pageable);

    Page<TaiKhoanGame> findByDonGiaBetween(BigDecimal min, BigDecimal max, Pageable pageable);

    List<TaiKhoanGame> findByTenContains(String ten);

}
