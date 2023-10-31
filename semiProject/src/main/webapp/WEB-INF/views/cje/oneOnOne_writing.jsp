<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/oneOnOne_writing.css">
    <title>1:1문의 글쓰기(유저)</title>
</head>
<body>
	<div class="container">
        <nav>
            <section class="logo">
            	<c:choose>
            		<c:when test="${loginMember != null}">
            			<a href="/link/mainLogin">
                    		<img src="/resources/images/logo.png">
               			</a>
            		</c:when>
            		<c:when test="${loginMember == null}">
            			<a href="/">
                    		<img src="/resources/images/logo.png">
               			</a>
            		</c:when>
            	</c:choose>                
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
                        <input id="content-title" placeholder="제목을 입력해주세요."></input>
                        <div id="content-option">
                            <label for="imageInput">이미지</label>
	                        <input type="file" name="profileImage" id="imageInput" accept="image/*">
                            <button type="button">동영상 url</button>
                        </div>
                        <input id="content-text" placeholder="내용을 입력해주세요."></input>                        
                        <div id="content-modifybutton">
                            <button id="registerButton">등록하기</button>
                            <button id="cancelButton">
                            	<a href="/link/oneOnOneListUser">취소</a>
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