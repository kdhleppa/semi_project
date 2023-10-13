<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/oneOnOne_writing_admin.css">
    <title>1:1문의 답변하기 (관리자 페이지)</title>
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
                    1:1 문의하기
                </div>
                <div class="main-content">
                    <div class="main-content-left"></div>
                    <div class="main-content-main">
                        <div id="content-info">
                            <div>아이디</div>
                            <div>2023-10-04</div>
                        </div>
                        <div id="content-title">제목</div>
                        <div id="content-text">내용</div>
                        <input id="content-comments" placeholder="문의에 대한 답변을 입력해주세요.">
                        <div id="content-modifybutton">
                            <button id="modifyButton">수정</button>
                            <button id="deleteButton">
                            	<a href="/link/oneOnOneListAdmin">목록으로</a>
                            </button>
                        </div>
                    </div>
                    <div class="main-content-right"></div> 
                </div>
            </div>
            <div class="right">
                <img src="/resources/images/chat_icon.png" id="chat-icon">
            </div>
        </main>
    </div>
</body>
</html>