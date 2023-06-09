package com.example.assignment_sof3021_quanpm_ph27325.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.sql.Date;

@Entity
@Table(name = "hoadon")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "tongtien")
    private BigDecimal tongTien;

    @Column(name = "tenkhachhang")
    private String tenKhachHang;

    @Column(name = "ngaythanhtoan")
    private Date ngayThanhToan;

}
