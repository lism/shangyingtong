<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="gnete.etc.WorkflowConstants"%>
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
		
		<div class="userbox">
		<table class="detail_grid" width="98%" border="1" cellspacing="0" cellpadding="1">
			<caption><s:text name="cardTypeCode.cardTypeName"/>充值信息<span class="caption_title"> | <f:link href="/depositBatReg/list${actionSubName}.do?goBack=goBack">返回列表</f:link></span></caption>
			<tr>
				<td>充值批次ID</td>
				<td>${depositReg.depositBatchId}</td>
				<td>卡类型</td>
				<td>${cardTypeCode.cardTypeName}</td>
		  		<td>购卡客户</td>
				<td>${cardCustomer.cardCustomerName}</td>
			</tr>
		  	<tr>
				<td>充值返利规则</td>
				<td>${depositReg.rebateName}</td>
				<td>返利方式</td>
				<td>${depositReg.rebateTypeName}</td>
				<td>返利卡卡号</td>
				<td>${depositReg.rebateCard}</td>
			</tr>
		  	<tr>
				<td>计算方式</td>
				<td>${depositReg.calTypeName}</td>
				<s:if test="depositTypeIsTimes==true" >
					<td>充值次数</td>
					<td>${depositReg.amt}</td>
				</s:if>
				<s:else>
					<td>充值金额</td>
					<td>${fn:amount(depositReg.amt)}</td>
				</s:else>
		  		<td>返利金额</td>
				<td>${fn:amount(depositReg.rebateAmt)}</td>
			</tr>
		  	<tr>
				<td>实收金额</td>
				<td class="bigred">${fn:amount(depositReg.realAmt)}</td>
				<td>手续费比例</td>
				<td>${fn:percent(depositReg.feeRate)}</td>
				<td>手续费</td>
				<td>${fn:amount(depositReg.feeAmt)}</td>
			</tr>
		  	<tr>
				<td>状态</td>
				<td>${depositReg.statusName}</td> 
		  		<td>充值机构</td>
				<td>${fn:branch(depositReg.depositBranch)}</td>
				<td>激活机构 </td>
		  		<td>${fn:branch(depositReg.activateBranch)}</td>
		  	</tr>
		  	<tr>
		  		<td>更新人</td>
				<td>${depositReg.updateUser}</td>
		  		<td>更新时间</td>
				<td><s:date name="depositReg.updateTime" format="yyyy-MM-dd HH:mm:ss" /></td>
				<td>备注</td>
		  		<td>${depositReg.remark}</td>
		  	</tr>
		</table>
		</div>
		
		<div class="userbox" style="padding-top: 0px;">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<s:form action="activate.do" id="inputForm">
					<div>
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<caption>${ACT.name}激活</caption>
					</table>
					<table id="idCardInfoTbl" style="display:none;" class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
					</table>
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td><s:hidden name="depositReg.depositBatchId" /></td>
							<td><s:hidden name="depositReg.status" /></td>
							<td><s:hidden name="actionSubName" /></td>
						</tr>
						
						<tr>
							<td width="80" height="30" align="right">&nbsp;</td>
							<td height="30" colspan="3">
								<input type="submit" value="激活" id="input_btn2"  name="ok"  /> <!-- onclick="submitForm();" -->
								<input type="button" value="返回" name="escape" onclick="gotoUrl('/depositBatReg/list${actionSubName}.do')" class="ml30" />
							</td>
							<td></td><td></td>
						</tr>
					</table>
					<s:token/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<!-- 流程相关信息 -->
		<jsp:include flush="true" page="/workflow/flow.jsp">
			<jsp:param name="workflowId" value="<%=WorkflowConstants.WORKFLOW_DEPOSIT_BATCH%>"/>
			<jsp:param name="refId" value="${depositReg.depositBatchId}"/>
		</jsp:include>
		<br />
		
		<!-- 充值返利规则分段比例明细 -->
		<div class="tablebox">
			<b><s:label>充值返利规则分段比例明细 </s:label></b>
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">			
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">充值返利规则ID</td>
			   <td align="center" nowrap class="titlebg">充值返利分段号</td>
			   <td align="center" nowrap class="titlebg">充值分段金额上限</td>
			   <td align="center" nowrap class="titlebg">充值返利比（%）或返利金额</td>			   
			</tr>
			</thead>
			<s:iterator value="rebateRuleDetailList"> 
			<tr>
			  <td nowrap><s:text name="rebateId"></s:text></td>
			  <td align="center" nowrap><s:text name="rebateSect"></s:text></td>			  
			  <td align="center" nowrap><s:text name="rebateUlimit"></s:text></td>
			  <td align="center" nowrap><s:text name="rebateRate"></s:text></td>			  
			</tr>
			</s:iterator>
			</table>
		</div>
		
		<!-- 批量充值登记簿明细 -->
		<div class="tablebox">
			<b><s:label>批量充值登记簿明细 </s:label></b>
			<form id="id_activate_bat" method="post" action="showActivate.do?depositBatReg.depositBatchId=${depositBatReg.depositBatchId}">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">			
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">卡号</td>
			   <td align="center" nowrap class="titlebg"><s:if test="depositTypeIsTimes==true" >充值次数</s:if><s:else>充值金额</s:else></td>
			   <td align="center" nowrap class="titlebg">返利金额</td>			   
			   <td align="center" nowrap class="titlebg">实收金额</td>			   
			   <td align="center" nowrap class="titlebg">状态</td>			   
			</tr>
			</thead>
			<s:iterator value="depositBatPage.data"> 
			<tr>
			  <td nowrap><s:text name="cardId"></s:text></td>
			  <td align="right" nowrap><s:if test="depositTypeIsTimes==true" >${amt}</s:if><s:else>${fn:amount(amt)}</s:else></td>
			  <td align="right" nowrap>${fn:amount(rebateAmt)}</td>
			  <td align="right" nowrap>${fn:amount(realAmt)}</td>
			  <td align="center" nowrap>${statusName}</td>	  
			</tr>
			</s:iterator>
			</table>
			</form>
			<f:paginate name="depositBatPage" formIndex="1"/>
		</div>
		
		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>