package com.artisan.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {

<<<<<<< HEAD
	private String dbUrl="jdbc:mysql://localhost:3306/db_car_manager?characterEncoding=utf8";
	private String dbUserName="root";
	private String dbPassword="";
	private String jdbcName="com.mysql.jdbc.Driver";
	
	/**
	 * ��ȡ���ݿ�����
=======
	private String dbUrl="jdbc:mysql://localhost:3306/test?characterEncoding=utf8";
	private String dbUserName="root";
	private String dbPassword="123";
	private String jdbcName="com.mysql.jdbc.Driver";
	
	/**
	 * ��ȡ���ݿ�����
>>>>>>> 3c65fc0840adb18e94a646c41166a64850e7b074
	 * @return
	 * @throws Exception
	 */
	public Connection getCon() throws Exception{
		Class.forName(jdbcName);
		Connection con=DriverManager.getConnection(dbUrl,dbUserName,dbPassword);
		return con;
	}
	
	/**
<<<<<<< HEAD
	 * �ر����ݿ�����
=======
	 * �ر����ݿ�����
>>>>>>> 3c65fc0840adb18e94a646c41166a64850e7b074
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
<<<<<<< HEAD
			System.out.println("���ݿ����ӳɹ�");
=======
			System.out.println("���ݿ����ӳɹ�");
>>>>>>> 3c65fc0840adb18e94a646c41166a64850e7b074
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
