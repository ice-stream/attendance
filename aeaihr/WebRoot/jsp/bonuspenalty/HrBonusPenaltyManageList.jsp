<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.ecside.org" prefix="ec"%>
<%@ taglib uri="http://www.agileai.com" prefix="aeai"%>
<jsp:useBean id="pageBean" scope="request" class="com.agileai.hotweb.domain.PageBean"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>奖惩管理</title>
<%@include file="/jsp/inc/resource.inc.jsp"%>
</head>
<body>
<form action="<%=pageBean.getHandlerURL()%>" name="form1" id="form1" method="post">
<%@include file="/jsp/inc/message.inc.jsp"%>
<div id="__ToolBar__">
<table class="toolTable" border="0" cellpadding="0" cellspacing="1">
<tr>
   <aeai:previlege code="create"><td onmouseover="onMover(this);" onmouseout="onMout(this);" class="bartdx" hotKey="A" align="center" onclick="doRequest('insertRequest')"><input value="&nbsp;" title="新增" type="button" class="createImgBtn" />新增</td></aeai:previlege>
   <aeai:previlege code="edit"><td onmouseover="onMover(this);" onmouseout="onMout(this);" class="bartdx" hotKey="E" align="center" onclick="doRequest('updateRequest')"><input value="&nbsp;" title="编辑" type="button" class="editImgBtn" />编辑</td></aeai:previlege>
   <aeai:previlege code="detail"><td onmouseover="onMover(this);" onmouseout="onMout(this);" class="bartdx" hotKey="V" align="center" onclick="doRequest('viewDetail')"><input value="&nbsp;" title="查看" type="button" class="detailImgBtn" />查看</td></aeai:previlege>
   <aeai:previlege code="delete"><td onmouseover="onMover(this);" onmouseout="onMout(this);" class="bartdx" hotKey="D" align="center" onclick="doDelete($('#'+rsIdTagId).val());"><input value="&nbsp;" title="删除" type="button" class="delImgBtn" />删除</td></aeai:previlege>
</tr>
</table>
</div>
<div id="__ParamBar__">
<table class="queryTable"><tr><td>
&nbsp;类型<select id="bpType" label="类型" name="bpType" class="select" onchange="doQuery()"><%=pageBean.selectValue("bpType")%></select>

&nbsp;起止日期<input id="sdate" label="开始时间" name="sdate" type="text" value="<%=pageBean.inputDate("sdate")%>" size="10" class="text" readonly="readonly"/><img id="sdatePicker" src="images/calendar.gif" width="16" height="16" alt="日期/时间选择框" />
-<input id="edate" label="截止时间" name="edate" type="text" value="<%=pageBean.inputDate("edate")%>" size="10" class="text"  readonly="readonly"/><img id="edatePicker" src="images/calendar.gif" width="16" height="16" alt="日期/时间选择框" />

&nbsp;姓名 <input id="userName" label="姓名 " name="userName" type="text" value="<%=pageBean.inputDate("userName")%>" size="24" class="text" ondblclick="emptyText('userName')" />
<input type="hidden" label="人员选择" id="USER_CODE" name="USER_CODE" value="<%=pageBean.inputValue("USER_CODE")%>" />
<img id="userIdSelectImage" src="images/sta.gif" width="16" height="16" onclick="openUserIdBox()" />

&nbsp;<input type="button" name="button" id="button" value="查询" class="formbutton" onclick="doQuery()" />
</td></tr></table>
</div>
<ec:table 
form="form1"
var="row"
items="pageBean.rsList" csvFileName="奖惩管理.csv"
retrieveRowsCallback="process" xlsFileName="奖惩管理.xls"
useAjax="true" sortable="true"
doPreload="false" toolbarContent="navigation|pagejump |pagesize |export|extend|status"
width="100%" rowsDisplayed="15"
listWidth="100%" 
height="390px"
>
<ec:row styleClass="odd" ondblclick="doRequest('viewDetail')" oncontextmenu="selectRow(this,{BP_ID:'${row.BP_ID}'});refreshConextmenu()" onclick="selectRow(this,{BP_ID:'${row.BP_ID}'})">
	<ec:column width="50" style="text-align:center" property="_0" title="序号" value="${GLOBALROWCOUNT}" />
	<ec:column width="100" property="USER_NAME" title="姓名"   />
	<ec:column width="100" property="BP_DATE" title="日期" cell="date" format="yyyy-MM-dd" />
	<ec:column width="100" property="BP_TYPE" title="类型"   mappingItem="BP_TYPE"/>
	<ec:column width="100" property="BP_MONEY" title="金额"   />
</ec:row>
</ec:table>
<input type="hidden" name="BP_ID" id="BP_ID" value="" />
<input type="hidden" name="actionType" id="actionType" />
<script language="JavaScript">
setRsIdTag('BP_ID');
var ectableMenu = new EctableMenu('contextMenu','ec_table');
initCalendar('sdate','%Y-%m-%d','sdatePicker');
datetimeValidators[0].set("yyyy-MM-dd").add("sdate");
initCalendar('edate','%Y-%m-%d','edatePicker');
datetimeValidators[0].set("yyyy-MM-dd").add("edate");
var userIdBox;
function openUserIdBox(){
	var handlerId = "UserListSelectList"; 
	if (!userIdBox){
		userIdBox = new PopupBox('userIdBox','请选择人员      ',{size:'normal',width:'300',top:'2px'});
	}
	var url = 'index?'+handlerId+'&targetId=USER_CODE&targetName=userName';
	userIdBox.sendRequest(url);
}
</script>
</form>
</body>
</html>
<%@include file="/jsp/inc/scripts.inc.jsp"%>
