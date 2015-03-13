<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ include file="/common/taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/common/meta.jsp" %>
		<%@ include file="/common/sys.jsp" %>
		
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
			$('#idNewPass').blur(function(){
				var pass = $(this).val();
				checkPWD(pass);
			});
		});
		/**
		 * 检查是否包含中文字符
		 */
		function strlen2(str){
			var len = 0;
			var i;

			for (i=0;i<str.length;i++){
				if (str.charCodeAt(i)>255) return true;
			}
			return false;
		}
		function checkPWD(pass) {
			if(strlen2(pass)){
				$('#error_tip_Id').html('新密码包含了非法字符').addClass('error_tipinfo').show();
				$('#input_btn2').attr('disabled', 'true');
			} else {
				$('#error_tip_Id').removeClass('error_tipinfo').html('区分大小写，6～16位。限用字母、数字、特殊字符。');
				$('#input_btn2').removeAttr('disabled');
			}
		}
		</script>
	</head>
    
	<body>
		<div>
			<tr>
			<td colspan="2" height="40" align="left">当前位置：修改密码</td>
			</tr>
		</div>
		<div class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<s:form action="changePassword.do" id="inputForm" cssClass="validate">
					<s:hidden name="cardId"></s:hidden>
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<caption>${ACT.name}</caption>
						
						<tr>
							<td width="150" height="30" align="right">输入旧密码</td>
							<td>
								<s:password name="oldPass" cssClass="{required:true, minlength:6}"/>
								<span class="field_tipinfo">请输入旧密码</span>
								<span class="error_tipinfo">旧密码至少6位</span>
							</td>
						</tr>
						<tr>
							<td width="150" height="30" align="right">新密码</td>
							<td>
								<s:password id="idNewPass" name="newPass" cssClass="{required:true, minlength:6}" maxlength="16"/>
								<span id="error_tip_Id" class="field_tipinfo">区分大小写，6～16位。限用字母、数字、特殊字符。</span>
								<span class="error_tipinfo">新密码至少6位</span>
							</td>
						</tr>
						<tr>
							<td width="150" height="30" align="right">确认新密码</td>
							<td>
								<s:password name="confirmPass" cssClass="{required:true, minlength:6, equalTo:'#idNewPass'}"/>
								<span class="field_tipinfo">请再次输入新密码</span>
								<span class="error_tipinfo">两次输入需一致</span>
							</td>
						</tr>
						<tr>
							<td></td>
							<td height="30" colspan="3">
							<input type="submit" value="提交" id="input_btn2"  name="ok" />
							<input type="button" value="清除" name="escape" onclick="FormUtils.reset('inputForm')" class="ml30" />
							</td>
						</tr>
					</table>
					<s:token name="_TOKEN_CARDHOLDER_CHANGEPASSWORD"/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>

	</body>
</html>