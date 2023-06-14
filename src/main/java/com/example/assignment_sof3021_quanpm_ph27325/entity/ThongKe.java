package com.example.assignment_sof3021_quanpm_ph27325.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ThongKe {

    private String ten;

    private Long soLuong;

    public ThongKe(String ten, Long soLuong) {
        this.ten = ten;
        this.soLuong = soLuong;
    }
}
