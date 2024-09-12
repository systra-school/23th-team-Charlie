<!-- login.jsp -->
<%@page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>


<html lang="ja">
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
<script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>
<html:javascript formName="loginForm" />
<title>ログイン画面Login</title>
<link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="rogo">㈱KAPPA勤怠管理 <a href="#"><img alt="出勤"src="/kikin-for-Struts-bug/pages/img/kappa.png" width="3%"
					height="auto"></a></div>

	<%
  if(session.getAttribute("error")!=null){
	  
    %>
	<script type="text/javascript">
  	var msg = getMessageCodeOnly('E-MSG-000002');
    alert(msg);
  </script>
	<%
  session.setAttribute("error", null);}%>

	<div id="wrapper">
		<div id="header">
			<table class="full-width">
				<tr>
					<td id="headLeft"></td>
					<td id="headCenter">ログイン</td>
					<td id="headRight"></td>
				</tr>
			</table>
		</div>
		
		<div id="businessBody">
			<div align="center">
			<br>
				<div>ID・パスワードを入力してください。</div>
				<br>
				<html:form action="/login" onsubmit="return validateLoginForm(this)">
					
					<%-- 2024/09/09
					value="sh0001"の値を2つとも削除しました。
					
					 --%>
					<html:text property="employeeId" size="16"/>
					<br />
					<html:password property="password" size="16" redisplay="false"/>
					<br />
					<br />
					<div class="Logbotan">
					<html:submit property="submit" value="ログイン" styleClass="Log2"/>
					</div>
					
					
					<%-- 2024/09/09 田中 >>
					property="reset"を追加しました。 --%>
					<div class="Resetbotan">
					<html:reset property="reset" value="リセット" styleClass="Re2"/>
					</div>
					
				</html:form>
			</div>
		</div>
		
		<div style="text-align: center;padding-top:45px;padding-left:10px;">
		    <a href="/kikin-for-Struts-bug/pages/cmn/password.jsp">パスワードを忘れた方はこちら</a><br>
		    <img alt="退勤"src="/kikin-for-Struts-bug/pages/img/penginonigiri-1.gif" width="13%" height="auto" style="padding-top:50px;padding-left:30px;"><br>
		    
		</div>
		
		<div id="footer">
			<table>
				<tr>
					<td id="footLeft"></td>
					<td id="footCenter"></td>
					<td id="footRight"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>