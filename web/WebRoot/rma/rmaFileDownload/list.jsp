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
		<f:js src="/js/date/WdatePicker.js" defer="defer"/>
		
		<f:js src="/js/plugin/jquery.multiselector.js"/>
		<f:css href="/css/multiselctor.css"/>
		
		<script>
			$(function(){
				if('${loginRoleType}' == '00'){
					Selector.selectBranch('idBranchCode_sel', 'idBranchCode', true, '20');
				} else if('${loginRoleType}' == '01'){
					Selector.selectBranch('idBranchCode_sel', 'idBranchCode', true, '20', '', '', '${loginBranchCode}');
				}
			});
			
			function downLoadRmaFile(merchantNo, reportDate, reportFileName) {
				location.href = CONTEXT_PATH
						+ "/rma/rmaFileDownload/rmaFileDownload.do?formMap.merchantNo="
						+ merchantNo + "&formMap.reportDate=" + reportDate
						+ "&formMap.reportFileName=" + reportFileName;
			}

			function check() {
				var branchName = $('#idBranchCode_sel').val();
				if (isEmpty(branchName)) {
					$('#idBranchCode').val('');
				}
			}
		</script>

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
							<td align="right">日期</td>
							<td>
								<s:textfield id="id_reportDate" name="reportPathSave.reportDate" onclick="WdatePicker()"/>
							</td>
							<s:if test="'00'.equals(loginRoleType) || '01'.equals(loginRoleType)">
							<td align="right">发卡机构</td>
							<td>
								<s:hidden id="idBranchCode" name="reportPathSave.merchantNo"/>
								<s:textfield id="idBranchCode_sel" name="branchName" />
							</td>
							</s:if>
							<td height="30">
								<input type="submit" value="查询" id="input_btn2"  onclick="return check();" name="ok" />
								<input style="margin-left:10px;" type="button" value="清除" onclick="FormUtils.reset('searchForm')" name="escape" />
							</td>
						</tr>
					</table>
					<s:token name="_TOKEN_RMA_FILE_LIST"/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<!-- 数据列表区 -->
		<div class="tablebox">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">日期</td>
			   <td align="center" nowrap class="titlebg">机构号</td>
			   <td align="center" nowrap class="titlebg">机构名称</td>
			   <td align="center" nowrap class="titlebg">文件名称</td>
			   <td align="center" nowrap class="titlebg">操作</td>
			</tr>
			</thead>
			<s:iterator value="page.data">
			<tr>
			  <td align="center" nowrap>${reportDate}</td>
			  <td align="center" nowrap>${merchantNo}</td>
			  <td nowrap>${fn:branch(merchantNo)}</td>
			  <td nowrap>${reportName}</td>
			  <td align="center" nowrap>
			  	<span class="redlink">
			  		<f:pspan pid="rma_file_download">
			  		<a href="javascript:downLoadRmaFile('${merchantNo}','${reportDate}','${reportName}');"/>下载</a>
			  		</f:pspan>
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