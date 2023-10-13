<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/oneOnOne_list_user.css">
    <title>1:1문의내역 리스트(유저)</title>    
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
                	<a href="/link/roomDetailView">내가 올린 매물 목록</a>
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
                    1:1 문의 내역
                </div>
                <div class="main-content">
                    <div id="content-number">
                        <div id="content-number-title">번호</div>
                        <div>00001</div>
                        <div>00002</div>
                        <div>00003</div>
                        <div>00004</div>
                    </div>
                    <div id="content-title">
                        <div id="content-title-title">제목</div>
                        <div>게시물 삭제처리는 어떻게하나요?</div>
                        <div>매물을 추가로 올리려면 반드시 증명자료를 제출해야하나요?</div>
                        <div>글 제목 3</div>
                        <div>글 제목 4</div>
                    </div>
                    <div id="content-date">
                        <div id="content-date-title">등록일</div>
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
                    </div>
                </div>
                <div class="search">
                    <button id="writing">
                    	<a href="/link/oneOnOneWriting">1:1 문의하기</a>
                    </button>
                </div>
            </div>
            <div class="right">
                <img src="/resources/images/chat_icon.png" id="chat-icon">
            </div>
        </main>
    </div>
</body>
</html>