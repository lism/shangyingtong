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
							<td align="right">ID</td>
							<td><s:textfield name="publishNotice.id" /></td>
							
							<td align="right">标题</td>
							<td><s:textfield name="publishNotice.title" /></td>
							
							<td align="right">显示标志</td>
							<td>
								<s:select name="publishNotice.showFlag" list="showFlagList" headerKey="" headerValue="--请选择--" listKey="value" listValue="name"></s:select>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td height="30" colspan="5">
								<input type="submit" value="查询" id="input_btn2"  name="ok" />
								<input style="margin-left:30px;" type="button" value="清除" onclick="FormUtils.reset('searchForm')" name="escape" />
								<f:pspan pid="notice_add"><input style="margin-left:30px;" type="button" value="新增" onclick="javascript:gotoUrl('/publishNotice/showAdd.do');" id="input_btn3"  name="escape" /></f:pspan>
							</td>
						</tr>
					</table>
					<s:token name="_TOKEN_PUBLISH_NOTICE_LIST"/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<!-- 数据列表区 -->
		<div class="tablebox">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">ID</td>
			   <td align="center" nowrap class="titlebg">标题</td>
			   <td align="center" nowrap class="titlebg">显示标志</td>
			   <td align="center" nowrap class="titlebg">发布人</td>
			   <td align="center" nowrap class="titlebg">发布时间</td>
			   <td align="center" nowrap class="titlebg">操作</td>
			</tr>
			</thead>
			<s:iterator value="page.data"> 
			<tr>
			  <td nowrap>${id}</td>
			  <td align="center" nowrap>${title}</td>
			  <td align="center" nowrap>${showFlagName}</td>
			  <td align="center" nowrap>${pubUser}</td>
			  <td align="center" nowrap><s:date name="pubTime" format="yyyy-MM-dd HH:mm:ss"/></td>
			  <td align="center" nowrap>
			  	<span class="redlink">
			  		<f:link href="/publishNotice/detail.do?publishNotice.id=${id}">明细</f:link>
			  		<f:pspan pid="notice_delete">
			  			<a href="javascript:submitUrl('searchForm', '/publishNotice/delete.do?id=${id}', '确定要删除吗？');" />删除</a>
			  		</f:pspan>
			  		<s:if test="showFlag == 0">
			  			<f:pspan pid="notice_show">
			  				<a href="javascript:submitUrl('searchForm', '/publishNotice/show.do?id=${id}', '确定要显示通知吗？');" />显示通知</a>
			  			</f:pspan>
			  		</s:if>
			  		<s:else>
			  			<f:pspan pid="notice_hide">
			  				<a href="javascript:submitUrl('searchForm', '/publishNotice/hide.do?id=${id}', '确定要隐藏通知吗？');" />隐藏通知</a>
			  			</f:pspan>
			  		</s:else>
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