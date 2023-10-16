<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보조회</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/my_info.css">
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

                <div id="favorites">
                    <a href="/link/interestLogin">관심목록</a>
                </div>

                <div id="roomup">
                    <a href="/link/roomUpFront">방내놓기</a>
                </div>

                <div id="myInfo">
                    <a href="/link/myInfo">내 정보</a>
                </div>

            </section>
        </nav>

        <div class="mainpart">
            <div class="leftmenu">
            
                <div>
                   <a href="/link/myInfoUpdate">정보수정</a>
                </div>
                
                <div>
                   <a href="/link/messageReceived">채팅함</a>
                </div>
                
                <div>
                   <a href="/link/oneOnOneListUser">1:1 문의 내역</a>
                </div>
                
                <div>
                   <a href="/link/roomDetailView">내가 올린 매물</a>
                </div>
                
                <div>
                   <a href="/link/declarationList">허위매물 신고내역</a>
                </div>
                
                <div>
                   <a href="/link/noticeListUser">공지사항</a>
                </div>
                
            </div>

            <form class="content">
                <div class="title">
                    내 정보
                </div>

                <div class="profileimg" style="border-image: round;">
                    <input type="image">
                </div>

                <div>
                    이름
                    <div>
                        <input type="text" id="underline">
                    </div>
                </div>

                <div>
                    닉네임
                    <div>
                        <input type="text" id="underline">
                    </div>
                </div>

                <div>
                    휴대폰
                    <div>
                        <input type="text" id="underline">
                    </div>
                </div>

                <br>

                <a href="/link/withdrawal" style="margin-top: 40px; text-decoration: none;">회원탈퇴</a>
                
            </form>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
</body>
</html>