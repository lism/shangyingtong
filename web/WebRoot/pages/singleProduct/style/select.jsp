<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ include file="/common/taglibs.jsp" %>

<!-- 查询功能区 -->
<div class="userbox" style="margin: 0px; padding:0px;">
	<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	<div class="contentb">
		<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
			<caption>单机产品卡样查询</caption>
			<tr>
				<td align="right">卡样编号</td>
				<td><s:textfield id="idSelectCardExampleId"/></td>
				
				<td align="right">卡样名称</td>
				<td><s:textfield id="idSelectcardExampleName"/></td>
				
				<td height="30">
					<input type="button" value="查询" id="input_btn2" onclick="searchStyle(1)"  name="ok" />
					<s:hidden id="idRadio" name="radio" />
					<s:hidden id="idHiddenStyleBranchCode" name="hiddenBranchCode" />
					<s:hidden id="idHiddenPlanNo" name="planNo" />
					<s:hidden id="idHiddenCardBranch" name="hiddenCardBranch" />
					<s:hidden id="idHiddenIsBunding" name="isBunding" />
				</td>
			</tr>
		</table>
	</div>
	<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>

<!-- 数据列表区 -->
<div class="tablebox" id="idSelectData">
</div>
