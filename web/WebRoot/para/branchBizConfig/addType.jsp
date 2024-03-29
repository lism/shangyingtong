<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ include file="/common/taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/common/meta.jsp" %>
		<%@ include file="/common/sys.jsp" %>
		<title>机构业务配置-类型添加</title>
		
		<f:css href="/css/page.css"/>
		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
		<style type="text/css">
			#tranEnableDiv table table .headcell { text-align: right; width:80px; }
		</style>
		<f:js src="/js/jquery.js"/>
		<f:js src="/js/plugin/jquery.metadata.js"/>
		<f:js src="/js/plugin/jquery.validate.js"/>
		<f:js src="/js/sys.js"/>
		<f:js src="/js/common.js"/>
		<f:js src="/js/paginater.js"/>
		<f:js src="/js/validate.js"/>
		
		<script>
		</script>
	</head>
    
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<jsp:include flush="true" page="/common/loadingBarDiv.jsp"></jsp:include>
		
		<div id="contentDiv" class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<s:form action="addType.do" id="inputForm" cssClass="validate">
					<div>
						<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
							<caption>机构业务配置-类型添加</caption>
							
							<tr>
								<td width="80" height="30" align="right">类型编号</td>
								<td><s:textfield name="branchBizConfigType.configType" cssClass="{required:true}"/></td>
								
								<td width="80" height="30" align="right">类型名称</td>
								<td><s:textfield name="branchBizConfigType.configTypeName" cssClass="{required:true}"/></td>
							</tr>
							
							<tr style="margin-top: 30px">
								<td width="80" height="30" align="right">备注</td>
								<td colspan="11"><s:textfield name="branchBizConfigType.remark" size="128"/></td>
							</tr>
							<tr>
								<td></td>
								<td height="30" colspan="11">
									<input type="submit" value="提交" id="input_btn2"  name="ok" />
									<input type="button" value="清除" name="escape" onclick="FormUtils.reset('inputForm');" class="ml30" />
									<input type="button" value="返回" name="escape" onclick="gotoUrl('/para/branchBizConfig/listType.do?goBack=goBack')" class="ml30" />
								</td>
							</tr>
						</table>
					</div>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>