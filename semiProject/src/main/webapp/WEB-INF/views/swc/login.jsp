<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/login.css">
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
                   <a href="/link/mapMainNotLogin">지도</a>
                </div>

            </section>
        </nav>

        <div class="mainpart">
            <div class="leftmenu">
                
            </div>
            
            <form class="content" action="/link/login" method="post" name="login-form" id="loginFrm">        
                <div class="title">
                    로그인
                </div>
                    
                <!-- 아이디 입력 -->
				
				<div class="signUp-input-area">
                    <input type="text" name="memberId" id="memberId" placeholder="아이디" maxlength="10" >
                </div>

                <!-- 비밀번호/비밀번호 확인 입력 -->
                
                <div class="signUp-input-area">
                    <input type="password" name="memberPw" id="memberPw" 
                    placeholder="비밀번호" maxlength="20" >
                </div>
                    
                <div class="signUpFind">
                    <div>
                        <a href="/link/signUp">회원가입</a>
                    </div>
                    
                    <div style="margin-left: 50px;">
                        <a href="/link/findId">ID</a> / <a href="/link/findPassword">PW찾기</a>
                    </div>
                </div>
                    
                <button id="btnbox" class="login">로그인</button>
				
			
			
                <button id="kakaologinbox" class="kakaologin">
                    <img src="/resources/images/kakao.png" style="margin-right: 20px;">
                    카카오로 3초 만에 바로 시작
                </button>

                <button id="googleloginbox" class="googlelogin">
                    <img src="/resources/images/google.png" style="margin-right: 20px;">
                    구글 계정으로 로그인
                </button>
                
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
    
    <script src="/resources/js/login.js"></script>
</body>
</html>