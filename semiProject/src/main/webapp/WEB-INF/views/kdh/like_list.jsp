<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심목록</title>
    <link rel="stylesheet" href="/resources/css/like_list.css">
    <link rel="stylesheet" href="/resources/css/topbar_atag_black_style.css">
</head>
<body>
    <div class="container">
        <nav>
            <section class="logo">
                <a href="/">
                    <img src="/resources/images/logo.png">
                </a>
            </section>
            <%-- 각 글씨에 링크 걸것 --%>
            <section class="menu">

                <div id="favorites">
                    <a href="/link/likeList">관심목록</a>
                </div>

                <div id="roomup">
                    <a href="/link/roomUpFront">방내놓기</a>
                </div>

                <div id="board">
                    <a href="/link/communityList">게시판</a>
                </div>
                <div id="mypage">
                    <a href="/link/myInfo">내정보</a>
                </div>

            </section>
        </nav>

        <main id="main-container">
            <div id="main-left">1</div>
            <div id="main-mid">
               <div class="mid-favorite-container">
                    <div class="mid-img-container">
                        <img src="/resources/images/room.jpg" alt="" class="mid-img1">
                    </div>
                    <p>원룸</p>
                    <p class="value">전세 1억 8천</p>
                    <p>2층, 50제곱미터, 관리비 7만원</p>
                    <p>신림역 5분거리</p>
                </div>    
                <div class="mid-favorite-container">
                    <div class="mid-img-container">
                        <img src="/resources/images/room.jpg" alt="" class="mid-img1">
                    </div>
                    <p>원룸</p>
                    <p class="value">전세 1억 7천</p>
                    <p>2층, 50제곱미터, 관리비 7만원</p>
                    <p>신림역 5분거리</p>
                </div>
                <div class="mid-favorite-container">
                    <div class="mid-img-container">
                        <img src="/resources/images/room.jpg" alt="" class="mid-img1">
                    </div>
                    <p>원룸</p>
                    <p class="value">전세 1억 7천</p>
                    <p>2층, 50제곱미터, 관리비 7만원</p>
                    <p>신림역 5분거리</p>
                </div>
                <div class="mid-favorite-container">
                    <div class="mid-img-container">
                        <img src="/resources/images/room.jpg" alt="" class="mid-img1">
                    </div>
                    <p>원룸</p>
                    <p class="value">전세 1억 7천</p>
                    <p>2층, 50제곱미터, 관리비 7만원</p>
                    <p>신림역 5분거리</p>
                </div>
                <div class="mid-favorite-container">
                    <div class="mid-img-container">
                        <img src="/resources/images/room.jpg" alt="" class="mid-img1">
                    </div>
                    <p>원룸</p>
                    <p class="value">전세 1억 7천</p>
                    <p>2층, 50제곱미터, 관리비 7만원</p>
                    <p>신림역 5분거리</p>
                </div>
                <div class="mid-favorite-container">
                    <div class="mid-img-container">
                        <img src="/resources/images/room.jpg" alt="" class="mid-img1">
                    </div>
                    <p>원룸</p>
                    <p class="value">전세 1억 7천</p>
                    <p>2층, 50제곱미터, 관리비 7만원</p>
                    <p>신림역 5분거리</p>
                </div>  
                
                
                
              
            </div>
            <div id="main-right">
                3
                
            </div>






        </main>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb9b63d71a5408fd96cba9a1674b9d43&libraries=services,clusterer"></script>
        <script src="/resources/js/like_list.js"></script>
</body>
</html>