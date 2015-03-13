<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
		<f:js src="/js/datePicker/WdatePicker.js"/>

		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
	</head>
    
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<!-- 查询功能区 -->
		<div class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<s:form id="searchForm" action="list.do" cssClass="validate-tip">
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<caption>${ACT.name}</caption>
						<tr>
							<td align="right">签单规则ID</td>
							<td><s:textfield name="signRuleReg.signRuleId" cssClass="{digitOrLetter:true}"/></td>
							
							<td align="right">签单规则名称</td>
							<td><s:textfield name="signRuleReg.signRulName"/></td>
							
							<td align="right">购卡客户ID</td>
							<td><s:textfield name="signRuleReg.signCustId" cssClass="{digitOrLetter:true}"/></td>
						</tr>	
						<tr>
							<td align="right">购卡客户名称</td>
							<td><s:textfield name="signRuleReg.signCustName"/></td>
							
							<td height="30" colspan="4">
								<input type="submit" value="查询" id="input_btn2"  name="ok" />
								<input style="margin-left:30px;" type="button" value="清除" onclick="FormUtils.reset('searchForm')" name="escape" />
								<f:pspan pid="signRuleReg_add"><input style="margin-left:30px;" type="button" value="新增" onclick="javascript:gotoUrl('/signCardMgr/signRuleReg/showAdd.do');" id="input_btn3"  name="escape" /></f:pspan>
							</td>
						</tr>
					</table>
					<s:token name="_TOKEN_SIGN_RULE_REG_LIST"/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<!-- 数据列表区 -->
		<div class="tablebox">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">签单规则ID</td>
			   <td align="center" nowrap class="titlebg">签单规则名称</td>
			   <td align="center" nowrap class="titlebg">购卡客户ID</td>
			   <td align="center" nowrap class="titlebg">购卡客户名称</td>
			   <td align="center" nowrap class="titlebg">状态</td>
			   <td align="center" nowrap class="titlebg">操作</td>
			</tr>
			</thead>
			<s:iterator value="page.data"> 
			<tr>
			  <td align="center" nowrap>${signRuleId}</td>
			  <td align="center" nowrap>${signRuleName}</td>
			  <td align="center" nowrap>${signCustId}</td>
			  <td align="center" nowrap>${signCustName}</td>
			  <td align="center" nowrap>${statusName}</td>
			  <td align="center" nowrap>
			  	<span class="redlink">
			  		<f:link href="/signCardMgr/signRuleReg/detail.do?signRuleReg.signRuleId=${signRuleId}">明细</f:link>
			  		<s:if test="!usedLabel.equals(status)" >
				  		<f:pspan pid="signRuleReg_modify">
				  			<f:link href="/signCardMgr/signRuleReg/showModify.do?signRuleReg.signRuleId=${signRuleId}">编辑</f:link>
				  		</f:pspan>
				  		<f:pspan pid="signRuleReg_delete">
				  			<a href="javascript:submitUrl('searchForm', '/signCardMgr/signRuleReg/delete.do?signRuleReg.signRuleId=${signRuleId}', '确定要删除吗？');" />删除</a>
				  		</f:pspan>			  		
			  		</s:if>
			  	</span>
			  </td>
			</tr>
			</s:iterator>
			</table>
			<f:paginate name="page"/>
		</div>

		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>