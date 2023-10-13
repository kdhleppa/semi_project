<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보수정</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/src/main/webapp/resources/css/my_info.css">
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

                <div id="login">
                    <a href="/link/login">로그인</a>
                </div>

                <div id="map">
                    <a href="/link/mapMainLogin">지도</a>
                </div>
            </section>
        </nav>

        <div class="mainpart">
            <div class="leftmenu">
            
                <div>
                   <a href="/link/myInfoUpdate">정보수정</a>
                </div>
                
                <div>
                   <a href="/">채팅함</a>
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
                   <a href="/link/noticeList">공지사항</a>
                </div>
                
            </div>

            <form class="content">
                <div class="title">
                    정보수정
                </div>

                <div>
                    <p class="infobox" style="margin-left: 59px;">&nbsp;&nbsp;&nbsp;&nbsp;아이디</p>
                    <p id="textbox" style="background-color: gray;"></p><button>중복확인</button>
                </div>

                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</p>
                    <input id="textbox" type="text">
                </div>
                    
                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호확인</p>
                    <input id="textbox" type="text">
                </div>

                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;이름</p>
                    <p id="textbox" style="background-color: gray;"></p>
                </div>

                <div>
                    <p class="infobox" style="margin-left: 60px;">&nbsp;&nbsp;&nbsp;&nbsp;닉네임</p>
                    <input id="textbox" type="text"><button>중복확인</button>
                </div>

                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;Email</p>
                    <input id="textbox" type="text">
                </div>

                <div>
                    <p class="infobox" style="margin-left: 63px;">&nbsp;&nbsp;&nbsp;&nbsp;휴대폰</p>
                    <input id="textbox" type="text"> 인증하기
                </div>

                <div style="font-size: 25px; margin-right: 300px;">
                    프로필 사진 등록
                </div>

                <div class="profileimg" style="border-image: round;">
                    <input type="image">
                </div>

                <button id="btnbox" class="infoUpdate">수정 완료</button>

            </form>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
</body>
</html>