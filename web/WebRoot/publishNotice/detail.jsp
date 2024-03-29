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

		<style type="text/css">
			html { overflow-y: scroll; }
			
			.notice_content{
				text-indent:2em; 
				line-height:20px; 
				text-align: left;
				font-size: 14px; 
				margin-top:15px;
				padding: 0px 20px 0px 20px;
			}
		</style>
	</head>
    
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<div class="userbox">
		<table class="detail_grid" width="98%" border="1" cellspacing="0" cellpadding="1">
			<caption>通知信息明细<span class="caption_title"> | <f:link href="/publishNotice/list.do?goBack=goBack">返回列表</f:link></span></caption>
			<tr>
				<td>ID</td>
				<td>${publishNotice.id}</td>
				<td>标题</td>
				<td colspan="3">${publishNotice.title}</td>
		  	</tr>
			<tr>
				<td>显示标志</td>
				<td>${publishNotice.showFlagName}</td>
				<td>更新人</td>
				<td>${publishNotice.pubUser}</td>
				<td>更新时间</td>
				<td><s:date name="publishNotice.pubTime" format="yyyy-MM-dd HH:mm:ss" /></td>
		  	</tr>
		  	<tr>
				<td>内容</td>
				<td colspan="5" class="notice_content"><s:property value="publishNotice.content" escape="false"/></td>
			</tr>
		</table>
		</div>

		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>