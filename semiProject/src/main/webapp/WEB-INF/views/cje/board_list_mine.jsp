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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            	<a href="/link/boardListMine">내가 쓴 글</a>
            </div>
            
            <div class="content">
                <div class="menutitle">
                    내가 쓴 글 목록
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
								<div id="checkbox-all-div"><input type="checkbox" id="checkbox-all" class="checkbox-all"></div>
								<div id="content-number-title">번호</div>
								<div id="content-title-title">제목</div>
								<div id="content-date-title">등록일</div>
							</div>
							
							<div class="main-content-content">
								<c:forEach items="${boardList}" var="board" >
									<div class="main-content-real">
										<div id="checkbox-title-div"><input type="checkbox" id="checkbox-title" class="checkbox-title" value="${board.boardNo}"></div>
										<div id="content-number">${board.boardNo}</div>
				            			<a href="/link/boardReadMore/${board.boardNo}" id="content-title">${board.boardTitle}</a>
				            			<div id="content-date">${board.boardDate}</div>
									</div>
								</c:forEach>
							</div>
						</c:otherwise>
											
					</c:choose>
					
					<script>
						$('.checkbox-all').change(function(){
							const allCheck = $(this);
							const allChecked = allCheck.prop('checked');

							$('.checkbox-title').prop('checked', allChecked);
						})

						$('.checkbox-title').change(function(){
							const checkboxCount = $('.checkbox-title').length;
							const checkboxCheckedCount = $('.checkbox-title:checked').length;
							const allChecked = checkboxCount == checkboxCheckedCount;

							$('.checkbox-all').prop('checked', allChecked);
						})
					</script>
					
                </div>
                <div class="main-content-bottom">
                    <button class="delete-btn">선택삭제</button>
                </div>

				<form method="post" name="do-delete-form" action="doDeleteBoards">
					<input type="hidden" name="numbers" value="" />
				</form>

				<script>
					$('.delete-btn').click(function(){
						const values = $('#checkbox-title:checked').map((index, el) => el.value).toArray();

						if(values.length == 0){ // 선택사항이 없을 경우
							alert('선택한 게시글이 없습니다');
							return;
						}
						if(confirm('선택한 게시글을 삭제하시겠습니까?') == false){
							return;
						}
						$('input[name=numbers]').val(values.join(','))
						$('form[name=do-delete-form]').submit();
					})
				</script>

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
	
	
</body>
</html>