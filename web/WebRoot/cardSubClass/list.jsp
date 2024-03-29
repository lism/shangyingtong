<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	response.setHeader("Cache-Control", "no-cache");
%>
<%@ include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<%@ include file="/common/sys.jsp"%>
<title>${ACT.name}</title>

<f:css href="/css/page.css" />
<f:js src="/js/jquery.js" />
<f:js src="/js/plugin/jquery.metadata.js" />
<f:js src="/js/plugin/jquery.validate.js" />
<f:js src="/js/sys.js" />
<f:js src="/js/common.js" />
<f:js src="/js/paginater.js" />
<f:js src="/js/date/WdatePicker.js" defer="defer" />

<f:css href="/css/multiselctor.css" />
<f:js src="/js/plugin/jquery.multiselector.js" />
<script>
	$(function() {
		if ('${loginRoleTypeCode}' == '00') {
			Selector.selectBranch('id_branchCodeName', 'id_branchCode', true,
					'20');
		} else if ('${loginRoleTypeCode}' == '01') {
			Selector.selectBranch('id_branchCodeName', 'id_branchCode', true,
					'20', '', '', '${loginBranchCode}');
		}
	});
</script>

<style type="text/css">
html {
	overflow-y: scroll;
}
</style>
</head>

<body>
	<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>

	<!-- 查询功能区 -->
	<div class="userbox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="contentb">
			<s:form action="list.do" id="searchForm" cssClass="validate-tip">
				<table id="form_grid" class="form_grid" width="100%" border="0"
					cellspacing="3" cellpadding="0">
					<caption>${ACT.name}</caption>
					<tr>
						<td align="right">卡类型号</td>
						<td><s:textfield name="cardSubClassDef.cardSubclass" /></td>

						<td align="right">卡类型名称</td>
						<td><s:textfield name="cardSubClassDef.cardSubclassName" /></td>

						<td align="right">卡种</td>
						<td><s:select name="cardSubClassDef.cardClass"
								list="cardTypeList" headerKey="" headerValue="--请选择--"
								listKey="cardTypeCode" listValue="cardTypeName">
							</s:select></td>
						<td align="right">电子消费券种</td>
						<td><s:select name="cardSubClassDef.ecouponType"
								list="ecouponList" headerKey="" headerValue="默认不使用"
								listKey="value" listValue="name">
							</s:select></td>

					</tr>
					<tr>
						<td align="right">绝对失效日期</td>
						<td><s:textfield id="startDate" name="startDate"
								onclick="getStartDate();" cssStyle="width:68px;" />&nbsp;-&nbsp;
							<s:textfield id="endDate" name="endDate" onclick="getEndDate();"
								cssStyle="width:68px;" /></td>
						<td align="right">发卡机构</td>
						<s:if test="centerOrCenterDeptRoleLogined || fenzhiRoleLogined">
							<td><s:hidden id="id_branchCode"
									name="cardSubClassDef.cardIssuer" /> <s:textfield
									id="id_branchCodeName" name="formMap.cardBranchName" /> <!-- 名称只是简单在页面给用户显示而已 -->
							</td>
						</s:if>
						<s:elseif test="cardOrCardDeptRoleLogined">
							<td><s:select name="cardSubClassDef.cardIssuer"
									list="myCardBranch" headerKey="" headerValue="--请选择--"
									listKey="branchCode" listValue="branchName"
									onmouseover="FixWidth(this);" /></td>

						</s:elseif>
						<td height="30" colspan="4"><input type="submit" value="查询"
							id="input_btn2" name="ok" /> <input style="margin-left: 10px;"
							type="button" value="清除"
							onclick="FormUtils.clearFormFields('searchForm')" name="escape" />
							<f:pspan pid="makecardmgr_typemgr_add">
								<input style="margin-left: 10px;" type="button" value="新增"
									onclick="javascript:gotoUrl('/cardSubClass/preShowAdd.do');"
									id="input_btn3" name="escape" />
							</f:pspan></td>
					</tr>
				</table>
				<s:token name="_TOKEN_CARDSUBCLASS_LIST" />
			</s:form>
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
	</div>
	${#pageSize}



	<!-- 数据列表区 -->
	<div class="tablebox">
		<table class="data_grid" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<thead>
				<tr>
					<td align="center" nowrap class="titlebg">卡类型号</td>
					<td align="center" nowrap class="titlebg">发卡机构</td>
					<td align="center" nowrap class="titlebg">卡类型名称</td>
					<td align="center" nowrap class="titlebg">卡种</td>
					<td align="center" nowrap class="titlebg">卡BIN</td>
					<td align="center" nowrap class="titlebg">绝对失效日期</td>
					<td align="center" nowrap class="titlebg">卡片类型</td>
					<td align="center" nowrap class="titlebg">操作</td>
				</tr>
			</thead>

			<s:iterator value="page.data">
				<tr>
					<td nowrap>${cardSubclass}</td>
					<td nowrap>${cardIssuer}-${fn:branch(cardIssuer)}</td>
					<td nowrap>${cardSubclassName}</td>
					<td align="center" nowrap>${cardTypeName}</td>
					<td align="center" nowrap>${binNo}</td>
					<td align="center" nowrap>${mustExpirDate}</td>
					<td align="center" nowrap>${icTypeName}</td>
					<td align="center" nowrap><span class="redlink"> <f:link
								href="/cardSubClass/detail.do?cardSubClassDef.cardSubclass=${cardSubclass}">查看</f:link>
							<s:if test='"00".equals(status)'>
								<%-- 待审核状态 --%>
								<f:pspan pid="makecardmgr_typemgr_modify">
									<f:link
										href="/cardSubClass/showModify.do?cardSubClassDef.cardSubclass=${cardSubclass}">编辑</f:link>
								</f:pspan>
							</s:if> <f:pspan pid="makecardmgr_typemgr_modify">
								<f:link
									href="/cardSubClass/showModify.do?formMap.modifyType=expireDateOrMonths&cardSubClassDef.cardSubclass=${cardSubclass}">
									<s:if test="specifyDateExpire">
				  				修改失效日期
			  				</s:if>
									<s:else>
			  					修改失效月数
			  				</s:else>
								</f:link>
							</f:pspan> &nbsp;&nbsp;&nbsp;&nbsp; <f:pspan
								pid="makecardmgr_typemgr_delete">
								<a
									href="javascript:submitUrl('searchForm', '/cardSubClass/delete.do?cardSubclass=${cardSubclass}', '确定要删除吗？');" />删除</a>
							</f:pspan>
					</span></td>
				</tr>
			</s:iterator>
		</table>
		<f:paginate name="page" />
	</div>

	<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
</body>
</html>