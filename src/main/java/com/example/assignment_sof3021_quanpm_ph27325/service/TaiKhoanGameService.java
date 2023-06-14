package com.example.assignment_sof3021_quanpm_ph27325.service;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.repository.TaiKhoanGameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class TaiKhoanGameService implements ITaiKhoanGameService {

    @Autowired
    private TaiKhoanGameRepository repository;

    @Override
    public String deleteTK(TaiKhoanGame tk) {
        repository.delete(tk);
        return "Xoá Thành Công.";
    }

    @Override
    public Page<TaiKhoanGame> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public Boolean saveTK(TaiKhoanGame tk) {
        repository.save(tk);
        return true;
    }

    @Override
    public TaiKhoanGame findByMa(Integer maTK) {
        return repository.findById(maTK).orElse(null);
    }

    @Override
    public Page<TaiKhoanGame> findByTenContains(String tenTK, Pageable pageable) {
        return repository.findByTenContains(tenTK, pageable);
    }

    @Override
    public Page<TaiKhoanGame> findByDonGiaBetween(BigDecimal min, BigDecimal max, Pageable pageable) {
        return repository.findByDonGiaBetween(min, max, pageable);
    }

    @Override
    public List<TaiKhoanGame> findByTenContains(String ten) {
        return repository.findByTenContains(ten);
    }

    //    public static void main(String[] args) {
//        ITaiKhoanService service = new TaiKhoanService();
//        List<TaiKhoan> lstTK = service.getAll();
//        for (TaiKhoan x : lstTK) {
//            System.out.println(x.toString());
//
//        }
//    }
}
