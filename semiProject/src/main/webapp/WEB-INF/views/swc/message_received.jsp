<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>받은쪽지함</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/message.css">
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
                	<a href="/link/messageReceived">받은 쪽지함</a>
                </div>
                
                <div>
                	<a href="/link/messageSent">보낸 쪽지함</a>
                </div>
            </div>

            <div class="content">
                <div class="title">
                    받은 쪽지함
                </div>

                <br><br><br>

                <div class="message">
                    <div>
                        <p class="msgtitle">번호</p>

                        <div class="boxbox">
                            983515
                        </div>
                        
                        <div class="boxbox">
                            983514
                        </div>

                        <div class="boxbox">
                            983513
                        </div>

                        <div class="boxbox">
                            983512
                        </div>

                        <div class="boxbox">
                            983511
                        </div>

                    </div>

                    <div>
                        <p class="msgtitle">보낸사람</p>

                        <div class="boxbox">
                            아이디1
                        </div>
                        
                        <div class="boxbox">
                            아이디2
                        </div>

                        <div class="boxbox">
                            아이디3
                        </div>

                        <div class="boxbox">
                            아이디4
                        </div>

                        <div class="boxbox">
                            아이디5
                        </div>
                    </div>

                    <div>
                        <p class="msgtitle">제목</p>
                        
                        <div class="boxbox2">
                            글 제목 1
                        </div>
                        
                        <div class="boxbox2">
                            글 제목 2
                        </div>

                        <div class="boxbox2">
                            글 제목 3
                        </div>

                        <div class="boxbox2">
                            글 제목 4
                        </div>

                        <div class="boxbox2">
                            글 제목 5
                        </div>
                    </div>

                    <div>
                        <p class="msgtitle">보낸시간</p>
                    
                        <div class="boxbox">
                            2099-99-99
                        </div>
                        
                        <div class="boxbox">
                            2099-99-99
                        </div>

                        <div class="boxbox">
                            2099-99-99
                        </div>

                        <div class="boxbox">
                            2099-99-99
                        </div>

                        <div class="boxbox">
                            2099-99-99
                        </div>

                    </div>
                    
                    <div>
                        
                        <div class="boxbox3" id="boxbox3-1">
                            삭제
                        </div>
                        
                        <div class="boxbox3">
                            삭제
                        </div>

                        <div class="boxbox3">
                            삭제
                        </div>

                        <div class="boxbox3">
                            삭제
                        </div>

                        <div class="boxbox3">
                            삭제
                        </div>
                    </div>


                </div>

                <button id="btnbox"> <a href="/link/writeMessage">쪽지보내기</a> </button>
            
                <div class="index">
                    <button><</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>6</button>
                    <button>7</button>
                    <button>8</button>
                    <button>9</button>
                    <button>10</button>
                    <button>></button>
                </div>

            </div>
            
            <div class="rightmenu">

            </div>
                    
        </div>

    </div>

    
</body>
</html>