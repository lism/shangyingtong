<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ include file="/common/taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<base target="_self"/>
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
		
		<!-- 发卡机构与商户 交易日结算明细 -->
		<div class="userbox">
		<table class="detail_grid" width="98%" border="1" cellspacing="0" cellpadding="1">
			<caption>发卡机构与商户日结算详细信息<span class="caption_title"/ > </caption>
			<tr>
				<td>清算日期</td>
				<td>${merchTransDSet.setDate}</td>
				<td>付款方</td>
				<td>${merchTransDSet.payName}</td>
			</tr>
			<tr>
				<td>发卡机构</td>
				<td>${fn:branch(merchTransDSet.recvCode)}</td>
				<td>交易类型</td>
				<td>${merchTransDSet.transTypeName}</td>
			</tr>
			<tr>
				<td>交易笔数</td>
				<td>${merchTransDSet.transNum}</td>
				<td>上期结转金额</td>
				<td>${fn:amount(merchTransDSet.lastFee)}</td>
			</tr>
			<tr>
				<td>交易金额</td>
				<td>${fn:amount(merchTransDSet.feeAmt)}</td>
				<td>实收金额</td>
				<td>${fn:amount(merchTransDSet.recvAmt)}</td>
			</tr>
			<tr>
				<td>结转下期金额</td>
				<td>${fn:amount(merchTransDSet.nextFee)}</td>
				<td>核销编号</td>
				<td>${merchTransDSet.chkId}</td>
			</tr>
			<tr>
				<td>核销状态</td>
				<td>${merchTransDSet.chkStatusName}</td>
				<td>核销用户名</td>
				<td>${merchTransDSet.updateBy}</td>
			</tr>
			<tr>
			    <td>手续费金额</td>
			    <td>${fn:amount(merchTransDSet.feeAmount)}</td>
				<td>更新时间</td>
				<td><s:date name="merchTransDSet.updateTime" format="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			
		</table>
		</div>
		
		<!-- 数据列表区 -->
		<div class="tablebox">
		<form id="detailForm" method="post" action="detail.do?merchTransDSet.payCode=${merchTransDSet.payCode}&merchTransDSet.recvCode=${merchTransDSet.recvCode}&merchTransDSet.setDate=${merchTransDSet.setDate}&merchTransDSet.transType=${merchTransDSet.transType}&merchTransDSet.curCode=${merchTransDSet.curCode}">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">系统跟踪号</td>
			   <td align="center" nowrap class="titlebg">清算日期</td>
			   <td align="center" nowrap class="titlebg">卡号</td>
			   <td align="center" nowrap class="titlebg">发卡机构</td>
			   <td align="center" nowrap class="titlebg">售卡充值机构</td>
			   <td align="center" nowrap class="titlebg">终端号</td>
			   <td align="center" nowrap class="titlebg">交易金额</td>
			   <td align="center" nowrap class="titlebg">处理状态</td>
			</tr>
			</thead>
			<s:iterator value="page.data"> 
			<tr>
			  <td style="display: none">${transSn}</td>
			  <td align="center" nowrap>${sysTraceNum}</td>
			  <td align="center" nowrap>${settDate}</td>
			  <td align="center" nowrap>${cardId}</td>
			  <td nowrap>${fn:branch(cardIssuer)}(${cardIssuer})</td>
			  <td align="center" nowrap>${fn:branch(merNo)}(${merNo})</td>
			  <td align="center" nowrap>${termlId}</td>	
			  <td align="right" nowrap>${fn:amount(settAmt)}</td>	
			  <td align="center" nowrap>${procStatusName}</td>		  
			</tr>
			</s:iterator>
			</table>
			<f:paginate name="page"/>
			</form>
		</div>

		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>