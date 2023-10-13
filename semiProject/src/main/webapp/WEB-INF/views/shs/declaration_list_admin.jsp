<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/src/main/webapp/resources/css/declaration_list_admin.css">

    <title>허위매물 신고내역</title>    
</head>
<body>
    <form>
        <div class="container">
            <nav>
                <section class="logo">
                    <a href="http://192.168.120.16:5500/SemiDesign/main.html">
                        <img src="/src/main/webapp/resources/images/logo.png">
                    </a>
                </section>

                <section class="menu">
                    <div id="map">
                        <a href="/link/mapMainLogin">지도</a>
                    </div>

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

            <main>
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
	                   <a href="#">공지사항</a>
	                </div>
            	</div>
                <div class="content">
                    <div class="menutitle">
                        허위매물 신고내역
                    </div>
                    <div class="main-content">
                        <div id="content-number">
                            <div id="content-number-title">ID</div>
                            <div>User01</div>
                            <div>User02</div>
                            <div>User03</div>
                            <div>User04</div>
                            <div>User05</div>
                            <div>User06</div>
                            <div>User07</div>
                            <div>User08</div>
                            <div>User09</div>
                            <div>User10</div>
                        </div>
                        <div id="content-date">
                            <div id="content-date-title">신고일</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                            <div>2023-09-22</div>
                        </div>
                        <div id="content-title">
                            <div id="content-title-title">제목</div>
                            <div>매물 제목 1</div>
                            <div>매물 제목 2</div>
                            <div>매물 제목 3</div>
                            <div>매물 제목 4</div>
                            <div>매물 제목 5</div>
                            <div>매물 제목 6</div>
                            <div>매물 제목 7</div>
                            <div>매물 제목 8</div>
                            <div>매물 제목 9</div>
                            <div>매물 제목 10</div>
                        </div>
                        <div id="content-date">
                            <div id="content-date-title">처리여부</div>
                            <div>미처리</div>
                            <div>처리완료</div>
                            <div>미처리</div>
                            <div>미처리</div>
                            <div>미처리</div>
                            <div>미처리</div>
                            <div>미처리</div>
                            <div>처리완료</div>
                            <div>처리완료</div>
                            <div>처리완료</div>
                        </div>
                        <div id="content-hits">

                            <div id="content-hits-title">삭제하기</div>

                            
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                                <button id="delete">삭제</button>
                        
                            <!--
                            <div>삭제</div>
                            <div>삭제</div>
                            <div>삭제</div>
                            <div>삭제</div>
                            <div>삭제</div>
                            <div>삭제</div>
                            <div>삭제</div>
                            <div>삭제</div>
                            <div>삭제</div>
                            <div>삭제</div> 
                            -->
                        </div>
                    </div>
                    <div class="search">
                        <select id="search-type">
                            <option value="search-title">제목</option>
                            <option value="search-content">내용</option>
                        </select>
                        <input id="search-word" placeholder="검색어를 입력해주세요.">
                        <button id="writing">검색</button>
                    </div>
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
                <div class="right">
                    <button id="bottom-nav-top">위로</button>
                    <button id="bottom-nav-list">목록</button>
                    <img src="/jieun/img/chat_icon_final.png" id="chat-icon">
                </div>
            </main>
        </div>
    </form>
</body>
</html>