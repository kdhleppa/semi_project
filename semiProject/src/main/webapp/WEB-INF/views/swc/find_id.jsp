<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디찾기</title>
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

            <div class="content">  

                <div class="title" style="font-weight: 500; margin-bottom: 40px;">
                    <div id="findId">
                        <a href="/link/findId" style="font-weight: 1000; text-decoration: none;">아이디 찾기</a>
                    </div>
                    
                    <div id="findPw" style="margin-left: 70px;">
                        <a href="/link/findPassword" style="text-decoration: none;">비밀번호 찾기</a>
                    </div>
                </div>

				<div class="signUp-input-area">
          		
            	<input type="text" id="inputName" placeholder="이름">
            	
            	</div>
            	
            	<div class="signUp-input-area">
            	
            	<input type="text" id="inputPhoneNum" placeholder="휴대폰 번호">
            	
            	</div>
            	
            	<button id="btn1">조회</button>
            	
            	
                <div class="signUpFind">
                    <div>
                        <a href="/link/signUp">회원가입</a>
                    </div>
                    
                    <div style="margin-left: 50px;">
                        <a href="/link/login">로그인</a>
                    </div>
                </div>
                
                <br><br>
                <p>아이디 : </p> <h1 id="result1"></h1>

            </div>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
    
    <script src="/resources/js/findId.js"></script>
</body>
</html>