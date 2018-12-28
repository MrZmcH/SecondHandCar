package com.artisan.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 把ResultSet集合转换成JsonArray数组
 * @param
 * @return
 * @throws Exception
 */
public class JsonUtil {
//如果以list传入数据 会报错
	public static JSONArray formatRsToJsonArray(ResultSet rs)throws Exception{
		ResultSetMetaData md=rs.getMetaData();//获取表结构
		int num=md.getColumnCount();//定义列的数量
		JSONArray array=new JSONArray();// json数组，根据下标找值；[{name1:wp},{name2:{name3:'ww'}}]name为key值，wp为value值
		while(rs.next()){//如果结果集有值
			JSONObject mapOfColValues=new JSONObject();//构造一个JSONObject对象
			for(int i=1;i<=num;i++){
				Object o=rs.getObject(i);
				mapOfColValues.put(md.getColumnName(i), rs.getObject(i));// 添加键值对，比如说{name:Wp}通过name找到wp
			}
			array.add(mapOfColValues);
		}
		return array;
	}
}
