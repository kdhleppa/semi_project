<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/community_list.css">
	<title>자유게시판 리스트</title>
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
                    <a href="/link/mapMainNotLogin">지도</a>
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
            	<a href="/link/communityListMine">내가 쓴 글</a>
            </div>
            
            <div class="content">
                <div class="menutitle">
                    자유 게시판
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
                    <div id="content-writer">
                        <div id="content-writer-title">글쓴이</div>
                        <div>아이디1</div>
                        <div>아이디2</div>
                        <div>아이디3</div>
                        <div>아이디4</div>
                        <div>아이디5</div>
                        <div>아이디6</div>
                        <div>아이디7</div>
                        <div>아이디8</div>
                        <div>아이디9</div>
                        <div>아이디10</div>
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
                    <div id="content-hits">
                        <div id="content-hits-title">조회</div>
                        <div>3</div>
                        <div>10</div>
                        <div>25</div>
                        <div>47</div>
                        <div>136</div>
                        <div>3</div>
                        <div>10</div>
                        <div>25</div>
                        <div>47</div>
                        <div>135</div>
                    </div>
                </div>
                <div class="search">
                    <select id="search-type">
                        <option value="search-title">제목</option>
                        <option value="search-content">내용</option>
                    </select>
                    <input id="search-word" placeholder="검색어를 입력해주세요.">
                    <button id="writing">
                    	<a href="communityWriting">글쓰기</a>
                    </button>
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
                <button id="bottom-nav-top">
                	<a href="#">위로</a>
				</button>
                <button id="bottom-nav-list">
                	<a href="#">목록</a>
                </button>
                <img src="/resources/images/chat_icon.png" id="chat-icon">
            </div>
        </main>
    </div>
    
</body>
</html>