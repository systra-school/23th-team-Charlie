<!-- monthlyShiftInput.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.mth.MonthlyShiftInputForm"%>
<%
/**
 * ファイル名：monthlyShiftInput.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 * 2.0  2024/05/15 Sho.Kiyota
 */
%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<bean:size id="dateBeanListSize" name="monthlyShiftInputForm" property="dateBeanList"/>
<bean:size id="listSize" name="monthlyShiftInputForm" property="monthlyShiftInputBeanList"/>
<!-- showLengthのvalueが6になっていたので16に修正しました。 -->
<bean:define id="showLength" value="16" type="java.lang.String"/>
<bean:define id="offset" name="monthlyShiftInputForm" property="offset" />
<bean:define id="color" value="" type="java.lang.String"/>
<bean:define id="countPage" name="monthlyShiftInputForm" property="countPage" type="java.lang.Integer"/>
<bean:define id="maxPage" name="monthlyShiftInputForm" property="maxPage" type="java.lang.Integer"/>

<%
final int heightSize = 30;

int intShowLength = Integer.parseInt(showLength);

// 表示しているリストサイズの調整
if (countPage.intValue() == maxPage.intValue()) {
    listSize = listSize % intShowLength;
}

if (listSize > intShowLength) {
    listSize = intShowLength;
}

%>
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
     * 基本シフト反映
     */
    function submitImportKihon() {
        // サブミット
        doSubmit('/kikin-for-Struts-bug/monthlyShiftInputImportKihon.do');
    }
    /**
     * 出勤希望反映
     */
    function submitWorkDateRequest() {
        // サブミット
        window.open('/kikin-for-Struts-bug/monthlyShiftInputWorkDateRequest.do', "blank", "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=2300px, height=300px");
    }

    /**
     * 登録
     */
    function submitRegister() {
        // サブミット
        doSubmit('/kikin-for-Struts-bug/monthlyShiftInputRegister.do');
    }

    /**
     * 検索
     */
    function submitSearch() {
        doSubmit('/kikin-for-Struts-bug/monthlyShiftInputSearch.do');
    }

    /**
     * サブウィンドウを開く
     */
     
     /* 2024/09/04 田中 >>
     /kikin-for-Struts-bug/menu.do?param=
    にっていたので
    /kikin-for-Struts-bug/shiftPattern.do?param=
    へ変更しました
     */
    function openWindow(){
        window.open("/kikin-for-Struts-bug/shiftPattern.do?param=", "windowBPopup", "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
    }
    </script>
    <title>月別シフト入力画面</title>

    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table  class="centered-container">
          <tr>
            <td id="headLeft">
              <input value="戻 る" type="button" class="ModoruBotan"  onclick="doSubmit('/kikin-for-Struts-bug/menu.do')" />
            </td>
            <td id="headCenter">
              月別シフト入力
            </td>
            <td id="headRight">
              <input value="ログアウト" type="button" class="mOUTbotan"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="businessBody" style="overflow: hidden;">
        <html:form action="/monthlyShiftInputInit" >
          <div>
            <div id="resize"> 
              表示年月：
              <bean:define id="sessionYearMonth" name="monthlyShiftInputForm" property="yearMonth" type="String"/>
              <html:select property="yearMonth" name="monthlyShiftInputForm"  onchange="submitSearch()">
              <html:optionsCollection name="monthlyShiftInputForm"
                                      property="yearMonthCmbMap"
                                      value="key"
                                      label="value"/>
              </html:select>
              <html:link href="/kikin-for-Struts-bug/monthlyShiftInputPage.do?paging=back">前へ</html:link>
              <!-- 2024/09/04 田中 >>
              次へのリンクのpagingがbackになっていたのでnextへ修正しました。
               -->
              <html:link href="/kikin-for-Struts-bug/monthlyShiftInputPage.do?paging=next">次へ</html:link>
              <bean:write name="monthlyShiftInputForm" property="countPage"/>/
              <bean:write name="monthlyShiftInputForm" property="maxPage"/>
            
            <div style= "margin: 0 auto;">
            <table class="widthTable">
              <tr>
                <td width="150px" valign="top">
                  <table class="tableHeader">
                    <tr height="<%=heightSize %>px">
                      <td width="150px" align="center">
                        &nbsp;
                      </td>
                    </tr>
                    <tr height="<%=heightSize %>px">
                      <td width="150px" align="center">
                      社員名
                      </td>
                    </tr>
                    <logic:iterate offset="offset" length="<%=showLength %>"  id="monthlyShiftInputBeanList" name="monthlyShiftInputForm" property="monthlyShiftInputBeanList">
                      <tr height="<%=heightSize %>px">
                        <td width="150px" align="center">
                          <bean:write property="employeeName" name="monthlyShiftInputBeanList"/><br>
                        </td>
                      </tr>
                    </logic:iterate>
                  </table>
                </td>
                <td valign="top" >
                  <div style="overflow-x: auto;overflow-y: hidden; width: 1300px; height: auto; text-align:center;">
                    <table class="tableHeader">
                      <tr height="<%=heightSize %>px">
                         <% for(int i = 1;i <= dateBeanListSize;i++ ) { %>
                         <td width="40px" align="center" valign="middle">
                         <%= i %> 
                         </td>
                         <% } %>
                      </tr>
                      <tr height="<%=heightSize %>px">
                        <logic:iterate id="dateBeanList" name="monthlyShiftInputForm" property="dateBeanList">
                          <bean:define id="weekDay" name="dateBeanList" property="weekDay"/>
						  <bean:define id="publicHolidayFlg" name="dateBeanList" property="publicHolidayFlg"/>
						  
		                  <%
		                  if (DayOfWeek.SATURDAY.getWeekdayShort().equals(weekDay)) {
		                      color = "fontBlue";
		                  } else if (DayOfWeek.SUNDAY.getWeekdayShort().equals(weekDay) || ((boolean)publicHolidayFlg)) {
		                      color = "fontRed";
		                  } else {
		                      color = "fontBlack";
		                  }
		                  %>

                            <td width="40px" align="center" class="<%=color %>">
                              <bean:write property="weekDay" name="dateBeanList"/><br>
                            </td>
                        </logic:iterate>
                      </tr>
                      <logic:iterate offset="offset" length="<%=showLength %>" id="monthlyShiftInputBeanList" name="monthlyShiftInputForm" property="monthlyShiftInputBeanList">
                        <html:hidden name="monthlyShiftInputBeanList" property="registerFlg" value="true" indexed="true"/>
                        <tr height="<%=heightSize %>px">
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId01" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId02" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId03" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId04" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId05" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId06" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId07" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId08" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId09" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId10" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId11" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId12" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId13" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId14" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId15" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId16" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId17" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId18" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId19" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId20" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId21" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId22" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId23" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId24" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId25" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId26" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId27" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% if (dateBeanListSize >= 28) { %>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId28" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% } %>
                          <% if (dateBeanListSize >= 29) { %>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId29" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% } %>
                          <% if (dateBeanListSize >= 30) { %>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId30" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          
                          <!-- 2024/09/05 田中 >>
                          31日目が無かったので追加しました。 -->
                          
                          <% } %>
                          <% if (dateBeanListSize >= 31) { %>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId31" name="monthlyShiftInputBeanList" indexed="true">
                            <html:optionsCollection name="monthlyShiftInputForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% } %>
                          <!-- ここまで -->
                          
                        </tr>
                      </logic:iterate>
                    </table>
                  </div>
                </td>
              </tr>
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
            <div style="margin-left:50px;white-space: nowrap;">
	          <input value="凡例表示" type="button" class="HanreiBotan"  onclick="openWindow()" />
	          
	          <!-- 2024/09/04 田中 >>
	          出勤希望日反映のonclickがsubmitImportKihon()になっていたので、
	          submitWorkDateRequest()に変更しました。
	           -->
	          
	        </div>
	        
	        
            </td>
            <td>
            <input value="基本シフト反映" type="button" class="HanneiBotan"   onclick="submitImportKihon()"/>
            </td>
            <td>
            <input value="みんなの希望確認" type="button" class="HanneiBotan"  onclick="submitWorkDateRequest()" />
            </td>
            <td id="footCenter" style="text-align: right;">

            </td>
            <td id="footRight">
              <input value="登 録" type="button" class="TourokuPrintBotan"  onclick="submitRegister()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>