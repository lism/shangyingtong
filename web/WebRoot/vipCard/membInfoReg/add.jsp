<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ include file="/common/taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/common/meta.jsp" %>
		<%@ include file="/common/sys.jsp" %>
		<title>${ACT.name}</title>
		
		<f:css href="/css/page.css"/>
		<f:js src="/js/jquery.js"/>
		<f:js src="/js/plugin/jquery.metadata.js"/>
		<f:js src="/js/plugin/jquery.validate.js"/>
		<f:js src="/js/sys.js"/>
		<f:js src="/js/common.js"/>
		<f:js src="/js/paginater.js"/>
		<f:js src="/js/validate.js"/>
		<f:js src="/js/date/WdatePicker.js" defer="defer"/>

		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
		<script>
		$(function(){
			$('#mtClass').change(function(){loadMtClassName();});//会员级别
		});
		
		function loadMtClassName(){
			var mtClass =  $('#mtClass').val() ;
			$("#mtClassName").load(CONTEXT_PATH + "/vipCard/membInfoReg/loadMtClassName.do",{'membClass':mtClass, 'callId':callId()});
		}
		
		function check(){
			var credType_id = $('#credType_id').val();
			if (!isEmpty(credType_id)){
				var credNo_id = $('#credNo_id').val();
				if (isEmpty(credNo_id)){
					showMsg('证件类型不为空时,证件号不能为空。');
					return false;
				}
			}
		}
        </script>
	</head>
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<div class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<s:form action="add.do" id="inputForm" cssClass="validate">
					<div>
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<caption>${ACT.name}</caption>
						<tr>
<%--							<td width="80" height="30" align="right">会员录入批次ID</td>--%>
<%--			                <td><s:textfield name="membInfoReg.membInfoId"> </s:textfield></td>--%>
							<td width="80" height="30" align="right">会员名称</td>
			                <td><s:textfield name="membInfoReg.custName" cssClass="{required:true}"/><span class="field_tipinfo">请输入会员名称</span></td>
			                <td></td>
			                <td></td>
						</tr>
						<tr>
						    <td width="80" height="30" align="right">会员类型</td>
							<td>
								<s:select id ="mtClass" name="membInfoReg.membClass" list="membClassDefList" headerKey="" headerValue="--请选择--" listKey="membClass" listValue="className" cssClass="{required:true}" ></s:select>
								<span class="field_tipinfo">请选择会员类型</span>
							</td>
						    <td width="80" height="30" align="right">会员级别</td> 
							<td>
								<select id ="mtClassName" name="membInfoReg.membLevel"  class="{required:true}" ></select>
								<span class="field_tipinfo">请选择会员级别</span>
							</td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">证件类型</td>
							<td>
							<s:select id="credType_id" name="membInfoReg.credType" list="credTypeList" headerKey="" headerValue="--请选择--" listKey="value" listValue="name" ></s:select>
							<span class="field_tipinfo">请输入证件类型</span></td>
							<td width="80" height="30" align="right">证件号</td>
							<td><s:textfield  id="credNo_id"  name="membInfoReg.credNo"/><span class="field_tipinfo">请输入证件号</span></td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">地址</td>
							<td><s:textfield name="membInfoReg.address"/><span class="field_tipinfo">请输入地址</span></td>
							<td width="80" height="30" align="right">性别</td>
							<td>
							<s:select name="membInfoReg.sex" list="sexTypeList" headerKey="" headerValue="--请选择--" listKey="value" listValue="name" ></s:select>
							<span class="field_tipinfo">请输入性别</span>
							</td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">生日</td>
							<td><s:textfield name="membInfoReg.birthday" onclick="WdatePicker()"/><span class="field_tipinfo">请输入生日</span></td>
							<td width="80" height="30" align="right">年龄</td>
							<td><s:textfield name="membInfoReg.age" cssClass="{digit: true}"  maxlength="2"/><span class="field_tipinfo">请输入年龄</span></td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">手机号</td>
							<td><s:textfield name="membInfoReg.telNo" cssClass="{digit: true}" maxlength="11"/><span class="field_tipinfo">请输入手机号</span></td>
							<td width="80" height="30" align="right">座机号</td>
							<td><s:textfield name="membInfoReg.mobileNo"/><span class="field_tipinfo">请输入座机号</span></td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">电子邮件</td>
							<td><s:textfield name="membInfoReg.email"/><span class="field_tipinfo">请输入电子邮件</span></td>
							<td width="80" height="30" align="right">工作</td>
							<td><s:textfield name="membInfoReg.job"/><span class="field_tipinfo">请输入工作</span></td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">薪水</td>
							<td><s:textfield name="membInfoReg.salary"/><span class="field_tipinfo">请输入薪水</span></td>
							<td width="80" height="30" align="right">教育程度</td>
							<td>
							<s:select name="membInfoReg.education" list="educationTypeList" headerKey="" headerValue="--请选择--" listKey="value" listValue="name" ></s:select>
							<span class="field_tipinfo">请输入教育程度</span>
							</td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">备注</td>
							<td><s:textfield name="membInfoReg.remark"/><span class="field_tipinfo">请输入备注</span></td>
							<td width="80" height="30" align="right"></td>
							<td></td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">&nbsp;</td>
							<td height="30" colspan="3">
								<input type="submit" value="登记" id="input_btn2"  name="ok"  onclick="return check();"/>
								<input type="button" value="清除" name="escape" onclick="FormUtils.reset('inputForm')" class="ml30" />
								<input type="button" value="返回" name="escape" onclick="gotoUrl('/vipCard/membInfoReg/list.do?goBack=goBack')" class="ml30" />
							</td>
						</tr>
					</table>
					<s:token name="_TOKEN_MEMBREG_ADD"/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>

		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>