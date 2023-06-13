package com.example.assignment_sof3021_quanpm_ph27325.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.sql.Date;

@Entity
@Table(name = "hoadonchitiet")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HoaDonChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idhd", referencedColumnName = "id")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "idtk", referencedColumnName = "id")
    private TaiKhoanGame taiKhoanGame;

    @Column(name = "soluong")
    private Integer soLuong;

    @Column(name = "dongia")
    private BigDecimal donGia;

    @Column(name = "thanhtien")
    private BigDecimal thanhTien;

    @Column(name = "ngaytao")
    private Date ngayTao;
}
