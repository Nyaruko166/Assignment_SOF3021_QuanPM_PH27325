package com.example.assignment_sof3021_quanpm_ph27325.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
public class ThongKe {

    private String ten;

    private Long soLuong;

    private Date ngay;

    public ThongKe(String ten, Long soLuong, Date ngay) {
        this.ten = ten;
        this.soLuong = soLuong;
        this.ngay = ngay;
    }
}
