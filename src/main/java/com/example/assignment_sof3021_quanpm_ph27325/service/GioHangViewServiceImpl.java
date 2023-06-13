package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.entity.GioHangView;
import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.repository.GioHangViewRepository;
import com.example.assignment_sof3021_quanpm_ph27325.repository.TaiKhoanGameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class GioHangViewServiceImpl implements IGioHangViewService {

    @Autowired
    private IGioHangService service;

    @Autowired
    private TaiKhoanGameRepository TKrepository;

    @Autowired
    private GioHangViewRepository gioHangViewRepository;

    @Override
    public void gioHangConvert() {

        Map<Integer, Integer> cart = service.getCart();
        List<GioHangView> cartView = new ArrayList<>();
        List<TaiKhoanGame> lstTK = TKrepository.findAll();

        for (Map.Entry<Integer, Integer> x : cart.entrySet()) {
            for (TaiKhoanGame y : lstTK) {
                if (y.getId() == x.getKey()) {
                    cartView.add(new GioHangView(y.getId(), y.getTen(), x.getValue(), y.getDonGia(), y.getServer(),
                            y.getAnh(), BigDecimal.valueOf(x.getValue()).multiply(y.getDonGia())));
                }
            }
        }

        gioHangViewRepository.setCartView(cartView);
    }

    @Override
    public List<GioHangView> getCartView() {
        gioHangConvert();
        return gioHangViewRepository.getCartView();
    }
}
