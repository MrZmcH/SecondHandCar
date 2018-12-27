<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>二手车管理系统后台主界面</title>
<%
	if(session.getAttribute("currentUser") == null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//定义属性菜单数据
	var treeData = [{
			text:'汽车信息管理',
			children:[{
					text:'汽车品牌管理',
					attributes:{
							url:'carBrandManager.jsp'
						}
				},
				{
					text:'汽车管理',
					attributes:{
							url:'carManager.jsp'
						}
				}
			]
		}];
	//初始化菜单数据
	$("#tree").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
					if(node.attributes){
							openTab(node.text,node.attributes.url);
						}
				}
		});
	//定义菜单事件
	function openTab(text,url){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);	
			return;
		}
		$("#tabs").tabs('add',{
				title:text,
				closable:true,
				content:'<iframe frameborder="0" scrolling="auto" style="height:100%;width:100%;" src='+url+'></iframe>'
		})
	}
});
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height:90px;background-image:url(images/top_bg.jpg);float:right;">
		<div align="left" style="width: 80%;float: left"><img src="images/top.jpg"></div>
		<div style="padding-top:50px;padding-right:10px;">
			当前用户：&nbsp;<font color="red">${currentUser.userName}</font>
			<a href="login">退出登录</a>
		</div>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页"><div align="center" style="padding-top: 200px;"><font color="red" size="20">${currentUser.userName},欢迎使用二手车管理系统</font></div></div>
		</div>
	</div>
	<div region="west" style="width:150px;" title="导航菜单" split="true">
		<ul  id="tree"></ul>
	</div>
	<div region="south" style="height:25px;" align="center"></div>
</body>
</html>