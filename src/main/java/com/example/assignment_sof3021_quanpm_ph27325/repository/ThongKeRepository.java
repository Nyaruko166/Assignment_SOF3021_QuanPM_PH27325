package com.example.assignment_sof3021_quanpm_ph27325.repository;

import com.example.assignment_sof3021_quanpm_ph27325.entity.TaiKhoanGame;
import com.example.assignment_sof3021_quanpm_ph27325.entity.ThongKe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThongKeRepository extends JpaRepository<TaiKhoanGame, Integer> {

    @Query("""
                SELECT new com.example.assignment_sof3021_quanpm_ph27325.entity.ThongKe(tkg.ten, SUM(hdct.soLuong))
                FROM TaiKhoanGame tkg
                JOIN HoaDonChiTiet hdct ON tkg.id = hdct.taiKhoanGame.id
                JOIN HoaDon hd ON hdct.hoaDon.id = hd.id
                WHERE MONTH(hd.ngayThanhToan) =:thang AND YEAR(hd.ngayThanhToan) =:nam
                GROUP BY tkg.ten
                ORDER BY SUM(hdct.soLuong) DESC
            """)
    List<ThongKe> banChayNhatTheoThang(@Param("thang") Integer thang, @Param("nam") Integer nam);

}
