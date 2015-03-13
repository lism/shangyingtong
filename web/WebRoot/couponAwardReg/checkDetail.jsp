<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="gnete.etc.Constants"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ include file="/common/taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/common/meta.jsp" %>
		<%@ include file="/common/sys.jsp" %>
		<title>${ACT.name}</title>
		
		<f:css href="/css/page.css"/>
		<f:js src="/js/jquery.js"/>
		<f:js src="/js/sys.js"/>
		<f:js src="/js/common.js"/>

		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
	</head>
    
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<!-- 赠券赠送明细 -->
		<div class="userbox">
		<table class="detail_grid" width="98%" border="1" cellspacing="0" cellpadding="1">
			<caption>赠券赠送详细信息<span class="caption_title"> | <f:link href="/couponAwardReg/checkList.do?goBack=goBack">返回列表</f:link></span></caption>
			<tr>
				<td>编号</td>
				<td>${couponAwardReg.couponAwardRegId}</td>
				<td>机构类型</td>
				<td>${couponAwardReg.insTypeName}</td>
				<td>机构</td>
				<td>${couponAwardReg.insId}-${fn:branch(couponAwardReg.insId)}${fn:merch(couponAwardReg.insId)}</td>
			</tr>
			<tr>
				<td>赠券类型</td>
				<td>${couponAwardReg.couponClass}</td>
				<td>赠券名称</td>
				<td>${couponAwardReg.couponName}</td>
				<td>卡BIN</td>
				<td>${couponAwardReg.cardBin}</td>
			</tr>
			<tr>
				<td>状态</td>
				<td>${couponAwardReg.statusName}</td>
				<td>备注</td>
				<td>${couponAwardReg.remark}</td>
				<td>更新人</td>
				<td>${couponAwardReg.updateBy}</td>
			</tr>
			<tr>
				<td>更新时间</td>
				<td><s:date name="couponAwardReg.updateTime" format="yyyy-MM-dd HH:mm:ss" /></td>
				<td></td><td></td>
				<td></td><td></td>
			</tr>
		</table>
		</div>
		
		<!-- 流程相关信息 -->
		<jsp:include flush="true" page="/workflow/flow.jsp">
			<jsp:param name="workflowId" value="<%=Constants.WORKFLOW_COUPON_AWARD_REG%>"/>
			<jsp:param name="refId" value="${couponAwardReg.couponAwardRegId}"/>
		</jsp:include>
		
		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>