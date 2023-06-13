package com.example.assignment_sof3021_quanpm_ph27325.repository;

import com.example.assignment_sof3021_quanpm_ph27325.entity.GioHangView;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@Getter
@Setter
public class GioHangViewRepository {

    List<GioHangView> cartView = new ArrayList<>();

}
