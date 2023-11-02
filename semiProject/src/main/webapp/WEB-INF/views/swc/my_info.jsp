<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보조회</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/my_info.css">
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
                    <a href="/link/roomUp">방내놓기</a>
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
                   <a href="/link/myList">내가 올린 매물</a>
                </div>
                
                <div>
                   <a href="/link/noticeList">공지사항</a>
                </div>
                
            </div>

                
				<form class= "content" action="/link/myInfo" method="POST" name="myInfoFrm" id="profileFrm" enctype="multipart/form-data">
				
				<div class="title">
                    내 정보
                </div>

				<div style="font-size: 25px; margin-right: 300px;">
                    프로필 사진 등록
                </div>

                <div class="profile-image-area">
                    
                    	<%-- 프로필 이미지가 없으면 기본 이미지 --%>
						<c:if test="${empty loginMember.profileImage}">
	                        <img style="width: 100px;" src="/resources/images/user.png" id="profileImage">
						</c:if>
						
						<%-- 프로필 이미지가 있으면 저장된 이미지 --%>
						<c:if test="${not empty loginMember.profileImage}">
	                        <img style="width: 100px;" src="${loginMember.profileImage}" id="profileImage">
						</c:if>
						
						<span style="margin-left: 10px; margin-bottom: 100px;" id="deleteImage">x</span>
                </div>
                    
                
                <div class="profile-btn-area">
                        <label for="imageInput"></label>
                        <input style="margin-left: 10px; background-color: white;" type="file" name="profileImage" id="imageInput" accept="image/*">
                        <button>변경하기</button>
                    </div>
                
                <div class="myInfo-row">
                        <label>이메일 : </label>
                        <input type="text" name="memberEmail"  maxlength="20"
                        	value="${loginMember.memberEmail}" id="memberEmail" readonly
                        >
                </div>

                <div class="myInfo-row">
                        <label>닉네임 : </label>
                        <input type="text" name="memberNickname"  maxlength="10"
                        	value="${loginMember.memberNickname}" id="memberNickname" readonly
                        >
                </div>

                <div class="myInfo-row">
                        <label>휴대폰 : </label>
                        <input type="text" name="memberPhoneNum"  maxlength="11"
                        	value="${loginMember.memberPhoneNum}" id="memberPhoneNum" readonly
                        >
                </div>

                <br>

                <a href="/link/withdrawal" style="margin-top: 40px; text-decoration: none;">회원탈퇴</a>
                
            </form>

            <div class="rightmenu">
                <%-- 로그인 했을 때 채팅 보여짐 --%>
				<c:if test="${not empty loginMember}" >
				   <div id="chattingicon">
				       <a href="/chatting">
				          <img src="/resources/images/chat_icon.png" id="chat-icon">
				      </a>
				   </div>
				</c:if>
            </div>
                    
        </div>

    </div>
    
    <c:if test="${not empty message}">
	
	<script>
		
		alert('${message}') // ${message}
	</script>
	</c:if>
    	

   	
    <script src="/resources/js/myInfo.js"></script>
    
</body>
</html>