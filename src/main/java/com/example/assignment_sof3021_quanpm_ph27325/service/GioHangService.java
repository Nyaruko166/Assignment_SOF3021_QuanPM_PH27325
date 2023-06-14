package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.repository.GioHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class GioHangService implements IGioHangService {

    @Autowired
    private GioHangRepository repository;

    @Override
    public void addToCart(Integer idTK, Integer soLuong) {
        Map<Integer, Integer> cart = repository.getCartTK();
        if (cart.containsKey(idTK)) {
            Integer slHienTai = cart.get(idTK);
            cart.put(idTK, slHienTai + soLuong);
        } else {
            cart.put(idTK, soLuong);
        }
    }

    @Override
    public Map<Integer, Integer> getCart() {
        return repository.getCartTK();
    }

    @Override
    public void updateCart(Integer idTK, Integer soLuong) {
        Map<Integer, Integer> cart = repository.getCartTK();
        cart.put(idTK, soLuong);
    }

    @Override
    public void deleteCart(Integer idTK) {
        Map<Integer, Integer> cart = repository.getCartTK();
        cart.remove(idTK);
    }

    @Override
    public void emptyCart(Map<Integer, Integer> empty) {
        repository.setCartTK(empty);
    }
}
