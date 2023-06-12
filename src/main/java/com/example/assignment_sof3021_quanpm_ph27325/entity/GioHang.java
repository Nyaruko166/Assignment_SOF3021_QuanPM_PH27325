package com.example.assignment_sof3021_quanpm_ph27325.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GioHang {

    private Map<Integer, Integer> cartTK = new HashMap<>();

}
