<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/oneOnOne_list_admin.css">
    <title>1:1문의내역 리스트(관리자페이지)</title>    
</head>
<body>
	<div class="container">
        <nav>
            <section class="logo">
                <a href="/link/mainLogin">
                    <img src="/resources/images/logo.png">
                </a>
            </section>

            <section class="menu">
                <div id="map">
                    <a href="/link/mapMainNotLogin">지도</a>
                </div>
                <div id="roomup">
                    <a href="/link/roomUp">방내놓기</a>
                </div>
                <div id="board">
                    <a href="/link/boardList">게시판</a>
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
                	<a href="/link/oneOnOneListUser">1:1 문의 내역</a>
                </div>
                <div>
                	<a href="/link/roomDetailView">내가 올린 매물 목록</a>
                </div>
                <div>
                	<a href="/link/declarationList">허위매물 신고내역</a>
                </div>
                <div>
                	<a href="/link/noticeListUser">공지사항</a>
                </div>
            </div>
            <div class="content">
                <div class="menutitle">
                    1:1 문의 내역
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
                        <div>게시물 삭제처리는 어떻게하나요?</div>
                        <div>매물을 추가로 올리려면 반드시 증명자료를 제출해야하나요?</div>
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
                    <div id="content-progress">
                        <div id="content-progress-title">진행상황</div>
                        <div id="ongoing">처리중</div>
                        <div id="complete">답변완료</div>
                        <div id="ongoing">처리중</div>
                        <div id="complete">답변완료</div>
                        <div id="ongoing">처리중</div>
                        <div id="complete">답변완료</div>
                        <div id="ongoing">처리중</div>
                        <div id="complete">답변완료</div>
                        <div id="ongoing">처리중</div>
                        <div id="complete">답변완료</div>
                    </div>
                </div>
                <div class="search">
                    <select id="search-type">
                        <option value="search-title">제목</option>
                        <option value="search-content">내용</option>
                    </select>
                    <input id="search-word" placeholder="검색어를 입력해주세요.">
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
                <img src="/resources/images/chat_icon.png" id="chat-icon">
            </div>
        </main>
    </div>
</body>
</html>