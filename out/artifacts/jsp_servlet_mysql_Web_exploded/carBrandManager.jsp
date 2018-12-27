<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>汽车品牌管理</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
$(document).ready(function(){
	
});
function searchBrand(){
	$("#car-brand-table").datagrid('load',{
		brandName:$("#s_brandName").val()
	});
}
function deleteBrand(){
	var selectedRows = $("#car-brand-table").datagrid('getSelections');
	if(selectedRows.length ==0){
		$.messager.alert("系统提示","请选择要删除的数据!");
		return;
	}
	var idsArr = [];
	for(var i = 0; i < selectedRows.length;i++){
		idsArr.push(selectedRows[i].id);
	}
	var ids = idsArr.join(",");
	$.messager.confirm("系统提示","确定删掉这"+selectedRows.length+"条数据么？",function(e){
		if(e){
			$.post("carBrandDelete",{ids:ids},function(re){
				if(re.success == 'true'){
					$("#car-brand-table").datagrid('reload');
					$.messager.alert("系统提示","成功删除"+re.delNum+"条数据!");
				}else{
					$.messager.alert("系统提示",re.error_msg);
				}
			},"json");
		}
	});
}
function openBrandAddDialog(){
	$("#add-brand-dialog").dialog("open").dialog("setTitle","添加品牌信息");
	url="carBrandAdd";
}
function closeBrandDialog(){
	$("#add-brand-dialog").dialog("close");
	$("#brandName").val('');
	$("#brandInfo").val('');
}
function saveBrand(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			if(result.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				$("#brandName").val('');
				$("#brandInfo").val('');
				$("#add-brand-dialog").dialog("close");
				$("#car-brand-table").datagrid("reload");
			}
		}
	});
}
function openBrandModifyDialog(){
	var selectedRows=$("#car-brand-table").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#add-brand-dialog").dialog("open").dialog("setTitle","编辑品牌信息");
	$("#fm").form("load",row);
	url="carBrandAdd?id="+row.id;
}
</script>
</head>
<body style="margin:5px;">
	<table id="car-brand-table" class="easyui-datagrid" title="汽车品牌信息" fitColumns="true" rownumbers="true" fit="true" pagination="true" url="carBrandList" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50px">品牌ID</th>
				<th field="brandName" width="100px">品牌名称</th>
				<th field="brandInfo" width="250px">品牌详情</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openBrandAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openBrandModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteBrand()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>&nbsp;品牌名称：<input type="text" name="s_brandName" id="s_brandName" class="easyui-textbox" /><a href="javascript:searchBrand()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	<div id="add-brand-dialog" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px" closed="true" buttons="#add-brand-dialog-buttons">
		<form method="post" action="carBrandAdd" id="fm">
			<table>
				<tr>
					<td>品牌名称：</td>
					<td><input type="text" name="brandName" id="brandName" class="easyui-textbox easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>品牌介绍：</td>
					<td><textarea name="brandInfo" id="brandInfo" rows="7" cols="30"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="add-brand-dialog-buttons">
		<a href="javascript:saveBrand()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeBrandDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>