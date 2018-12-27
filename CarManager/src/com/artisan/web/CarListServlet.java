package com.artisan.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.artisan.dao.CarDao;
import com.artisan.model.Car;
import com.artisan.model.PageBean;
import com.artisan.util.DbUtil;
import com.artisan.util.JsonUtil;
import com.artisan.util.ResponseUtil;
import com.artisan.util.StringUtil;

public class CarListServlet extends HttpServlet {

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
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
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
		if(!StringUtil.isEmpty(brandIdString)){
			car.setBrandId(Integer.parseInt(brandIdString));
		}
		car.setCarName(carName);
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
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Connection con = null;
		try {
			con = dbUtil.getCon();
			JSONObject result = new JSONObject();
			JSONArray jsonArray = JsonUtil.formatRsToJsonArray(carDao.getCarList(con, pageBean,car));
			result.put("total", carDao.getCarTotal(con,car));
			result.put("rows", jsonArray);
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
