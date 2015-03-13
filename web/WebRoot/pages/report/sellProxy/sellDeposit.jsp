<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="flink.util.SpringContext"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="gnete.card.web.report.ICardReportLoad"%>
<%@page import="gnete.card.entity.BranchInfo"%>
<%@page import="gnete.card.dao.BranchInfoDAO"%>
<%@page import="flink.util.DateUtil"%>

<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report"%>

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
		<f:js src="/js/date/WdatePicker.js" defer="defer"/>

		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
	</head>
	
	<%
	 	ICardReportLoad operateFee = (ICardReportLoad)SpringContext.getService("sellProxySellDepositDSetImpl");
	    operateFee.loadReportParams(request);
	    BranchInfoDAO branchInfoDAO = (BranchInfoDAO) SpringContext.getService("branchInfoDAOImpl"); 
	 %>
    
	<body>
		<div class="location">您当前所在位置： <span class="redlink"><f:link href="/home.jsp">首页</f:link></span>
			<c:choose>
				<c:when test="${PRIVILEGE_PATH !=null}">
					<c:forEach items="${PRIVILEGE_PATH}" var="menu">
					&gt; ${menu.name}
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<c:choose>
		<c:when test="${not empty errMsg}">
		<div class="msg">
			<span id="_msg_content" style="float: left">${errMsg }</span>
			<a id="_msg_close" href="javascript:hideMsg();" style="float: right;color: red">关闭 X</a>
		</div>
		</c:when>
		<c:otherwise>
		
		<!-- 查询功能区 -->
		<div class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<form id="searchForm" method="post" action="sellDeposit.jsp" class="validate-tip">
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<caption>${ACT.name}</caption>
						<tr>
							<td align="right">清算日期</td>
							<td>
								<input type="text" id="id_setDate" name="setDate" onclick="WdatePicker()" class="{required:true}" value="${param.setDate}" />
							</td>
							<c:if test="${showCardList}">
							<td align="right" id="id_CardList_td1">售卡代理</td>
							<td id="id_CardList_td2">
								<select id="id_payCode" name="payCode" class="{required:true}" style="width: auto;" onmouseover="FixWidth(this)">
									<option value="">--请选择--</option>
								<c:forEach items="${cardBranchList}" var="u">
									<option value="${u.branchCode}" <c:if test="${param.payCode eq u.branchCode}">selected</c:if>><c:out value="${u.branchName }"/></option>	
								</c:forEach>
								</select>
							</td>
							</c:if>
						</tr>
						<tr>
							<td></td>
							<td height="30" colspan="3">
							<input type="submit" value="生成报表" id="input_btn2"  name="ok" />
							<input style="margin-left:30px;" type="button" value="清除" onclick="FormUtils.reset('searchForm')" name="escape" />
							</td>
						</tr>
					</table>
				</form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<!-- 数据列表区 -->
		<div class="clear">
		<%
			StringBuffer params = new StringBuffer(128);
			
			// 清算日期
			String setDate = request.getParameter("setDate");
			if(StringUtils.isNotBlank(setDate)){
				params.append("setDate=" + setDate + ";");
				params.append("currDate=" + DateUtil.formatDate("yyyyMMdd") + ";");
			}
			
			boolean showCardList = (Boolean) request.getAttribute("showCardList");
			
			if(showCardList) {
				String cardBranchCode = request.getParameter("payCode");
				if(StringUtils.isNotBlank(cardBranchCode)){
					params.append("cardBranchCode=" + cardBranchCode + ";");
					BranchInfo fenzhi = (BranchInfo) branchInfoDAO.findByPk(cardBranchCode);
					params.append("cardBranchName=" + fenzhi.getBranchName() + ";");
				}
			} else {
				String cardBranch = (String) request.getAttribute("cardBranch");
				if(StringUtils.isNotBlank(cardBranch)){
					params.append("cardBranchCode=" + cardBranch + ";");
					BranchInfo fenzhi = (BranchInfo) branchInfoDAO.findByPk(cardBranch);
					params.append("cardBranchName=" + fenzhi.getBranchName() + ";");
				}
			}
			
			System.out.println("params:" + params);
		%>
		<% if(StringUtils.isNotBlank(setDate)){ %>
			<report:html name="report1" reportFileName="/sellProxy/sellDepositDSet.raq"	
			    params="<%=params.toString() %>"
			    funcBarFontFace="宋体"               
				funcBarFontSize="14px"   	
				needSaveAsExcel="yes"
				needSaveAsPdf="yes"
				needSaveAsWord="yes"
				needPrint="yes"
				funcBarLocation="bottom"
				width="-1"
				useCache="false"
			/>
		<%} %>
		</div>
	  </c:otherwise>
	  </c:choose>
		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>