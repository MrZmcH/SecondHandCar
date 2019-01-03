package com.artisan.model;

public class CarBrand {
	private Integer id;
	private String brandName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandInfo() {
		return brandInfo;
	}
	public void setBrandInfo(String brandInfo) {
		this.brandInfo = brandInfo;
	}
	private String brandInfo;
	
}
