<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/notice_writing.css">
    <title>공지사항 등록 (관리자 페이지)</title>
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
                	<a href="/link/noticeListUser">공지사항</a>
                </div>
            </div>
            <div class="content">
                <div class="menutitle">
                    공지사항 등록
                </div>
                <div class="main-content">
                    <div class="main-content-left"></div>
                    
                    <form action="/notice2/insert" method="POST" id="noticeWriteFrm" enctype="multipart/form-data">
	                    <div class="main-content-main">
	                        <input id="content-title" placeholder="제목을 입력해주세요." name="noticeTitle"></input>
	                        
	                        <div class="boardImg">
			                    <button type="button" id="imageButton">이미지</button>
								<input type="file" id="imageInput" name="noticeImage" style="display:none;" accept="image/*">
								<div id="selectedImageName"></div>
	                        </div>
	                        
	                        <input id="content-text" placeholder="내용을 입력해주세요." name="noticeContent"></input>                        
	                        <div id="content-modifybutton">
	                            <button type="submit" id="registerButton">등록하기</button>
	                            <button type="button" id="cancelButton" onClick="history.back(); return false;">취소</button>
	                        </div>
	                    </div>
                    </form>
                    
                    <div class="main-content-right"></div>
                </div>
            </div>
            <div class="right">
                <button id="bottom-nav-top">
                	<a href="#">위로</a>
                </button>
                <button id="bottom-nav-list">
                	<a href="/link/noticeList">목록</a>
                </button>
                <img src="/resources/images/chat_icon.png" id="chat-icon">
            </div>
        </main>
    </div>
    
    <c:if test="${not empty message}">
	    <script>
			alert('${message}')
		</script>
	</c:if>
    
    <script src="/resources/js/noticeWrite.js"></script>
</body>
</html>