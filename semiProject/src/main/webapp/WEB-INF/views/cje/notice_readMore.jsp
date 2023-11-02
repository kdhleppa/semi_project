<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/notice_readMore.css">
    <title>공지사항 글 자세히보기/(관리자 페이지)</title>
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
                	<a href="/link/noticeList">공지사항</a>
                </div>
            </div>
            <div class="content">
                <div class="menutitle">
                    공지사항
                </div>
                <div class="main-content">
                
                    <div class="main-content-left"></div>
                    <div class="main-content-main">
                        <div id="content-info">
                            <div>${current.managerNickname}</div>
                            <div>${current.noticeDate}</div>
                            <div>조회수 : ${current.noticeCount}</div>
                        </div>
                        <div id="content-title">${current.noticeTitle}</div>
                        
                        <div id="content-text">${current.noticeContent}
                        	<c:if test="${not empty current.imageList}">
                        		<br>
                        		<div class="img-box">		
                        			<c:set var="path"
					            	 	value="${current.imageList[0].imagePath}${current.imageList[0].imageReName}" />
				                    <img src="${path}" style="max-width: 300px; max-height: 300px;">   
                        		</div>
                        		<br>
                        	</c:if>
                        </div>
                        
                        <div id="content-listbutton">
                        
                        	<c:if test="${not empty prev}">
	                            <div id="previous">
	                                <button>∧</button>
	                                <div>이전글</div>
	                                <a href="/link/noticeReadMore/${prev.NOTICE_NO}">${prev.NOTICE_TITLE}</a>
	                            </div>
                        	</c:if>
                        	
                        	<c:if test="${not empty next}">
	                            <div id="next">
	                                <button>∨</button>
	                                <div>다음글</div>
	                                <a href="/link/noticeReadMore/${next.NOTICE_NO}">${next.NOTICE_TITLE}</a>
	                            </div>
                            </c:if>
                        </div>
                        
                        <c:if test="${loginMember.memberNo == current.managerNo}">
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
    
    
    <script src="/resources/js/notice_readMore.js"></script>     
    
</body>
</html>