<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ include file="/common/taglibs.jsp" %>

<option value="">-请选择-</option>
<s:iterator value="subAcctTypeList">
	<option value="${value}">${name}</option>
</s:iterator>
