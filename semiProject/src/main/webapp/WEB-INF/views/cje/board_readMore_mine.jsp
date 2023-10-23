<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/board_readMore_mine.css">
	<title>커뮤니티 글 자세히보기(본인이 쓴 글)</title>
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
                    <a href="/link/boardList">게시판</a>
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
                
                    <div class="main-content-left"></div>
                    <div class="main-content-main">
                        <div id="content-info">
                            <div>${current.memberNickname}</div>
                            <div>${current.boardDate}</div>
                            <div>조회수 : ${current.boardCount}</div>
                        </div>
                        <div id="content-title">${current.boardTitle}</div>
                        <div id="content-text">${current.boardContent}</div>
                        <div id="content-comments"></div>
                        <div id="content-listbutton">
                        
                        	<c:if test="${not empty prev}">
	                            <div id="previous">
	                                <button>∧</button>
	                                <div>이전글</div>
	                                <a href="/link/boardReadMoreMine/${prev.BOARD_NO}">${prev.BOARD_TITLE}</a>
	                            </div>
                        	</c:if>
                        	
                        	<c:if test="${not empty next}">
	                            <div id="next">
	                                <button>∨</button>
	                                <div>다음글</div>
	                                <a href="/link/boardReadMoreMine/${next.BOARD_NO}">${next.BOARD_TITLE}</a>
	                            </div>
                            </c:if>
                        </div>
                        <c:if test="${not empty loginMember}">
	                        <div id="content-modifybutton">
	                            <button id="modifyButton">수정</button>
	                            <button id="deleteButton">삭제</button>
	                        </div>
						</c:if>
                    </div>
                    <div class="main-content-right"></div> 
                </div>
            </div>
            <div class="right">
                <button id="bottom-nav-top">
                	<a href="#">위로</a>
                </button>
                <button id="bottom-nav-list">
                	<a href="/link/communityList">목록</a>
                </button>
                <img src="/resources/images/chat_icon.png" id="chat-icon">
            </div>
        </main>
    </div>

</body>
</html>