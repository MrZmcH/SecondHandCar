package com.artisan.util;

public class StringUtil {

	public static boolean isEmpty(String str){
		if("".equals(str)|| str==null){//判断 str 是否为空
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNotEmpty(String str){
		if(!"".equals(str)&&str!=null){
			return true;
		}else{
			return false;
		}
	}
}
