<!-- baseShiftMstMnt.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%
/**
* ファイル名：baseShiftMstMnt.jsp
*
* 変更履歴
* 1.0  2010/11/13 新規作成 西岡孝太郎
*/
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<% String color = ""; %>
<html:html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js">
    </script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js">
    </script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js">
    </script>
    <script type="text/javascript">
    /**
     * 登録へ
     */
    function register() {
        // サブミット
//         doSubmit('/kikin-for-Struts-bug/baseShiftRegiste.do');
//         上記コードのbaseShiftRegiste.doをbaseShiftRegister.doに変更
        doSubmit('/kikin-for-Struts-bug/baseShiftRegister.do');
    }
    </script>

    <title>
    基本シフト登録
    </title>
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
  
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table class="full-width">
          <tr>
            <td id="headLeft">
              <input value="戻 る" type="button" class="ModoruBotan"  onclick="doSubmit('/kikin-for-Struts-bug/menu.do')" />
            </td>
            <td id="headCenter">
              基本シフト登録
            </td>
            <td id="headRight">
              <input value="ログアウト" type="button" class="mOUTbotan"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="businessBody">	
        <html:form action="/baseShiftRegister" >
          <div class="centered-container">
          <%-- 凡例 --%>
          <div id="pattern" style="width:476px; margin-left:80px; float:left">
            <div>
              <table class="tableHeader">
              <!-- <table>にclass="tableHeader"を追加 -->
                <tr>
                  <td width="100px" align="center">
                    シフト名
                  </td>
                  <td width="150px" align="center">
                    シンボル
                  </td>
                  <td width="150px" align="center">
                    時 間
                  </td>
                  <td width="50px" align="center">
                    休 憩
                  </td>
                </tr>
              </table>
            </div>
            <div style="height:450px;overflow:auto">
              <table class="tableBody">
              <!--  property="baseShiftPatternBeanList" listがついてなかったから追加 -->
                <logic:iterate id="baseShiftPatternBeanList" name="baseShiftMstMntForm"  property="baseShiftPatternBeanList" indexId="idx">
                  <tr>
                    <td width="100px" align="center">
                      <bean:write property="shiftName" name="baseShiftPatternBeanList"/>
                    </td>
                    <td width="150px" align="center">
                      <bean:write property="symbol" name="baseShiftPatternBeanList"/>
                    </td>
                    <td width="150px" align="center">
                      <bean:write property="timeZone" name="baseShiftPatternBeanList" filter="false"/>
                    </td>
                    <td width="50px" align="center">
                      <bean:write property="breakTime" name="baseShiftPatternBeanList"/>
                    </td>
                  </tr>
                </logic:iterate>
              </table>
            </div>
          </div>
          <div id="data" style="width:597px; margin-left:20px; float:left">
            <div>
              <table class="tableHeader">
               <!-- 曜日が月と火がぎゃくだった -->
                <tr>
                  <td width="246px" align="center">
                    社員名
                  </td>
                  <td width="50px" align="center">
                    月
                  </td>
                  <td width="50px" align="center">
                    火
                  </td>
                  <td width="50px" align="center">
                    水
                  </td>
                  <td width="50px" align="center">
                    木
                  </td>
                  <td width="50px" align="center">
                    金
                  </td>
                  <td width="50px" align="center">
                    土
                  </td>
                  <td width="50px" align="center">
                    日
                  </td>
				<!-- <td width="50px" align="center"> </td> -->
				<!--  上記のコードは必要ないのでコメントアウト -->
                </tr>
              </table>
            </div>
            
            <div style="width:614px;height:450px;overflow:auto">
              <table class="tableBody">
                <logic:iterate id="baseShiftMstMntBeanList" name="baseShiftMstMntForm" property="baseShiftMstMntBeanList" indexId="idx">
                  <tr>
                    <html:hidden name="baseShiftMstMntBeanList" property="employeeId" />
                    <td width="255px" align="center">
                      <bean:write property="employeeName" name="baseShiftMstMntBeanList"/>
                    </td>
                    <!-- 選択項目がでてこなかったから、出てくるようにロックされてる部分（disabled="true"）をfalseにした -->
                    <!-- 9/5　山内　プルダウンの送信プロパティのshiftIdOnMondayとshiftIdOnTuesdayが逆だったので入れ替え -->
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnMonday" name="baseShiftMstMntBeanList" indexed="true" disabled="false">
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnTuesday" name="baseShiftMstMntBeanList" indexed="true" disabled="false">
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnWednesday" name="baseShiftMstMntBeanList" indexed="true" disabled="false">
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnThursday" name="baseShiftMstMntBeanList" indexed="true" disabled="false">
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnFriday" name="baseShiftMstMntBeanList" indexed="true" disabled="false">
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnSaturday" name="baseShiftMstMntBeanList" indexed="true" disabled="false">
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnSunday" name="baseShiftMstMntBeanList" indexed="true" disabled="false">
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                  </tr>
                </logic:iterate>
              </table>
            </div>
          </div>
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
            <input value="登 録"  type="button" class="TourokuPrintBotan"  onclick="register()" />
              <!-- <input value="登録"  type="button" class="smallButton"  onclick="registe()" />
              2024/08/26　 onclick="registe()を上記のに変更-->
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html:html>
