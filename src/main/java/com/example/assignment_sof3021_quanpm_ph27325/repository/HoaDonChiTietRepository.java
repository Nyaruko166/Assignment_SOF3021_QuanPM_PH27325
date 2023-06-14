package com.example.assignment_sof3021_quanpm_ph27325.repository;

import com.example.assignment_sof3021_quanpm_ph27325.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Integer> {

    List<HoaDonChiTiet> findByHoaDon_Id(Integer idHD);

}
