<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보수정</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sidebar_atag_black_style.css">
    <link rel="stylesheet" href="/resources/css/my_info.css">
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

            <form class="content" action="/link/myInfoUpdate" method="POST" name="myInfoUpdateFrm" id="updateInfo">
                <div class="title">
                    정보수정
                </div>

                <!-- 아이디 입력 -->
				
				<div class="myInfoUpdate-input-area">
                    <input type="text" name="memberId" id="memberId" maxlength="10" 
                    value="${loginMember.memberId}" readonly
                    >
                </div>

                <span class="myInfoUpdate-message" id="idMessage">한글,영어,숫자로만 2~10글자</span>
				
				
                <!-- 비밀번호/비밀번호 확인 입력 -->
                
                <div class="myInfoUpdate-input-area">
                    <input type="password" name="memberPw" id="memberPw" 
                    placeholder="비밀번호" maxlength="20" >
                </div>
                
                <div class="myInfoUpdate-input-area">
                    <input type="password" name="memberPwConfirm" id="memberPwConfirm" 
                    placeholder="비밀번호 확인" maxlength="20" >
                </div>

                <span class="myInfoUpdate-message" id="pwMessage">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span>
				
				<!-- 이름 입력 -->
				<div class="myInfoUpdate-input-area">
                    <input type="text" name="memberName" id="memberName" placeholder="이름" maxlength="20"
                    value="${loginMember.memberName}"
                    >
                </div>

                <span class="myInfoUpdate-message" id="nameMessage"></span>
				
                <!-- 닉네임 입력 -->
                
                <div class="myInfoUpdate-input-area">
                    <input type="text" name="memberNickname" id="memberNickname" placeholder="닉네임" maxlength="10" 
                    value="${loginMember.memberNickname}"
                    >
                </div>

                <span class="myInfoUpdate-message" id="nickMessage">한글,영어,숫자로만 2~10글자</span>


				<!-- 주소 입력 -->
                
                <div class="myInfoUpdate-input-area">
                    <input type="text" name="memberAddress" id="sample6_postcode" placeholder="우편번호" maxlength="10" >
                    
                    <button type="button" onclick="sample6_execDaumPostcode()">검색</button>
                </div>

                <div class="myInfoUpdate-input-area">
                    <input type="text" name="memberAddress" id="sample6_address" placeholder="도로명/지번 주소">
                </div>

                <div class="myInfoUpdate-input-area">
                    <input type="text" name="memberAddress" id="sample6_detailAddress" placeholder="상세 주소">
                </div>

				<br>
				<!-- 이메일 입력 -->
                
                <div class="myInfoUpdate-input-area">
                    <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일" maxlength="40"
                    value="${loginMember.memberEmail}"
                    >
                    
                    <button id="sendAuthKeyBtn" type="button">인증번호 받기</button>
                </div>

                <span class="myInfoUpdate-message" id="emailMessage">메일을 받을 수 있는 이메일을 입력해주세요</span>
                
                <!-- 인증번호 입력 -->

                <div class="myInfoUpdate-input-area">
                    <input type="text" name="authKey" id="authKey" placeholder="인증번호 입력" maxlength="6" autocomplete="off" >
                    
                    <button id="checkAuthKeyBtn" type="button">인증확인</button>
                </div>
                <span class="myInfoUpdate-message" id="authKeyMessage"></span>
                                <!-- 인증번호가 일치하지 않습니다 -->
				
                <!-- 전화번호 입력 -->
                
                <div class="myInfoUpdate-input-area">
                    <input type="text" name="memberPhoneNum" id="memberPhoneNum" placeholder="휴대폰 번호(- 없이 숫자만 입력)" maxlength="11"
                    value="${loginMember.memberPhoneNum}"
                    >
                </div>

                <span class="myInfoUpdate-message" id="phoneMessage"></span>

				
                <button id="btnbox" class="infoUpdate">수정 완료</button>

            </form>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = ''; // 주소 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
	
	
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
    
    <script src="/resources/js/myInfoUpdate.js"></script>
    
</body>
</html>