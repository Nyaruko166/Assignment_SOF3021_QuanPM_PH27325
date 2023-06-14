package com.example.assignment_sof3021_quanpm_ph27325.service;

import java.util.Map;

public interface IGioHangService {
    void addToCart(Integer idTK, Integer soLuong);

    Map<Integer, Integer> getCart();

    void updateCart(Integer idTK, Integer soLuong);

    void deleteCart(Integer idTK);

    void emptyCart(Map<Integer, Integer> empty);
}
