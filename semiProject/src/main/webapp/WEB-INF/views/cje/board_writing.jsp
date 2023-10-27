<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/board_writing.css">
    <title>자유게시판 글쓰기</title>
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
            	<a href="/link/boardListMine">내가 쓴 글</a>
            </div>
            
            <div class="content">
                <div class="menutitle">
                    자유 게시판
                </div>
                <div class="main-content">
                    <div class="main-content-left"></div>
                    
                    <form action="/board2/insert" method="POST" id="boardWriteFrm" enctype="multipart/form-data">
	                    <div class="main-content-main">
	                        <input id="content-title" placeholder="제목을 입력해주세요." name="boardTitle"></input>
	                        
	                        <div class="boardImg">
			                    <button type="button" id="imageButton">이미지</button>
								<input type="file" id="imageInput" name="boardImage" style="display:none;" accept="image/*">
								<div id="selectedImageName"></div>
	                        </div>

	                        <input id="content-text" placeholder="내용을 입력해주세요." name="boardContent"></input>                        
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
                	<a href="/link/boardList">목록</a>
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
    
    <script src="/resources/js/boardWrite.js"></script>
</body>
</html>