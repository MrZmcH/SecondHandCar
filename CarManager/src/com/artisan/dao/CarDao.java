package com.artisan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.artisan.model.Car;
import com.artisan.model.PageBean;
import com.artisan.util.StringUtil;

public class CarDao {
	
	
	public ResultSet getCarList(Connection con,PageBean pageBean,Car car) throws SQLException{
		StringBuffer sql=new StringBuffer("select c_car.*,c_car_brand.brandName from c_car,c_car_brand where c_car.brandId = c_car_brand.id");
		if(car.getBrandId() != null && car.getBrandId() > 0){
			sql.append(" and brandId = "+car.getBrandId());
		}
		if(!StringUtil.isEmpty(car.getCarName())){
			sql.append(" and carName like '%"+car.getCarName()+"%'");
		}
		if(!StringUtil.isEmpty(car.getCarAge())){
			sql.append(" and carAge = '"+car.getCarAge()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarGearBox())){
			sql.append(" and carGearBox = '"+car.getCarGearBox()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarType())){
			sql.append(" and carType = '"+car.getCarType()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarMileage())){
			sql.append(" and carMileage = '"+car.getCarMileage()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarOutputVolume())){
			sql.append(" and carOutputVolume = '"+car.getCarOutputVolume()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarOutputStand())){
			sql.append(" and carOutputStand = '"+car.getCarOutputStand()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarSeatCount())){
			sql.append(" and carSeatCount = '"+car.getCarSeatCount()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarOilType())){
			sql.append(" and carOilType = '"+car.getCarOilType()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarColor())){
			sql.append(" and carColor = '"+car.getCarColor()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarNumberPlace())){
			sql.append(" and carNumberPlace = '"+car.getCarNumberPlace()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarOldPrice())){
			sql.append(" and carOldPrice = '"+car.getCarOldPrice()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarPrice())){
			sql.append(" and carPrice = '"+car.getCarPrice()+"'");
		}
		if(pageBean != null){
			sql.append(" limit " + pageBean.getStart() +"," + pageBean.getRows());
		}
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		return pstmt.executeQuery();
	}
	
	public int getCarTotal(Connection con,Car car) throws SQLException{
		int total = 0;
		StringBuffer sql=new StringBuffer("select count(id) as total from c_car");
		if(car.getBrandId() != null && car.getBrandId() > 0){
			sql.append(" and brandId = "+car.getBrandId());
		}
		if(!StringUtil.isEmpty(car.getCarName())){
			sql.append(" and carName like '%"+car.getCarName()+"%'");
		}
		if(!StringUtil.isEmpty(car.getCarAge())){
			sql.append(" and carAge = '"+car.getCarAge()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarGearBox())){
			sql.append(" and carGearBox = '"+car.getCarGearBox()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarType())){
			sql.append(" and carType = '"+car.getCarType()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarMileage())){
			sql.append(" and carMileage = '"+car.getCarMileage()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarOutputVolume())){
			sql.append(" and carOutputVolume = '"+car.getCarOutputVolume()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarOutputStand())){
			sql.append(" and carOutputStand = '"+car.getCarOutputStand()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarSeatCount())){
			sql.append(" and carSeatCount = '"+car.getCarSeatCount()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarOilType())){
			sql.append(" and carOilType = '"+car.getCarOilType()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarColor())){
			sql.append(" and carColor = '"+car.getCarColor()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarNumberPlace())){
			sql.append(" and carNumberPlace = '"+car.getCarNumberPlace()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarOldPrice())){
			sql.append(" and carOldPrice = '"+car.getCarOldPrice()+"'");
		}
		if(!StringUtil.isEmpty(car.getCarPrice())){
			sql.append(" and carPrice = '"+car.getCarPrice()+"'");
		}
		PreparedStatement pstmt = con.prepareStatement(sql.toString().replaceFirst("and", "where"));
		ResultSet resultSet = pstmt.executeQuery();
		if(resultSet.next()){
			total = resultSet.getInt("total");
		}
		return total;
	}
	
	public int deleteCars(Connection con,String ids) throws SQLException{
		String sql = "delete from c_car where id in(" + ids + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int addCar(Connection con,Car car) throws SQLException{
		String sql = "insert into c_car values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, car.getBrandId());
		pstmt.setString(2, car.getCarName());
		pstmt.setString(3,car.getCarOldPrice());
		pstmt.setString(4,car.getCarPrice());
		pstmt.setString(5,car.getCarAge());
		pstmt.setString(6,car.getCarGearBox());
		pstmt.setString(7,car.getCarType());
		pstmt.setString(8,car.getCarMileage());
		pstmt.setString(9,car.getCarOutputVolume());
		pstmt.setString(10,car.getCarOutputStand());
		pstmt.setString(11,car.getCarSeatCount());
		pstmt.setString(12,car.getCarOilType());
		pstmt.setString(13,car.getCarColor());
		pstmt.setString(14,car.getCarNumberPlace());
		pstmt.setString(15,car.getCarInfo());
		return pstmt.executeUpdate();
	}
	public int editCar(Connection con,Car car) throws SQLException{
		String sql = "update c_car set brandId=?,carName=?,carOldPrice=?,carPrice=?,carAge=?,carGearBox=?,carType=?,carMileage=?,carOutputVolume=?,carOutputStand=?,carSeatCount=?,carOilType=?,carColor=?,carNumberPlace=?,carInfo=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, car.getBrandId());
		pstmt.setString(2, car.getCarName());
		pstmt.setString(3,car.getCarOldPrice());
		pstmt.setString(4,car.getCarPrice());
		pstmt.setString(5,car.getCarAge());
		pstmt.setString(6,car.getCarGearBox());
		pstmt.setString(7,car.getCarType());
		pstmt.setString(8,car.getCarMileage());
		pstmt.setString(9,car.getCarOutputVolume());
		pstmt.setString(10,car.getCarOutputStand());
		pstmt.setString(11,car.getCarSeatCount());
		pstmt.setString(12,car.getCarOilType());
		pstmt.setString(13,car.getCarColor());
		pstmt.setString(14,car.getCarNumberPlace());
		pstmt.setString(15,car.getCarInfo());
		pstmt.setInt(16,car.getId());
		return pstmt.executeUpdate();
	}
}
