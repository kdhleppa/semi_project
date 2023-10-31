<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/board_list_mine.css">
	<title>내가 쓴 글 목록</title>
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
            
            <section class="menu">
                <div id="map">
                    <a href="/link/mapMainNotLogin">지도</a>
                </div>
                <div id="roomup">
                    <a href="/link/roomUp">방내놓기</a>
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
                    내가 쓴 글 목록
                </div>
                <div class="main-content">
                    <div id="checkbox">
                        <div></div>
                        <div>
                            <input type="checkbox" id="myCheckbox">
                        </div>
                        <div>
                            <input type="checkbox" id="myCheckbox">
                        </div>
                        <div>
                            <input type="checkbox" id="myCheckbox">
                        </div>
                        <div>
                            <input type="checkbox" id="myCheckbox">
                        </div>
                        <div>
                            <input type="checkbox" id="myCheckbox">
                        </div>             
                    </div>
                    <div id="content-number">
                        <div id="content-number-title">번호</div>
                        <div>00001</div>
                        <div>00002</div>
                        <div>00003</div>
                        <div>00004</div>
                        <div>00005</div>
                    </div>
                    <div id="content-title">
                        <div id="content-title-title">제목</div>
                        <div>글 제목 1</div>
                        <div>글 제목 2</div>
                        <div>글 제목 3</div>
                        <div>글 제목 4</div>
                        <div>글 제목 5</div>
                    </div>
                    <div id="content-date">
                        <div id="content-date-title">등록일</div>
                        <div>2023-09-22</div>
                        <div>2023-09-22</div>
                        <div>2023-09-22</div>
                        <div>2023-09-22</div>
                        <div>2023-09-22</div>
                    </div>                    
                </div>
                <div class="main-content-bottom">
                    <button>선택삭제</button>
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