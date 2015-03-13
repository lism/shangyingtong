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
		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
		<f:js src="/js/jquery.js"/>
		<f:js src="/js/plugin/jquery.metadata.js"/>
		<f:js src="/js/plugin/jquery.validate.js"/>
		<f:js src="/js/sys.js"/>
		<f:js src="/js/common.js"/>
		<f:js src="/js/paginater.js"/>

		<script>	
		</script>
		
	</head>
    
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<!-- 查询功能区 -->
		<div class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<s:form id="searchForm" action="list.do" cssClass="validate-tip">
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<caption>
							WS客户端ip限制| <span class="caption_title"><f:link href="/para/webServiceConf/wsClientIpLimit/listDtl.do">WS客户端ip限制 - 明细 </f:link></span> 
						</caption>
						<tr>
							<td width="80" height="30" align="right">机构编号</td>
							<td><s:textfield name="wsClientIpLimit.branchCode"/></td>
							<td width="80" height="30" align="right">机构名称</td>
							<td><s:textfield name="formMap.branchName"/></td>
							<td width="80" height="30" align="right">限制类型</td>
							<td>
								<s:select name="wsClientIpLimit.limitType" list='#{"":"--请选择--", "1":"白名单", "0":"黑名单"}'/>
							</td>
							
							<td width="80" height="30" align="right">状态</td>
							<td>
								<s:select name="wsClientIpLimit.status" list='#{"":"--请选择--", "1":"启用", "0":"注销"}'/>
							</td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">备注</td>
							<td><s:textfield name="wsClientIpLimit.remark"/></td>
							<td></td>
							<td height="30" colspan="4" >
								<input type="submit" value="查询" id="input_btn2"  name="ok" />
								<input style="margin-left:30px;" type="button" value="清除" 
									onclick="FormUtils.reset('searchForm')" name="escape" />
								<f:pspan pid="wsClientIpLimit_add">
									<input style="margin-left:30px;" type="button" value="添加" onclick="javascript:gotoUrl('/para/webServiceConf/wsClientIpLimit/showAdd.do');" id="input_btn3"  name="escape" />
								</f:pspan>
							</td>
						</tr>
					</table>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<!-- 数据列表区 -->
		<div class="tablebox">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">机构编号</td>
			   <td align="center" nowrap class="titlebg">机构名称</td>
			   <td align="center" nowrap class="titlebg">限制类型</td>
			   <td align="center" nowrap class="titlebg">状态</td>			   
			   <td align="center" nowrap class="titlebg">备注</td>
			   <td align="center" nowrap class="titlebg">更新时间</td>			   
			   <td align="center" nowrap class="titlebg">更新人</td>
			   <td align="center" nowrap class="titlebg">操作</td>
			</tr>
			</thead>
			<s:iterator value="page.data"> 
			<tr>		
			  <td align="center" nowrap>${branchCode}</td>
			  <td align="left" nowrap>${fn:branch(branchCode)}</td>
			  <td align="center" nowrap>
				  <s:if test='limitType=="1"' >白名单</s:if>
				  <s:elseif test='limitType=="0"'>黑名单  </s:elseif>
			  </td>
			  <td align="center" nowrap>
				  <s:if test='status=="1"' >
				  	启用
				  </s:if>
				  <s:else>
				  	<font color="red">注销</font>
				  </s:else>
			  </td>
			  <td align="left" nowrap>${remark}</td>
			  <td align="center" nowrap><s:date name="updateTime" format="yyyy-MM-dd HH:mm:ss" /></td>
			  <td align="center" nowrap>${updateBy }</td>
			  <td align="center" nowrap>
			  	<span class="redlink">
			  		<s:form id="operateForm" />
					<f:link href="/para/webServiceConf/wsClientIpLimit/detail.do?wsClientIpLimit.branchCode=${branchCode}">
						查看
					</f:link>
			  		&nbsp;
					<f:link href="/para/webServiceConf/wsClientIpLimit/listDtl.do?wsClientIpLimitDtl.branchCode=${branchCode}">
						ip限制明细
					</f:link>
			  		&nbsp;
			  		<f:pspan pid="wsClientIpLimit_modify">
			  			<f:link href="/para/webServiceConf/wsClientIpLimit/showModify.do?wsClientIpLimit.branchCode=${branchCode}">
			  				编辑
			  			</f:link>
				  	</f:pspan>
				  	&nbsp;
				  	<f:pspan pid="wsClientIpLimit_delete">
			  			<a href="javascript:submitUrl('operateForm', '/para/webServiceConf/wsClientIpLimit/delete.do?wsClientIpLimit.branchCode=${branchCode}', '确定要删除吗？');" >
			  				删除
			  			</a>
			  		</f:pspan>	
			  	</span>
			  </td>
			</tr>
			</s:iterator>
			</table>
			<f:paginate name="page"/>
		</div>
		
		<div class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>	
			<div class="contentb">
				<span class="note_div">注释</span>
				<ul class="showli_div">
					<li class="showli_div">配置了“ws客户端ip限制”，并且状态为“启用”，服务端才会对该机构的ws客户端ip做限制（具体限制需要参考该机构的 ip限制明细）。</li>
				</ul>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>