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

    <title>Team Charlie</title>
    
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
        
      #image-background2 {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures the image covers the area without distortion */
            z-index: -1; /* Places the image behind other content */
            display: none; /* Initially hidden */
        }

      @keyframes fadeIn {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }
      
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
           animation: fadeIn 10s ease-in-out;
        }
        .link-text {
            font-size: 60px; /* リンクの文字サイズ */
            margin-top: 20px; /* 上部マージン */
            text-shadow: 7px 5px 5px rgb(209 44 225 / 80%); /* リンクに影をつける */
            color: yellow; /* リンクの文字色 */
            text-decoration: none;
            font-family: "Dela Gothic One", sans-serif;
             /* デフォルトの下線を削除 */
        }
    </style>
    
   
</head>
<body class="anime">
  <!-- 背景動画 -->
    <video id="video-background" autoplay muted loop>
      <source src="/kikin-for-Struts-bug/pages/videos/サイバー地球1992-153555258_large.mp4">
    </video>
 <audio id="bgm" autoplay loop>
    <source src="/kikin-for-Struts-bug/pages/audio/MusMus-BGM-092.mp3" type="audio/mp3">
    <!-- If the file type is different, specify the correct type here -->
  
  </audio>
 
  <div class="content-wrapper">
    <a href="/kikin-for-Struts-bug/pages/cmn/login.jsp" class="link-text">株式会社C☆ストラでした～</a>
    <a>Congratulations To Everyone</a>
  </div>
  <br>
</body>
</html>
