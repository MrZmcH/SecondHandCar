package com.artisan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.artisan.model.CarBrand;
import com.artisan.model.PageBean;
import com.artisan.util.StringUtil;

public class CarBrandDao {
		StringBuffer sql=new StringBuffer("select * from c_car_brand");
		if(!StringUtil.isEmpty(carBrand.getBrandName())){


			public ResultSet getCarBrandList(Connection con,PageBean pageBean,CarBrand carBrand) throws SQLException{
			sql.append(" where brandName like '%"+carBrand.getBrandName()+"%'");
		}

	

	
	public int deleteBrands(Connection con,String ids) throws SQLException{
		String sql = "delete from c_car_brand where id in(" + ids + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int addCarBrand(Connection con,CarBrand carBrand) throws SQLException{
		String sql = "insert into c_car_brand values(null,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, carBrand.getBrandName());
		pstmt.setString(2, carBrand.getBrandInfo());
		return pstmt.executeUpdate();
	}
	public int editCarBrand(Connection con,CarBrand carBrand) throws SQLException{
		String sql = "update c_car_brand set brandName=?,brandInfo=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, carBrand.getBrandName());
		pstmt.setString(2, carBrand.getBrandInfo());
		pstmt.setInt(3, carBrand.getId();)
		return pstmt.executeUpdate();
	}
}
