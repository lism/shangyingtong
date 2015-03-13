<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ page import="flink.util.Paginater"%>
<%@ include file="/common/taglibs.jsp" %>

<!-- 查询功能区 -->
<div class="userbox" style="margin: 0px; padding:0px;">
	<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	<div class="contentb">
		<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
			<caption>机构查询</caption>
			<tr>
				<td align="right">机构编号</td>
				<td><s:textfield id="idSelectBranchCode"/></td>
				
				<td align="right">机构名称</td>
				<td><s:textfield id="idSelectBranchName"/></td>
				
				<td height="30">
					<input type="button" value="查询" id="input_btn2" onclick="searchProxy(1)"  name="ok" />
					<s:hidden id="idRadio" name="radio" />
					<s:hidden id="cardBranch" name="cardBranch" />
					<s:hidden id="proxyType" name="proxyType" />
				</td>
			</tr>
		</table>
	</div>
	<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>

<!-- 数据列表区 -->
<div class="tablebox" id="idSelectData">
</div>
