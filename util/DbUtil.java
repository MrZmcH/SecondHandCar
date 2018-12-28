package com.artisan.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {

	private String dbUrl="jdbc:mysql://localhost:3306/news?characterEncoding=utf8";
	private String dbUserName="root";
	private String dbPassword="lisen123";
	private String jdbcName="com.news.jdbc.Driver";//加载数据库驱动，注册到驱动管理器+++++++
	
	/**
	 * ��ȡ���ݿ�����
	 * @return
	 * @throws Exception
	 */
	public Connection getCon() throws Exception{//定义connection 方法连接数据库
		Class.forName(jdbcName);//加载数据库驱动，注册到驱动管理器
		Connection con=DriverManager.getConnection(dbUrl,dbUserName,dbPassword);//连接数据库
		return con;
	}
	
	/**
	 * �ر����ݿ�����
	 * @param con
	 * @throws Exception
	 */
	public void closeCon(Connection con) throws Exception{
		if(con!=null){
			con.close();
		}
	}
	
	public static void main(String[] args) {
		DbUtil dbUtil=new DbUtil();
		try {
			dbUtil.getCon();
			System.out.println("连接成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
