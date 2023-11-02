<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지쓰기</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/write_message.css">
</head>
<body>
    <div class="container">
        <nav>
            <section class="logo">
                <c:choose>
            		<c:when test="${loginMember != null}">
            			<a href="/link/mainLogin">
                    		<img src="/resources/images/logo.png">
               			</a>
            		</c:when>
            		<c:when test="${loginMember == null}">
            			<a href="/">
                    		<img src="/resources/images/logo.png">
               			</a>
            		</c:when>
            	</c:choose>
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

            <form class="content" action="/link/writeMessage" method="post" name="writeMessageFrm" id="messageWrite">
                    <div class="title">
                        쪽지쓰기
                    </div>

                <br><br><br>

                    <div style="display: flex;">
                        <p class="msgtitle" style="margin-left: 20px; margin-right: 20px;">제목</p>
                        
                        <div>
                            <input id="msgTitle" type="text" style="font-size: 18px; width: 550px; height: 40px;" placeholder="제목을 입력해주세요"
                            name="dmTitle"
                      		>
                        </div>
                    </div>

                    <div style="display: flex; margin-top: 20px; margin-left: -20px;">
                        <p class="msgtitle" style="margin-left: -325px; margin-right: 20px;">받는사람</p>
                        
                        <div>
                            <input id="memberNickname" type="text" style="font-size: 18px; width: 150px; height: 40px;" placeholder="닉네임"
                            name="receiveNick"
                            >
                        </div>
                    </div>

                    <div style="display: flex;">
                        <div class="boxbox">
                            글꼴
                        </div>

                        <div class="boxbox" style="margin-left: 20px;">
                            크기
                        </div>

                        <div class="boxbox" style="margin-left: 20px;">
                            정렬
                        </div>

                        <div class="boxbox" style="margin-left: 20px;">
                            이미지
                        </div>

                        <div class="boxbox" style="margin-left: 20px;">
                            동영상
                        </div>

                    </div>

                    <div style="display: flex;">
                        <p class="msgtitle" style="margin-right: 20px;">글내용</p>
                        
                        <div>
                            <textarea id="msgcontent" style="font-size: 20px; width: 550px; height: 350px;"
                            name="msgcontent"
                            >내용을 입력해주세요</textarea>
                        </div>
                    </div>

                    <div>
                        <button type="submit" id="btnbox" style="border: none; margin-top: 30px; font-size: 17px; margin-bottom: 80px;">보내기</button>
                        <button type="cancel" id="btnbox" style="border: none; margin-top: 30px; font-size: 17px; margin-bottom: 80px; margin-left: 20px;">취소</button>
                    </div>

            </form>
                

            <button id="btnbox">목록으로</button>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
</body>
</html>