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
		<f:js src="/js/sys.js"/>
		<f:js src="/js/common.js"/>
		<f:js src="/js/paginater.js"/>


		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
	</head>
    
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<jsp:include flush="true" page="/common/loadingBarDiv.jsp"></jsp:include>
		
		<div id="contentDiv" class="userbox">
		
		<!-- 数据列表区 -->
		<div class="tablebox">
			<form id="id_checkForm" method="post" action="checkList.do">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
				<td align="center" nowrap class="titlebg"><input type="checkbox" onclick="FormUtils.selectAll(this, 'ids')" />全选</td>
				<td align="center" nowrap class="titlebg">卡号</td>
				<td align="center" nowrap class="titlebg">账号</td>
				<td align="center" nowrap class="titlebg">积分类型</td>
				<td align="center" nowrap class="titlebg">原积分</td>
				<td align="center" nowrap class="titlebg">调整额</td>
				<td align="center" nowrap class="titlebg">状态</td>
				<td align="center" nowrap class="titlebg">操作</td>
			</tr>
			</thead>
			<s:iterator value="page.data"> 
			<tr>
				<td>
					<input type="checkbox" name="ids" value="${pointChgId}"/>
				</td>
				<td align="center" nowrap>${cardId}</td>
			  	<td align="center" nowrap>${acctId}</td>
			  	<td align="center" nowrap>${ptClassName}</td>
			  	<td align="right" nowrap>${fn:amount(ptAvlb)}</td>
			  	<td align="right" nowrap>${fn:amount(ptChg)}</td>
			  	<td align="center" nowrap>${statusName}</td>
				<td align="center" nowrap>
			  	<span class="redlink">
			  		<f:link href="/pointBus/pointChange/checkDetail.do?pointChgReg.pointChgId=${pointChgId}">查看</f:link>
			  	</span>
			  </td>
			</tr>
			</s:iterator>
			</table>
			</form>
			<f:paginate name="page" formIndex="0"/>
		</div>
		
		<f:workflow adapter="pointChgRegAdapter" returnUrl="/pointBus/pointChange/checkList.do"><s:token name="_TOKEN_POINTCHANGE_CHECKLIST"/></f:workflow>
		</div>
		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>