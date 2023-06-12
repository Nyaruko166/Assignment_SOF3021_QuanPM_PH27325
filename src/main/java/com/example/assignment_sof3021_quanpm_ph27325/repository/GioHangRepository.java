package com.example.assignment_sof3021_quanpm_ph27325.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
@Getter
@Setter
public class GioHangRepository {

    private Map<Integer, Integer> cartTK = new HashMap<>();

}
