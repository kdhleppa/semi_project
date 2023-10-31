<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보낸쪽지</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/detail_message.css">
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
                	<a href="/link/messageReceived">받은 쪽지함</a>
                </div>
                
                <div>
                	<a href="/link/messageSent">보낸 쪽지함</a>
                </div>
            </div>

            <div class="content">
                <div class="title">
                    보낸 쪽지
                </div>

                <br><br><br>

                <div style="display: flex;">
                    <p class="msgtitle" style="margin-left: 20px; margin-right: 20px;">제목</p>
                    
                    <div>
                        <input type="text" style="font-size: 18px; width: 550px; height: 40px;" placeholder="제목2">
                    </div>
                </div>

                <div style="display: flex; margin-left: -250px;">
                    <div class="boxbox">
                        아이디
                    </div>

                    <div class="boxbox" style="margin-left: 20px;">
                        보낸 시간
                    </div>
                </div>

                <div style="display: flex;">
                    <p class="msgtitle" style="margin-right: 20px;">글내용</p>
                    
                    <div>
                        <textarea style="font-size: 20px; width: 550px; height: 350px;">내용2</textarea>
                    </div>
                </div>

                <div>
                    <button id="btnbox" class="messageDelete">삭제</button>
                </div>
            
            </div>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
</body>
</html>