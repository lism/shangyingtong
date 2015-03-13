<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
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

		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
		<script>
		$(function(){
			$('#cardId').blur(function(){
				var value = $(this).val();
				if(value == null || value == undefined || value == ""){
					return;
				}
				$.post(CONTEXT_PATH + '/intgratedService/unlosscard/cardIdCheck.do', {'unlossCardReg.cardId':value, 'callId':callId()}, 
				function(json){
					if (json.success){
						$('#idCustName_hidden').val(json.custName_hidden);
						$('#idCertType_hidden').val(json.certType_hidden);
						$('#idCertNo_hidden').val(json.certNo_hidden);
						$(':submit').removeAttr('disabled');
						hideMsg();
					} else {
						showMsg(json.error);
						$(':submit').attr('disabled', 'true');
						//$('#cardId').val('');
					}
				}, 'json');
			});
		});
		function doConfirm(){
			var custName = $('#idCustName').val();
			var certType = $('#idCertType').val();
			var certNo = $('#idCertNo').val();
			var custNameHidden = $('#idCustName_hidden').val();
			var certTypeHidden = $('#idCertType_hidden').val();
			var certNoHidden = $('#idCertNo_hidden').val();
			if(isEmpty(custNameHidden) && isEmpty(certTypeHidden) && isEmpty(certNoHidden)){
				return confirm("卡号持卡人未保存姓名、证件信息，是否继续？");
			} else {
				if(!isEmpty(custNameHidden)&&custName != custNameHidden){
					return confirm('持卡人姓名不符，是否继续？');
				}
				if(!isEmpty(certTypeHidden)&&certType != certTypeHidden){
					return confirm('持卡人证件类型不符，是否继续？');
				}
				if(!isEmpty(certNoHidden)&&certNo != certNoHidden){
					return confirm('持卡人证件号码不符，是否继续？');
				}
			}
			return true;
		}
		</script>
	</head>
    
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<div class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<s:form action="add.do" id="inputForm" cssClass="validate">
					<div>
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<caption>${ACT.name}</caption>
						
						<tr>
							<td width="80" height="30" align="right">卡号</td>
							<td>
							<s:textfield id="cardId" name="unlossCardReg.cardId" onkeyup="this.value=this.value.replace(/\D/g,'')" 
							onafterpaste="this.value=this.value.replace(/\D/g,'')" cssClass="{required:true}" maxlength="19"></s:textfield>
							</td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">持卡人姓名</td>
							<td>
							<s:textfield id="idCustName" name="unlossCardReg.custName" cssClass="{}"></s:textfield>
								<span class="field_tipinfo">请输入持卡人姓名</span>
							</td>
						</tr>	
						<tr>
							<td width="80" height="30" align="right">证件类型</td>
							<td>
								<s:select id="idCertType" name="unlossCardReg.certType" list="certTypeList" headerKey="" headerValue="--请选择--" listKey="value" listValue="name" cssClass="{}"></s:select>
								<span class="field_tipinfo">请选择证件类型</span>
							</td>
						</tr>	
							<td width="80" height="30" align="right">证件号码</td>
							<td><s:textfield id="idCertNo" name="unlossCardReg.certNo" cssClass="{}"/>
								<span class="field_tipinfo">请输入证件号码</span>
						</tr>
						<tr>
							<td width="80" height="30" align="right">备注</td>
							<td>
							<s:textfield name="unlossCardReg.remark" />
								<span class="field_tipinfo">请输入备注</span>
							</td>
						</tr>
						<tr>
							<td width="80" height="30" align="right">&nbsp;</td>
							<td height="30" colspan="3">
								<input type="submit" value="提交" id="input_btn2"  name="ok" onclick="return doConfirm();"/>
								<input type="button" value="清除" name="escape" onclick="FormUtils.reset('inputForm')" class="ml30" />
								<input type="button" value="返回" name="escape" onclick="gotoUrl('/intgratedService/unlosscard/list.do?goBack=goBack')" class="ml30" />
								<s:hidden id="idCustName_hidden" />
								<s:hidden id="idCertType_hidden" />
								<s:hidden id="idCertNo_hidden" />
							</td>
						</tr>
					</table>
					<s:token name="_TOKEN_UNLOSSCARD_ADD"/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>

		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>