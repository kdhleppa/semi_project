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

            <form class="content" action="/link/myInfoUpdate" method="POST" name="myPageFrm" id="updateInfo">
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
                
				
                <button id="btnbox" class="infoUpdate">수정 완료</button>

            </form>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
</body>
</html>