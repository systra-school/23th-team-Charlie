<!-- employeeMstMntRegister.jsp -->
<%
/**
 * ファイル名：employeeMstMntRegister.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
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
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>
    <script type="text/javascript">
    /**
     * チェックボックスがチェックされたら true、されていなければ false
     * param index 対象行番号
     */
    function checkDeleteFlg(index) {
      var isCheck = document.forms[0].elements.deleteEmployeeId[index].checked;

      document.forms[0].elements.deleteFlg[index].value = isCheck;
    }

    /*
     * 新規登録画面へ
     */
    function employeeMstMntRegister() {

        with (document.forms[0]) {
            // パスワード
            var passwordVar = password.value;
            // 社員名カナ
            var employeeNameVar = employeeName.value;
            // 社員名カナ
            var employeeNameKanaVar = employeeNameKana.value;
            // エラーメッセージ
            var errorMsg = '';

            // 背景色をクリアする
            password.style.backgroundColor = 'white';
            employeeName.style.backgroundColor = 'white';
            employeeNameKana.style.backgroundColor = 'white';

            // パスワード
            if (passwordVar.length >= 7) {
                	var strArr = ['パスワード'];
                    errorMsg += getMessage('E-MSG-000007', strArr);
	                password.style.backgroundColor = 'red';
			}
            if (!checkRequired(passwordVar)) {
                // エラー有り
	            var strArr = ['パスワード'];
	            errorMsg += getMessage('E-MSG-000001', strArr);
	            password.style.backgroundColor = 'red';
            }
            // 社員名
            if (!checkRequired(employeeNameVar)) {
                // エラー有り
                var strArr = ['社員名'];
                errorMsg += getMessage('E-MSG-000001', strArr);
                employeeName.style.backgroundColor = 'red';
            }
			
            // 2024/09/02　山内　未入力・半角エラーチェック
	        // 社員名カナ
            if (!checkRequired(employeeNameKanaVar)) {
            	 // 未入力エラー有り
            	var strArr = ['社員名カナ'];
                errorMsg += getMessage('E-MSG-000001', strArr);
                employeeNameKana.style.backgroundColor = 'red';
            }else if (!checkHalfWidthKana(employeeNameKanaVar)) {
            	// 半角カナエラー有り
                var strArr = ['社員名カナ'];
                errorMsg += getMessage('E-MSG-000003', strArr);
                employeeNameKana.style.backgroundColor = 'red';
            }

            if (errorMsg) {
                alert(errorMsg);
                // エラー
                return false;
            }
        }

        // サブミット
        doSubmit('/kikin-for-Struts-bug/employeeMstMntRegister.do');
    }
    
    
    </script>
	<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js'>    </script>

	
	
    <title>社員マスタメンテナンス画面</title>

    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table class="full-width">
          <tr>
            <td id="headLeft">
            <!-- 9/6 池嵜　下記コードdoSubmit('/kikin-for-Struts-bug/employeeMstMntRegisterBack.do')→ Backを消しました。-->
            <%--onclick="doSubmit('/kikin-for-Struts-bug/employeeMstMntRegister.do')" のコードを下記に変更 --%>
            </td>
            <td id="headCenter">
              社員マスタメンテナンス（新規登録）
            </td>
            <td id="headRight">
           　<input value="ログアウト" type="button" class="mOUTbotan"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <br>
      <p><a href="/kikin-for-Struts-bug/menu.do">メニュー</a> > <a href="/kikin-for-Struts-bug/employeeMstMnt.do">社員マスタメンテナンス</a> > 社員マスタメンテナンス（新規登録）</p>
      <div id="businessBody">
        <html:form action="/employeeMstMntRegister" >
          <div style="width: 650px;text-align: left;  margin: 0 auto;">
            <table class="tableHeader">
              <tr>
                <td width="150px" align="center">
                  パスワード（6桁）
                </td>
                <td width="200px" align="center">
                  社員名
                </td>
                <td width="200px" align="center">
                  社員名カナ（半角）
                </td>
                <td width="100px" align="center">
                  権限
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height: 440px; width: 650px; margin: 0 auto; ">
            <table class="tableBody">
              <tr>
                <td width="150px"  align="center">
                  <html:password property="password"  value="" size="10" />
                </td>
                <td width="200px"  align="center">
                  <html:text property="employeeName" value="" size="20" />
                </td>
                <td width="200px"  align="center">
                  <html:text property="employeeNameKana" value="" size="20" />
               	</td>
                <td width="100px" align="center">
                  <html:select property="authorityId" value="01">
                    <html:optionsCollection name="employeeMstMntForm"
                                            property="authorityCmbMap"
                                            value="key"
                                            label="value"/>
                  </html:select>
                </td>
              </tr>
            </table>
          </div>
        </html:form>
      </div>
      <div id="footer">
        <table>
          <tr>
            <td id="footLeft">
              　
            </td>
            <td id="footCenter">
              　
            </td>
            <td id="footRight">
              <input value="登録" type="button" class="TourokuPrintBotan"  onclick="employeeMstMntRegister()" />
            </td>
          </tr>
        </table>
      </div>
    </div>

	<div class="target" id="banner" style="display: none;">
		<div id="flyin" class="stopanimate">
			<a href="https://systra-school.com/">
				<img src="/kikin-for-Struts-bug/pages/img/kyujin2.jpg" alt="バナー画像" width="100%">
			</a>
			<button class="flyinclose button"></button>
		</div>
	</div>

	<script>


		// 3秒後にバナーを表示する
		setTimeout(function () {
			var banner = document.getElementById("banner");
			banner.style.display = "block";  // バナーを表示
		}, 3000);  // 10000ミリ秒 = 10秒
		
		$(function(){
		    $('.button').click(function(){
		        $('.target').hide();
		    });
		});
		
	</script>
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js'></script>

  </body>
  <footer>
		<%@include file="/pages/cmn/footer.jsp" %>
</footer>
</html>