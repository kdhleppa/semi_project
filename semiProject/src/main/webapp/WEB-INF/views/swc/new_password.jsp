<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호수정</title>
    <link rel="stylesheet" href="/resources/css/new_password.css">
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
                        <a href="/link/findId" style="text-decoration: none;">아이디 찾기</a>
                    </div>
                    

                    <div id="findPw" style="margin-left: 70px;">
                        <a href="/link/findPassword" style="font-weight: 1000; text-decoration: none;">비밀번호 찾기</a>
                    </div>
                </div>

                <div style="margin-right: 80px;">
                    새 비밀번호
                    <div>
                        <input type="text" id="underline">
                    </div>
                </div>

                <div style="margin-right: 120px;">
                    새 비밀번호 확인
                    <div>
                        <input type="text" id="underline">
                    </div>
                </div>

                <button id="btnbox">확인</button>

                </form>
            <div class="rightmenu">
                
            </div>
                
        </div>

    </div>
</body>
</html>