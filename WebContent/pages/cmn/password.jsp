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

    <title>パスワードを忘れた方へ</title>
    
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">
     <style>
      #video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures the video covers the area without distortion */
            z-index: -1; /* Places the video behind other content */
        }
      /* Define the keyframes for the fade-in animation */
      @keyframes fadeIn {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }
      
      /* Apply the animation to the .animated-text class */
      .animated-text {
        animation: fadeIn 4s ease-in-out;
      }
      
       .content-wrapper {
            display: flex;
            flex-direction: column;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
            color: yellow; /* Text color for visibility */
            text-align: center; /* Center text within the content wrapper */
            font-size: 60px;
            font-family: "Dela Gothic One", sans-serif;
            text-shadow: 7px 5px 5px rgb(209 44 225 / 80%);
        }
        
         .link-text {
            font-size: 60px; /* リンクの文字サイズ */
            margin-top: 20px; /* 上部マージン */
            text-shadow: 7px 5px 5px rgb(209 44 225 / 80%); /* リンクに影をつける */
            color: yellow; /* リンクの文字色 */
            text-decoration: none;
            font-family: "Dela Gothic One", sans-serif;
            animation: fadeIn 10s ease-in-out; /* デフォルトの下線を削除 */
        }
        
        
    </style>
  </head>
  <body class = "anime">
  <!-- 背景動画 -->
    <video id="video-background" autoplay muted loop>
      <source src="/kikin-for-Struts-bug/pages/videos/マト47802-451812879_tiny.mp4" type="video/mp4">
    </video>

  <div class ="content-wrapper">
  <div class = "password animated-text" style="" >なるはやで管理者に連絡してください</div>
   <a href="/kikin-for-Struts-bug/pages/cmn/emergency.jsp" class="link-text">なるはやで！！</a>
  </div>
  <br>
  
</body>
</html>