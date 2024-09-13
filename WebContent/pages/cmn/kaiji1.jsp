<%@page contentType="text/html; charset=UTF-8"%>
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

    <title>どうしてパスワード忘れてんだよ</title>
    
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&family=Nanum+Myeongjo:wght@400;700;800&display=swap" rel="stylesheet">
    <style>
      body {
        margin: 0; /* Remove default margin */
        overflow: hidden; /* Prevent scrolling */
      }

      #image-background2 {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures the image covers the area without distortion */
            z-index: -1; /* Places the image behind other content */
            display: block; /* Ensure the image is visible */
        }

      .content-wrapper {
            display: flex;
            flex-direction: column;
            justify-content: flex-end; /* Align items to the bottom */
            align-items: center; /* Center horizontally */
            height: 100vh; /* Full viewport height */
            width: 100vw; /* Full viewport width */
            overflow: hidden; /* Hide overflowing content */
            position: relative; /* Ensure the container is positioned relative to its normal position */
        }

      .password {
        font-size: 45px;
        font-weight: 450; /* Correct weight value */
        font-family: "Nanum Myeongjo", sans-serif;
        color: #fff;
        text-shadow: 5px 2px 0px #171307;
        text-align: center; /* Center align the text */
        opacity: 0;
        animation: fadeIn 2s forwards, moveAround 9s infinite; /* Apply animations */
        margin-bottom: 20px; /* Add some margin from the bottom */
      }

      .password span {
        display: inline-block;
        opacity: 0; /* Initially hide all letters */
        animation: fadeInLetters 0.3s forwards; /* Adjust animation duration for individual letters */
        animation-delay: calc(0.1s * var(--i)); /* Set delay for each letter */
      }

      @keyframes fadeIn {
        to {
          opacity: 1;
        }
      }

      @keyframes fadeInLetters {
        to {
          opacity: 1;
        }
      }
      
      /* Optional: If you want the text to move around */
/*       @keyframes moveAround { */
/*         0% { */
/*           transform: translateX(0) translateY(0); */
/*         } */
/*         50% { */
/*           transform: translateX(calc(50vw - 50%)) translateY(calc(50vh - 50%)); */
/*         } */
/*         100% { */
/*           transform: translateX(0) translateY(0); */
/*         } */
/*       } */
    </style>
</head>
<body>
  <!-- 背景画像 -->
  <img id="image-background2" src="/kikin-for-Struts-bug/pages/img/藤原868bb159.webp" alt="Background Image">
  
  <!-- バックグラウンドミュージック -->
  <audio id="bgm" autoplay loop>
    <source src="/kikin-for-Struts-bug/pages/audio/76 (4).wav" type="audio/wav">
    <!-- If the file type is different, specify the correct type here -->
  
  </audio>

  <div class="content-wrapper">
    <div class="password" id="animated-text">
      <span>と゛お゛し゛て゛た゛よ゛お゛お゛お゛！<br>
      どうしてパスワード忘れてんだよぉぉぉ!</span>
      <a href="/kikin-for-Struts-bug/pages/cmn/final.jsp" class="link-text">!</a>
    </div>
  </div>

  <script>
    window.onload = function() {
      const textElements = document.querySelectorAll('#animated-text span');

      textElements.forEach((element, index) => {
        const text = element.innerText;
        element.innerHTML = ''; // Clear the original text

        // Create spans for each letter
        text.split('').forEach((char, charIndex) => {
          const span = document.createElement('span');
          span.innerText = char;
          span.style.setProperty('--i', charIndex + 1); // Set custom property for animation delay
          element.appendChild(span);
        });

        // Trigger the fade-in animations after the page load
        setTimeout(() => {
          element.style.opacity = 1; // Ensure the text is visible
        }, 2000); // Adjust the delay if needed
      });
    };
  </script>
</body>
</html>
