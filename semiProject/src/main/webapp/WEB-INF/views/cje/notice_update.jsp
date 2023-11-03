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
                	<a href="/link/myList">내가 올린 매물 목록</a>
                </div>
                <div>
                	<a href="/link/noticeList">공지사항</a>
                </div>
            </div>
            <div class="content">
                <div class="menutitle">
                    공지사항 수정
                </div>
                <div class="main-content">
                    <div class="main-content-left"></div>
                    
                    <form action="update" method="POST" 
                    	id="boardWriteFrm" class="boardUpdateFrm" enctype="multipart/form-data">
	                    <div class="main-content-main">
	                        <input id="content-title" value="${notice.noticeTitle}" name="noticeTitle"></input>
	                        
	                        <div class="boardImg" items="${notice.imageList}" var="img">
			                    <label>
			                        <img class="preview" src="${notice.imageList[0].imagePath}${notice.imageList[0].imageReName}" style="max-width: 300px; max-height: 300px;">
			                    </label>
			                    <input type="file" class="inputImage" id="imageInput" name="noticeImage" style="display:none;" accept="image/*">
			                    <span class="delete-image">&times;</span>
		                    	<button type="button" id="imageButton">이미지</button>
			                </div>
			                
	                        <input id="content-text" name="noticeContent" value="${notice.noticeContent}"></input>                        
	                        
	                        <div id="content-modifybutton">
	                        	<button type="submit" id="registerButton">등록하기</button>
	                            <button type="button" id="cancelButton" onClick="history.back(); return false;">취소</button>
	                        </div>
	                        
	                        <!-- 기존 이미지가 있다가 삭제된 이미지의 순서를 기록-->
				            <input type="hidden" name="deleteImage" value="">
				
				            <%-- 수정 성공 시 주소(쿼리스트링) 유지용도 --%>
				            <input type="hidden" name="cp" value="${param.cp}">	                        
	                    </div>
	                </form>        
                    
                    <div class="main-content-right"></div> 
                </div>
            </div>
            <div class="right">
                <button id="bottom-nav-list">
                	<a href="/link/noticeList">목록</a>
                </button>
                <c:if test="${not empty loginMember}" >
		           <div id="chattingicon">
		               <a href="/chatting">
		                  <img src="/resources/images/chat_icon.png" id="chat-icon">
		              </a>
		           </div>
		        </c:if>
            </div>
        </main>
    </div>
    
    <c:if test="${not empty message}">
	    <script>
			alert('${message}')
		</script>
	</c:if>
    
    <script src="/resources/js/noticeUpdate.js"></script>
</body>
</html>