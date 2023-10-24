<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
	<link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
	<link rel="stylesheet" href="/resources/css/board_list.css">
	<title>자유게시판 리스트</title>
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
					<c:choose>
					
						<%-- 조회된 게시글 목록이 비어있거나 null인 경우 --%>
						<c:when test="${empty boardList}">
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
								<c:forEach items="${boardList}" var="board" >
									<div class="main-content-real">
										<div id="content-number">${board.boardNo}</div>
										<div id="content-writer">${board.memberNickname}</div>
										<a href="/link/boardReadMoreMine/${board.boardNo}" id="content-title">${board.boardTitle}</a>
										<div id="content-date">${board.boardDate}</div>
										<div id="content-count">${board.boardCount}</div>
									</div>
								</c:forEach>
							</div>
							
							<div class="search">
			                    <select id="search-type">
			                        <option value="search-title">제목</option>
			                        <option value="search-content">내용</option>
			                    </select>
			                    <input id="search-word" placeholder="검색어를 입력해주세요.">
		                    	<c:if test="${not empty loginMember}">
				                    <button id="writing">글쓰기</button>
			                    </c:if>
			                </div>
						</c:otherwise>						
					</c:choose>
                </div>
               	<div class="pagination-area">
                    <ul class="pagination">
               
	                    <!-- 첫 페이지로 이동 -->
	                    <li><a href="/link/boardList?cp=1">&lt;&lt;</a></li>
	
	                    <!-- 이전 목록 마지막 번호로 이동 -->
	                    <li><a href="/link/boardList?cp=${pagination.prevPage}">&lt;</a></li>
	
						
	                    <!-- 특정 페이지로 이동 -->
	                    <c:forEach var ="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
	                    	<c:choose>
	                    	
	                    		<%-- 현재 보고있는 페이지 --%>
	                    		<c:when test="${i == pagination.currentPage}">
	                    			<li><a class="current">${i}</a></li>
	                    		</c:when>
	                    		
	                    		<%-- 현재 페이지를 제외한 나머지 페이지 --%>	
	                    		<c:otherwise>
	                    			<li><a href="/link/boardList?cp=${i}">${i}</a></li>
	                    		</c:otherwise>
	                    		
	                    	</c:choose>
	                    </c:forEach>
	                    
	                    <!-- 다음 목록 시작 번호로 이동 -->
	                    <li><a href="/link/boardList?cp=${pagination.nextPage}">&gt;</a></li>
	
	                    <!-- 끝 페이지로 이동 -->
	                    <li><a href="/link/boardList?cp=${pagination.maxPage}">&gt;&gt;</a></li>
	
	                </ul>
                </div>
                
            </div>
            <div class="right">
                <img src="/resources/images/chat_icon.png" id="chat-icon">
            </div>
        </main>
    </div>
    
    
    <script src="/resources/js/board_list.js"></script>
        
</body>
</html>