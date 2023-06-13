package com.example.assignment_sof3021_quanpm_ph27325.repository;

import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Integer> {
}
