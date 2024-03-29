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
							<td align="right">编号</td>
							<td><s:textfield name="cancelCardReg.cancelCardId"/></td>
							<td align="right">卡号</td>
							<td><s:textfield name="cancelCardReg.cardId"/></td>
							<td align="right">持卡人姓名</td>
							<td><s:textfield name="cancelCardReg.custName"/></td>
						</tr>
						<tr>
							<td></td>
							<td height="30" colspan="4">
								<input type="submit" value="查询" id="input_btn2"  name="ok" />
								<input style="margin-left:30px;" type="button" value="清除" onclick="FormUtils.reset('searchForm')" name="escape" />
								<s:if test="showCardCell">
								<f:pspan pid = "cancelCardReg_add" style="display: null">
									<input style="margin-left:30px;" type="button" value="退卡"  name="escape" id="input_btn3" onclick="javascript:gotoUrl('/intgratedService/cancelCard/showAdd.do');"/>
								</f:pspan> 
								</s:if>
								<s:else>
								<f:pspan pid = "cancelCardReg_add" style="display: null">
									<input style="margin-left:30px;" type="button" value="退卡销户"  name="escape" id="input_btn3" onclick="javascript:gotoUrl('/intgratedService/cancelCard/showAdd.do');"/>
								</f:pspan>
								<f:pspan pid = "cancelCardReg_add" >
									<input style="margin-left:30px;" type="button" value="上传文件"  name="escape" id="input_btn3" onclick="javascript:gotoUrl('/intgratedService/cancelCard/showFileCancelCard.do');"/>
								</f:pspan>
								</s:else>
							</td>
						</tr>
					</table>
					<s:token name="_TOKEN_CANCELCARD_LIST"/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<!-- 数据列表区 -->
		<div class="tablebox">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">编号</td>
			   <td align="center" nowrap class="titlebg">卡号</td>
			   <%--<td align="center" nowrap class="titlebg">账号</td>
			   --%>
			   <td align="center" nowrap class="titlebg">持卡人姓名</td>
			   <td align="center" nowrap class="titlebg">证件类型</td>
			   <td align="center" nowrap class="titlebg">证件号码</td>
			   <%--<td align="center" nowrap class="titlebg">类型</td>
			   --%>
			   <td align="center" nowrap class="titlebg">状态</td>
			   <td align="center" nowrap class="titlebg">操作</td>
			</tr>
			</thead>
			<s:iterator value="page.data"> 
			<tr>
			  <td nowrap>${cancelCardId}</td>
			  <td align="center" nowrap>${cardId}</td>
			  <%--<td align="center" nowrap>${acctId}</td>
			  --%>
			  <td align="center" nowrap>${custName}</td>
			  <td align="center" nowrap>${certTypeName}</td>
			  <td align="center" nowrap>${certNo}</td>
			  <%--<td align="center" nowrap>${flagName}</td>
			  --%>
			  <td align="center" nowrap>${statusName}</td>
			  <td align="center" nowrap>
			  	<span class="redlink">
			  		<f:link href="/intgratedService/cancelCard/detail.do?cancelCardReg.cancelCardId=${cancelCardId}">查看</f:link>
			  		<!--<f:pspan pid="cancelCardReg_delete">
			  			<a href="javascript:submitUrl('searchForm', '/intgratedService/cancelCard/delete.do?cancelCardId=${cancelCardId}', '确定要删除吗？');" />删除</a>
			  		</f:pspan>
			  	--></span>
			  </td>
			</tr>
			</s:iterator>
			</table>
			<f:paginate name="page"/>
		</div>

		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>