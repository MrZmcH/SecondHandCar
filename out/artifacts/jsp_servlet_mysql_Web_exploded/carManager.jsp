<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>汽车管理</title>
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
	$("#car-table").datagrid('load',{
		carName:$("#s_carName").val(),
		brandId:$("#s_brandId").combobox("getValue"),
		carAge:$("#s_carAge").combobox("getValue"),
		carGearBox:$("#s_carGearBox").combobox("getValue"),
		carType:$("#s_carType").combobox("getValue"),
		carMileage:$("#s_carMileage").combobox("getValue"),
	});
}
function deleteCar(){
	var selectedRows = $("#car-table").datagrid('getSelections');
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
			$.post("carDelete",{ids:ids},function(re){
				if(re.success == 'true'){
					$("#car-table").datagrid('reload');
					$.messager.alert("系统提示","成功删除"+re.delNum+"条数据!");
				}else{
					$.messager.alert("系统提示",re.error_msg);
				}
			},"json");
		}
	});
}
function openCarAddDialog(){
	$("#add-car-dialog").dialog("open").dialog("setTitle","添加汽车信息");
	url="carAdd";
}
function closeCarDialog(){
	$("#add-car-dialog").dialog("close");
	$("input.add").val('');
}
function saveCar(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			
			return true;
		},
		success:function(result){
			if(result.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				//$("input").val('');
				document.getElementById("fm").reset()
				$("textarea").val('');
				$("#add-car-dialog").dialog("close");
				$("#car-table").datagrid("reload");
			}
		}
	});
}
function openCarModifyDialog(){
	var selectedRows=$("#car-table").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#add-car-dialog").dialog("open").dialog("setTitle","编辑汽车信息");
	$("#fm").form("load",row);
	url="carAdd?id="+row.id;
}
function carAgeF(value,rowData,rowIndex){
	if(value == '10+'){
		return value + '年以上';
	}
	return value + '年以内';
}
function carMileageF(value,rowData,rowIndex){
	if(value == '10+'){
		return value + '万公里以上';
	}
	return value + '万公里以内';
}
function carOutputStandF(value,rowData,rowIndex){
	return '国' + value + '及以上';
}
function carSeatCountF(value,rowData,rowIndex){
	return value + '座';
}
</script>
</head>
<body style="margin:5px;">
	<table id="car-table" class="easyui-datagrid" title="汽车信息" fitColumns="true" rownumbers="true" fit="true" pagination="true" url="carList" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50px">ID</th>
				<th field="brandName">品牌名称</th>
				<th field="carName">名称</th>
				<th field="carOldPrice">原价</th>
				<th field="carPrice">现价</th>
				<th field="carAge" formatter="carAgeF">车龄</th>
				<th field="carGearBox">变速箱</th>
				<th field="carType">车型</th>
				<th field="carMileage" formatter="carMileageF">里程</th>
				<th field="carOutputVolume">汽车排量</th>
				<th field="carOutputStand" formatter="carOutputStandF">排放标准</th>
				<th field="carSeatCount" formatter="carSeatCountF">座位数</th>
				<th field="carOilType">燃油类型</th>
				<th field="carColor">颜色</th>
				<th field="carNumberPlace">车牌所在地</th>
				<th field="carInfo" width="250px" nowarp="false">汽车详情</th>
			</tr>
		</thead> 
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openCarAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openCarModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteCar()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;名称：<input type="text" name="s_carName" id="s_carName" class="easyui-textbox" />
			&nbsp;品牌：<input name="s_brandId" id="s_brandId" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'brandName',url:'carBrandComboList'" style="width: 102px" />
			&nbsp;车龄：
			<select name="s_carAge" id="s_carAge" class="easyui-combobox" editable="false" panelHeight="auto" style="width: 102px">
							<option value=""></option>
							<option value="1">1年以内</option>
							<option value="3">3年以内</option>
							<option value="5">5年以内</option>
							<option value="8">8年以内</option>
							<option value="10">10年以内</option>
							<option value="10+">10年以上</option>
			</select>
			&nbsp;变速箱：
			<select name="s_carGearBox" id="s_carGearBox" class="easyui-combobox" editable="false" panelHeight="auto" style="width: 102px">
							<option value=""></option>
							<option value="自动">自动</option>
							<option value="手动">手动</option>
			</select>
			&nbsp;车型：
			<select name="s_carType" id="s_carType" class="easyui-combobox" editable="false" panelHeight="auto" style="width: 102px">
							<option value=""></option>
							<option value="两厢轿车">两厢轿车</option>
							<option value="三厢轿车">三厢轿车</option>
							<option value="跑车">跑车</option>
							<option value="SUV">SUV</option>
							<option value="MPV">MPV</option>
							<option value="卡车">卡车</option>
							<option value="皮卡">皮卡</option>
			</select>
			&nbsp;里程：
			<select name="s_carMileage" id="s_carMileage" class="easyui-combobox" editable="false" panelHeight="auto" style="width: 102px">
							<option value=""></option>
							<option value="1">1万公里内</option>
							<option value="3">3万公里内</option>
							<option value="5">5万公里内</option>
							<option value="8">8万公里内</option>
							<option value="10">10万公里内</option>
							<option value="10+">10万公里以上</option>
			</select>
			<a href="javascript:searchBrand()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	<div id="add-car-dialog" class="easyui-dialog" style="width:570px;height:480px;padding:10px 20px" closed="true" buttons="#add-brand-dialog-buttons">
		<form method="post" action="carAdd" id="fm">
			<table cellspacing="5px;">
				<tr>
					<td>名称：</td>
					<td><input type="text" name="carName" id="brandName" class="easyui-textbox easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>品牌：</td>
					<td>
						<input name="brandId" id="brandId" class="easyui-combobox easyui-validatebox" required="true" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'brandName',url:'carBrandComboList'" />
					</td>
				</tr>
				<tr>
					<td>原价：</td>
					<td><input type="number" name="carOldPrice" id="carOldPrice" class="easyui-textbox easyui-validatebox" required="true" /></td>
					<td></td>
					<td>现价：</td>
					<td><input type="number" name="carPrice" id="carPrice" class="easyui-textbox easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>变速箱：</td>
					<td>
						<select name="carGearBox" id="carGearBox" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="自动">自动</option>
							<option value="手动">手动</option>
						</select>
					</td>
					<td></td>
					<td>车型：</td>
					<td>
						<select name="carType" id="carType" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="两厢轿车">两厢轿车</option>
							<option value="三厢轿车">三厢轿车</option>
							<option value="跑车">跑车</option>
							<option value="SUV">SUV</option>
							<option value="MPV">MPV</option>
							<option value="卡车">卡车</option>
							<option value="皮卡">皮卡</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>里程：</td>
					<td>
						<select name="carMileage" id="carMileage" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="1">1万公里内</option>
							<option value="3">3万公里内</option>
							<option value="5">5万公里内</option>
							<option value="8">8万公里内</option>
							<option value="10">10万公里内</option>
							<option value="10+">10万公里以上</option>
						</select>
					</td>
					<td></td>
					<td>排量：</td>
					<td>
						<select name="carOutputVolume" id="carOutputVolume" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="1.0L以下">1.0L以下</option>
							<option value="1.0L-1.6L">1.0L-1.6L</option>
							<option value="1.6L-2.0L">1.6L-2.0L</option>
							<option value="2.0L-2.5L">2.0L-2.5L</option>
							<option value="2.5L-3.0">2.5L-3.0L</option>
							<option value="3.0L-4.0L">3.0L-4.0L</option>
							<option value="4.0L+">4.0L以上</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>排放标准：</td>
					<td>
						<select name="carOutputStand" id="carOutputStand" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="2">国二及以上</option>
							<option value="3">国三及以上</option>
							<option value="4">国四及以上</option>
							<option value="5">国五</option>
						</select>
					</td>
					<td></td>
					<td>座位数：</td>
					<td>
						<select name="carSeatCount" id="carSeatCount" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="2">2座</option>
							<option value="4">4座</option>
							<option value="5">5座</option>
							<option value="6">6座</option>
							<option value="7+">7座及以上</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>燃油类型：</td>
					<td>
						<select name="carOilType" id="carOilType" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="汽油">汽油</option>
							<option value="柴油">柴油</option>
							<option value="电动">电动</option>
							<option value="油电混合">油电混合</option>
							<option value="其他">其他</option>
						</select>
					</td>
					<td></td>
					<td>颜色：</td>
					<td>
						<select name="carColor" id="carColor" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="白色">白色</option>
							<option value="黑色">黑色</option>
							<option value="灰色">灰色</option>
							<option value="银色">银色</option>
							<option value="紫色">紫色</option>
							<option value="其他">其他</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>车龄：</td>
					<td>
						<select name="carAge" id="carAge" class="easyui-combobox easyui-validatebox" required="true" editable="false" panelHeight="auto" style="width: 172px">
							<option value="1">1年以内</option>
							<option value="3">3年以内</option>
							<option value="5">5年以内</option>
							<option value="8">8年以内</option>
							<option value="10">10年以内</option>
							<option value="10+">10年以上</option>
						</select>
					</td>
					<td></td>
					<td>车牌所在地：</td>
					<td>
						<input type="text" name="carNumberPlace" id="carNumberPlace" class="easyui-textbox easyui-validatebox" required="true" />
					</td>
				</tr>
				<tr>
					<td>汽车介绍：</td>
					<td colspan="4"><textarea name="carInfo" id="carInfo" rows="7" cols="30" style="width: 430px;"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="add-brand-dialog-buttons">
		<a href="javascript:saveCar()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeCarDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>