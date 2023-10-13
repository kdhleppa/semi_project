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

            <form class="content">  

                <div class="title" style="font-weight: 500; margin-bottom: 40px;">
                    <div id="findId">
                        <a href="#" style="font-weight: 1000; text-decoration: none;">아이디 찾기</a>
                    </div>
                    
                    <div id="findPw" style="margin-left: 70px;">
                        <a href="/link/findPassword" style="text-decoration: none;">비밀번호 찾기</a>
                    </div>
                </div>

                <div style="margin-right: 80px;">
                    이름
                    <div>
                        <input type="text" id="underline">
                    </div>
                </div>

                <div>
                    휴대폰
                    <div>
                        <input type="text" id="underline"> 인증번호받기
                    </div>
                </div>

                <div id="signNum">
                    &nbsp;&nbsp;&nbsp;&nbsp;인증번호 6자리 숫자 입력<input type="text" style="border: none; background: transparent;">
                </div>
                    
                <div class="signUpFind">
                    <div>
                        <a href="/link/signUp">회원가입</a>
                    </div>
                    
                    <div style="margin-left: 50px;">
                        <a href="#">ID</a> / <a href="/link/findPassword">PW찾기</a>
                    </div>
                </div>
                    
                <button id="btnbox"> <a href="/link/newPassword" style="color:white; text-decoration:none;">확인</a> </button>

            </form>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
</body>
</html>