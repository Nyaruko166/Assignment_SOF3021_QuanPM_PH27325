package com.example.assignment_sof3021_quanpm_ph27325.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GioHangView {

    private Integer id;

    private String ten;

    private Integer soLuongTrongGio;

    private BigDecimal donGia;

    private String server;

    private String anh;

    private BigDecimal tongTien;
}
