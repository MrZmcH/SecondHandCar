package com.artisan.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.artisan.dao.CarBrandDao;
import com.artisan.model.CarBrand;
import com.artisan.model.PageBean;
import com.artisan.util.DbUtil;
import com.artisan.util.JsonUtil;
import com.artisan.util.ResponseUtil;
import com.artisan.util.StringUtil;

public class CarBrandAddServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private DbUtil dbUtil = new DbUtil();
	private CarBrandDao carBrandDao = new CarBrandDao();
	
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
		String brandName = request.getParameter("brandName");
		String brandInfo = request.getParameter("brandInfo");
		String idString = request.getParameter("id");
		JSONObject result = new JSONObject();
		if(StringUtil.isEmpty(brandName)){
			result.put("error_msg", "名称不能为空!");
			try {
				ResponseUtil.write(response, result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		Connection con = null;
		CarBrand carBrand = new CarBrand();
		carBrand.setBrandName(brandName);
		carBrand.setBrandInfo(brandInfo);
		if(!StringUtil.isEmpty(idString)){
			carBrand.setId(Integer.parseInt(idString));
		}
		try {
			con = dbUtil.getCon();
			int addBrandsNum = 0;
			if(StringUtil.isEmpty(idString)){
				addBrandsNum = carBrandDao.addCarBrand(con, carBrand);
			}else{
				addBrandsNum = carBrandDao.editCarBrand(con, carBrand);
			}
			if(addBrandsNum > 0){
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
