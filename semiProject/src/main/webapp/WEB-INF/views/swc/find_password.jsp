<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호찾기</title>
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/find_idpw.css">
</head>
<body>
    <div class="container">
        <nav>
            <section class="logo">
                <a href="/">
                    <img src="/resources/images/logo.png">
                </a>
            </section>

            <section class="menu">

                <div id="map">
                   <a href="/link/mapMainLogin">지도</a>
                </div>

            </section>
        </nav>

        <div class="mainpart">
            <div class="leftmenu">
                
            </div>

            <form class="content" action="/sendEmail" method="POST" name="findPwFrm">

                <div class="title" style="font-weight: 500; margin-bottom: 40px;">
                    <div id="findId">
                        <a href="/link/findId" style="text-decoration: none;">아이디 찾기</a>
                    </div>
                    

                    <div id="findPw" style="margin-left: 70px;">
                        <a href="/link/findPassword" style="font-weight: 1000; text-decoration: none;">비밀번호 찾기</a>
                    </div>
                </div>

				
                <!-- 이메일 입력 -->
                
                <div class="signUp-input-area">
                    <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일" maxlength="40">
                    
                    <button id="sendAuthKeyBtn" type="button">인증번호 받기</button>
                </div>
                
                
                <!-- 인증번호 입력 -->

                <div class="signUp-input-area">
                    <input type="text" name="authKey" id="authKey" placeholder="인증번호 입력" maxlength="6" autocomplete="off" >
                    
                    <button id="checkAuthKeyBtn" type="button">인증확인</button>
                </div>
                <span class="signUp-message" id="authKeyMessage"></span>
                                <!-- 인증번호가 일치하지 않습니다 -->
                    
                
                <button id="btnbox"> <a href="/link/newPassword" style="color:white; text-decoration:none;">다음</a> </button>

				<div class="signUpFind">
                    <div>
                        <a href="/link/signUp">회원가입</a>
                    </div>
                    
                    <div style="margin-left: 50px;">
                        <a href="/link/login">로그인</a>
                    </div>
                </div>

                </form>
                
            <div class="rightmenu">
                
            </div>
                
        </div>

    </div>
    
    <c:if test="${not empty message}">
	
	<script>
		
		alert('${message}') // ${message}
	</script>
	</c:if>
    
    <script src="/resources/js/findPw.js"></script>
    
</body>
</html>