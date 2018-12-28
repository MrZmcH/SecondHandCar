package com.artisan.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class ResponseUtil {

	public static void write(HttpServletResponse response,Object o)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();//获取一个输出流
		out.println(o.toString());
		out.flush();//用于清空缓冲区的数据流
		out.close();//关闭读写流
	}
}
