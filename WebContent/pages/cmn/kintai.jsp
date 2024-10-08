<!-- menu.jsp -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html lang="ja">
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
<html:javascript formName="loginForm" />
<script type="text/javascript"
	src="/kikin-for-Struts-bug/pages/js/common.js"></script>
<script type="text/javascript"
	src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
<script type="text/javascript"
	src="/kikin-for-Struts-bug/pages/js/message.js"></script>

<title>勤退画面</title>
<link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet"
	type="text/css" />

<style>
@import url('https://fonts.googleapis.com/css2?family=Kaisei+HarunoUmi:wght@400;500;700&family=Yuji+Hentaigana+Akari&display=swap');
@import url('https://fonts.googleapis.com/css2?family=M+PLUS+Rounded+1c:wght@100;300;400;500;700;800;900&display=swap');
</style>


</head>

<body style="text-align: left; margin-left: 0px; height: 0; width: 100%">
	<div class="rogo">KAPPA勤怠管理 <a href="#"><img alt="出勤"src="/kikin-for-Struts-bug/pages/img/kappa.png" width="3%"
					height="auto"></a></div>
	<div id="wrapper">
		

		<div id="businessBody">

			<div class="kname">
			こんにちは！
				<bean:write
					name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO%>"
					property="employeeName" />
				さん
			</div>
			<div class="realtime">
				<p id="realtime"></p>
			</div>
			
			<div class="m-plus-rounded-1c-thin">		
				<p>${emp_str}</p>
			</div>
			
			<!-- 勤退ボタン -->
			<div class="Kbotan">

				<a href="#"><img alt="出勤"src="/kikin-for-Struts-bug/pages/img/uni-1.gif" width="11%"
					height="auto"></a> 
					
				<a href="#"><img alt="退勤"src="/kikin-for-Struts-bug/pages/img/odorukome.gif" width="11%"
					height="auto"></a> <br>
					
				<div class="K2botan">
					<!-- Strutsのhtml:formタグを使用して、出勤ボタンをStrutsアクションに関連付け -->
    				<html:form action="/workAttendanceRegister">
        				<input type="submit" value="出勤" class="s2btn" />
				    </html:form>
				    <div class="t2div">
				    <div class="t2divsub">
				    <input type="submit" value="退勤" class="t2btn" />
				    </div>
				    	
				    </div>
					
				</div>


			</div>

		</div>
<footer>
<%@include file="/pages/cmn/footer.jsp" %>
</footer>
	</div>

	
	<!--　現在時刻取得  スクリプト-->
	<script>
		function twoDigit(num) {
			let ret;
			if (num < 10)
				ret = "0" + num;
			else
				ret = num;
			return ret;
		}
		function showClock() {
			let nowTime = new Date();
			let nowHour = twoDigit(nowTime.getHours());
			let nowMin = twoDigit(nowTime.getMinutes());
			let nowSec = twoDigit(nowTime.getSeconds());
			let msg = "時刻：" + nowHour + ":" + nowMin + ":" + nowSec;
			document.getElementById("realtime").innerHTML = msg;
		}
		setInterval('showClock()', 1000);
	</script>


</body>

</html>