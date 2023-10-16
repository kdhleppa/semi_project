<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/my_room_up_list.css">

    <title>내가 올린 매물 목록</title>    
</head>
<body>
    <form>
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
                    <div>정보수정</div>
                    <div>채팅함</div>
                    <div>1:1 문의 내역</div>
                    <div>내가 올린 매물 목록</div>
                    <div>허위매물 신고내역</div>
                    <div>공지사항</div>
                </div>
                <div class="content">
                    <div class="menutitle">
                        내가 올린 매물 목록
                    </div>
                    <div class="main-content">
                        <div id="content-number">
                            <div id="content-number-title">번호</div>
                            <div>00001</div>
                            <div>00002</div>
                            <div>00003</div>
                            <div>00004</div>
                            <div>00005</div>
                            <div>00006</div>
                            <div>00007</div>
                            <div>00008</div>
                            <div>00009</div>
                            <div>00010</div>
                        </div>
                        <div id="content-date">
                            <div id="content-date-title">등록일</div>
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
                            <div>글 제목 1</div>
                            <div>글 제목 2</div>
                            <div>글 제목 3</div>
                            <div>글 제목 4</div>
                            <div>글 제목 5</div>
                            <div>글 제목 6</div>
                            <div>글 제목 7</div>
                            <div>글 제목 8</div>
                            <div>글 제목 9</div>
                            <div>글 제목 10</div>
                        </div>
                        <div id="content-date">
                            <div id="content-date-title">수정하기</div>


                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                            <button id="modify">수정</button>
                        
                            



                        <!-- <div>수정</div>
                            <div>수정</div>
                            <div>수정</div>
                            <div>수정</div>
                            <div>수정</div>
                            <div>수정</div>
                            <div>수정</div>
                            <div>수정</div>
                            <div>수정</div>
                            <div>수정</div>
                            -->
                        </div>
                        <div id="content-hits">
                            <div id="content-hits-title">삭제하기</div>


                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                            <button id="delete">내리기</button>
                        







                            <!--
                            <div>내리기</div>
                            <div>내리기</div>
                            <div>내리기</div>
                            <div>내리기</div>
                            <div>내리기</div>
                            <div>내리기</div>
                            <div>내리기</div>
                            <div>내리기</div>
                            <div>내리기</div>
                            <div>내리기</div>
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
                    <img src="/resources/images/chat_icon_final.png" id="chat-icon">
                </div>
            </main>
        </div>
    </form>
</body>
</html>