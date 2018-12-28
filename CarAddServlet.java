package com.artisan.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.artisan.dao.CarDao;
import com.artisan.model.Car;
import com.artisan.util.DbUtil;
import com.artisan.util.ResponseUtil;
import com.artisan.util.StringUtil;

public class CarAddServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private DbUtil dbUtil = new DbUtil();
	private CarDao carDao = new CarDao();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String idString = request.getParameter("id");
		String brandIdString = request.getParameter("brandId");
		String carName = request.getParameter("carName");
		String carOldPrice = request.getParameter("carOldPrice");
		String carPrice = request.getParameter("carPrice");
		String carAge = request.getParameter("carAge");
		String carGearBox = request.getParameter("carGearBox");
		String carType = request.getParameter("carType");
		String carMileage = request.getParameter("carMileage");
		String carOutputVolume = request.getParameter("carOutputVolume");
		String carOutputStand = request.getParameter("carOutputStand");
		String carSeatCount = request.getParameter("carSeatCount");
		String carOilType = request.getParameter("carOilType");
		String carColor = request.getParameter("carColor");
		String carNumberPlace = request.getParameter("carNumberPlace");
		String carInfo = request.getParameter("carInfo");
		Car car = new Car();
		JSONObject result = new JSONObject();
		if(StringUtil.isEmpty(brandIdString)){
			result.put("error_msg", "所属品牌不能为空!");
			try {
				ResponseUtil.write(response, result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		if(!StringUtil.isEmpty(idString)){
			car.setId(Integer.parseInt(idString));
		}
		car.setCarName(carName);
		car.setBrandId(Integer.parseInt(brandIdString));
		car.setCarOldPrice(carOldPrice);
		car.setCarPrice(carPrice);
		car.setCarAge(carAge);
		car.setCarGearBox(carGearBox);
		car.setCarType(carType);
		car.setCarMileage(carMileage);
		car.setCarOutputVolume(carOutputVolume);
		car.setCarOutputStand(carOutputStand);
		car.setCarSeatCount(carSeatCount);
		car.setCarOilType(carOilType);
		car.setCarColor(carColor);
		car.setCarNumberPlace(carNumberPlace);
		car.setCarInfo(carInfo);
		
		Connection con = null;
		try {
			con = dbUtil.getCon();
			int addNum = 0;
			if(StringUtil.isEmpty(idString)){
				addNum = carDao.addCar(con, car);
			}else{
				addNum = carDao.editCar(con, car);
			}
			if(addNum > 0){
				result.put("success", "true");
			}else{
				result.put("errorMsg", "添加失败!");
			}
			ResponseUtil.write(response, result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
