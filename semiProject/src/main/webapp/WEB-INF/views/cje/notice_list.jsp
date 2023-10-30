<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}" />
<c:set var="noticeList" value="${map.noticeList}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/notice_list.css">
    <title>공지사항 리스트</title>    
</head>
<body>
	<div class="container">
        <nav>
            <section class="logo">
                <a href="/link/mainLogin">
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
                	<a href="/link/noticeList">공지사항</a>
                </div>
            </div>
            <div class="content">
                <div class="menutitle">
                    공지사항
                </div>
                <div class="main-content">
                    <c:choose>					
						<%-- 조회된 게시글 목록이 비어있거나 null인 경우 --%>
						<c:when test="${empty noticeList}">
							<tr>
								<th colspan="6">게시글이 존재하지 않습니다.</th>
							</tr>
						</c:when>
						
						<c:otherwise>
							<div class="main-content-title">
								<div id="content-number-title">번호</div>
								<div id="content-writer-title">글쓴이</div>
								<div id="content-title-title">제목</div>
								<div id="content-date-title">등록일</div>
								<div id="content-hits-title">조회</div>
							</div>
							
							<div class="main-content-content">
								<c:forEach items="${noticeList}" var="notice" >
									<div class="main-content-real">
										<div id="content-number">${notice.noticeNo}</div>
										<div id="content-writer">${notice.managerNickname}</div>
										<a href="/link/noticeReadMore/${notice.noticeNo}" id="content-title">${notice.noticeTitle}</a>
										<div id="content-date">${notice.noticeDate}</div>
										<div id="content-count">${notice.noticeCount}</div>
									</div>
								</c:forEach>
							</div>
						</c:otherwise>						
					</c:choose>
					
					<div class="main-content-bottom">
						<form action="/link/boardList" method="get" id="boardSearch">
							<div class="search">
			                    <select name="key" id="search-type">
			                        <option value="t">제목</option>
					                <option value="c">내용</option>
					                <option value="tc">제목+내용</option>
					                <option value="w">작성자</option>
			                    </select>
			                    <input type="text" name="query" id="search-word" placeholder="검색어를 입력해주세요.">
			                </div>
						</form>
                    	<c:if test="${loginMember.managerFl == 'Y'}">
		                    <button id="writing">글쓰기</button>
	                    </c:if>
					</div>
                </div>

                <c:if test="${not empty param.key}">
					<c:set var="kq" value="&key=${param.key}&query=${param.query}" />
				</c:if>
               	
                <div class="pagination-area">
                    <ul class="pagination">
               
	                    <!-- 첫 페이지로 이동 -->
	                    <li><a href="/link/noticeList?cp=1${kq}">&lt;&lt;</a></li>
	
	                    <!-- 이전 목록 마지막 번호로 이동 -->
	                    <li><a href="/link/noticeList?cp=${pagination.prevPage}${kq}">&lt;</a></li>
	
						
	                    <!-- 특정 페이지로 이동 -->
	                    <c:forEach var ="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
	                    	<c:choose>
	                    	
	                    		<%-- 현재 보고있는 페이지 --%>
	                    		<c:when test="${i == pagination.currentPage}">
	                    			<li><a class="current">${i}</a></li>
	                    		</c:when>
	                    		
	                    		<%-- 현재 페이지를 제외한 나머지 페이지 --%>	
	                    		<c:otherwise>
	                    			<li><a href="/link/noticeList?cp=${i}${kq}">${i}</a></li>
	                    		</c:otherwise>
	                    		
	                    	</c:choose>
	                    </c:forEach>
	                    
	                    <!-- 다음 목록 시작 번호로 이동 -->
	                    <li><a href="/link/noticeList?cp=${pagination.nextPage}${kq}">&gt;</a></li>
	
	                    <!-- 끝 페이지로 이동 -->
	                    <li><a href="/link/noticeList?cp=${pagination.maxPage}${kq}">&gt;&gt;</a></li>
	
	                </ul>
                </div>
                
            </div>
            <div class="right">
                <img src="/resources/images/chat_icon.png" id="chat-icon">
            </div>
        </main>
    </div>
    
    
    <script src="/resources/js/notice_list.js"></script>
    
</body>
</html>