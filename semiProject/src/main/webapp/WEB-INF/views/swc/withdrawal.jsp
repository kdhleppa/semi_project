<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/withdrawal.css">
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
                    <a href="/link/mapMainLogin">지도</a>
                </div>

                <div id="roomup">
                    <a href="/link/roomUpFront">방내놓기</a>
                </div>

                <div id="myInfo">
                    <a href="/link/myInfo">내 정보</a>
                </div>

            </section>
        </nav>

        <div class="mainpart">
            <div class="leftmenu">
                
                <div>
                   <a href="/link/myInfoUpdate">정보수정</a>
                </div>
                
                <div>
                   <a href="/link/oneOnOneListUser">1:1 문의 내역</a>
                </div>
                
                <div>
                   <a href="/link/roomDetailView">내가 올린 매물</a>
                </div>
                
                <div>
                   <a href="/link/declarationList">허위매물 신고내역</a>
                </div>
                
                <div>
                   <a href="/link/noticeList">공지사항</a>
                </div>

            </div>

            <form class="content" action="/link/withdrawal" method="POST" name="withdrawalFrm">
                 
                <div class="title">
                    회원탈퇴
                </div>

                <br><br><br>
                

                <div class="delguide">
                    <p style="font-size: 19px; color: blue;">회원탈퇴를 신청하기 전에 아래 안내 사항을 한번 더 확인해주세요.</p><br>
                    <ul>
                        <li>1. 회원 탈퇴 시, 현재 로그인된 아이디는 즉시 탈퇴 처리됩니다.</li>
                        <li>2. 회원 탈퇴 시, 회원 전용 웹 서비스 이용이 불가합니다.</li>
                        <li>3. 탈퇴 시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이 모두 삭제됩니다.</li>
                        <li>4. 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</li>
                        <li>5. 광고를 위한 매물이 등록되어 있을 경우, 탈퇴 시 모든 정보는 삭제 처리됩니다.</li>
                    </ul>
                </div>

                <br><br><br>
                
                <div class="pwCheck">
                        <label>비밀번호 입력</label>
                        <input type="password" name="memberPw" id="memberPw" maxlength="30">              
                </div>
                
                <br><br><br>

                <div>
                    <select class="delreason" id="menu" name="menu" required style="margin-top: -30px; font-size: 30px; width: 680px; height: 70px;">
                        <option value="" disabled selected>탈퇴 사유를 선택해주세요</option>
                        <option value="unuse">자주 사용하지 않아요</option>
                        <option value="duplicate">중복 계정이 있어요</option>
                        <option value="apperror">앱 오류가 있어요</option>
                        <option value="other">기타</option>
                    </select>
                </div>

                <div>
                    <textarea style="margin-top: 70px; font-size: 20px; width: 680px; height: 300px;">기타 사유가 있다면 입력해주세요.</textarea>
                </div>

                <div style="margin-top: 20px;">
                    <input type="checkbox" id="agree" name="agree" required>
                    <label for="agree">&nbsp;&nbsp;안내 사항을 모두 확인하였으며, 이에 동의합니다.</label><br>
                </div>

                <button id="btnbox" class="withdrawalBtn">탈퇴 완료</button>
            
            </form>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
    
    <c:if test="${not empty message}">
	
	<script>
		
		alert('${message}') // ${message}
	</script>
	</c:if>
	
	<%-- 로그인 했을 때 채팅 보여짐 --%>
    <c:if test="${not empty loginMember}" >
       	<div id="chattingicon">
            <a href="/chatting">
            	<img src="/resources/images/채팅아이콘.png">
        	</a>
       	</div>
   	</c:if>
   	
   	
   	<script src="/resources/js/chatting/withdrawal.js"></script>
    
</body>
</html>