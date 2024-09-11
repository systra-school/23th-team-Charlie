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
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=M+PLUS+Rounded+1c:wght@100;300;400;500;700;800;900&display=swap');
</style>

    <title>メニュー画面</title>
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body><div class="kintai">
      <%@ include file="/pages/cmn/kintai.jsp" %>
      </div>
    <div id="wrapper">
   
       <div id="header">
        <table class="full-width">
          <tr>
            <td id="headLeft">
              　
            </td>
            <td id="headCenter">
            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="authorityId"
                         value="<%=CommonConstant.Authority.ADMIN.getId() %>">
                メニュー(管理者)
            </logic:equal>

            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="authorityId"
                         value="<%=CommonConstant.Authority.USER.getId() %>">
                メニュー(一般)
            </logic:equal>
            </td>
            <td id="headRight">
              <input value="ログアウト" type="button" class="mOUTbotan"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
    
      <div id="businessBody">
        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="authorityId"
                     value="<%=CommonConstant.Authority.ADMIN.getId() %>">
          <div  style="margin-left:15%;margin-top:3%;">
          <div class="menuBlock">
            <html:form action="/monthlyShiftCheckInit">
              <input type="submit" value="月別シフト確認" class="mbotan" />
            </html:form>
            <html:form action="/dailyShiftInit">
              <input type="submit" value="日別シフト確認" class="mbotan" />
            </html:form>

            
          </div>

          <div class="menuBlock">
            <html:form action="/workRecordCheckInit">
              <input type="submit" value="勤務実績確認" class="mbotan" />
            </html:form>
            <html:form action="/workRecordInputInit">
              <input type="submit" value="勤務実績入力" class="mbotan" />
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/workDateRequestCheckInit">
              <input type="submit" value="出勤希望日確認" class="mbotan" />
            </html:form>
           
          </div>
          
          </div>
          <div  style="margin-right:10em; margin-top: -20em; max-width:100%;">
          <div class="kanriBlock">
           <html:form action="/monthlyShiftInputInit">
              <input type="submit" value="月別シフト入力" class="mbotan" />
            </html:form>
          
            <html:form action="/employeeMstMnt">
              <input type="submit" value="社員マスタメンテナンス" class="mbotan" />
            </html:form>
            
            <html:form action="/shiftMstMnt">
              <input type="submit" value="シフトマスタメンテナンス" class="mbotan" />
            </html:form>
           
            <html:form action="/baseShiftInit">
              <input type="submit" value="基本シフト登録" class="mbotan" />
            </html:form>
          </div>
          </div>
        </logic:equal>
        
        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="authorityId"
                     value="<%=CommonConstant.Authority.USER.getId() %>">
          
          <div  style="margin-left:15%;">
          <div class="menuBlock">
            <html:form action="/monthlyShiftCheckInit">
              <input type="submit" value="月別シフト確認" class="mbotan" />
            </html:form>
            <html:form action="/dailyShiftInit">
              <input type="submit" value="日別シフト確認" class="mbotan" />
            </html:form>
          </div>
          
          <div class="menuBlock">
            <html:form action="/workRecordInputInit">
              <input type="submit" value="勤務実績入力" class="mbotan" />
            </html:form>
          </div>
		  
		  <%--〇 --%>
          <div class="menuBlock">
            <html:form action="/workDateRequestInputInit">
              <input type="submit" value="出勤希望日入力" class="mbotan" />
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/baseShiftCheckInit">
              <input type="submit" value="基本シフト確認" class="mbotan" />
            </html:form>
          </div>

          
          </div>
           </logic:equal>
        </div>          
       
      </div>
      
      <div id="footer">
        <table>
          <tr>
            <td id="footLeft">
              　
            </td>
            <td id="footCenter">
              　
            </td>
            <td id="footRight">
              　
            </td>
          </tr>
        </table>
      </div>
  </body>
</html>