<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/sign_up.css">
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

                <div id="login">
                    <a href="/link/login">로그인</a>
                </div>

            </section>
        </nav>

        <div class="mainpart">
            <div class="leftmenu">
                
            </div>

            <form class="content" action="/link/signUp" method="POST" name="signUpFrm" id="signUpFrm">
            
                <div class="title">
                    회원가입
                </div>

                <section class="termssection">
                    <h3>서비스 이용 약관</h3><br>
                    <p>이 서비스 이용 약관은 꼬집 부동산 웹사이트의 이용 조건을 규정합니다. 꼬집 부동산 웹사이트를 이용하기 전에 아래의 약관을 주의 깊게 읽어주시기 바랍니다.</p><br>

                        <div class="terms">
                            <h4>제1조 (약관의 목적)</h4>
                            <p>이 약관은 꼬집 부동산 웹사이트의 서비스를 제공함에 있어, 웹사이트와 이용자 간의 권리와 의무, 책임사항 및 기타 필요한 사항을 규정하는 것을 목적으로 합니다.</p>
                        </div>

                        <div class="terms">
                            <h4>제2조 (약관의 효력과 변경)</h4>
                            <p>1. 이 약관은 웹사이트에 게시함으로써 효력을 발생합니다.</p>
                            <p>2. 꼬집 부동산은 이용자에게 사전 고지 없이 이 약관을 변경할 수 있으며, 변경된 약관은 웹사이트에 게시함으로써 효력을 발생합니다.</p>
                        </div>

                        <div class="terms">
                            <h4>제3조 (분쟁의 해결)</h4>
                            <p>이 약관에 따른 분쟁에 대해서는 관련 법률과 규정에 따라 해결합니다.</p>
                        </div> 

                        <div class="terms">
                            <p>본 약관을 동의하시면, 꼬집 부동산 웹사이트의 서비스를 이용할 수 있습니다.</p>
                        </div>
                        <br>

                        <div class="terms">
                            <input type="checkbox" id="agree" name="agree" required>
                            <label for="agree">위의 약관에 동의합니다.</label><br>
                        </div>
                        <br>
                </section>
				
				<!-- 아이디 입력 -->
				
				<div class="signUp-input-area">
                    <input type="text" name="memberId" id="memberId" placeholder="아이디" maxlength="10" >
                </div>

                <span class="signUp-message" id="idMessage">한글,영어,숫자로만 2~10글자</span>
				
				
                <!-- 비밀번호/비밀번호 확인 입력 -->
                
                <div class="signUp-input-area">
                    <input type="password" name="memberPw" id="memberPw" 
                    placeholder="비밀번호" maxlength="20" >
                </div>
                
                <div class="signUp-input-area">
                    <input type="password" name="memberPwConfirm" id="memberPwConfirm" 
                    placeholder="비밀번호 확인" maxlength="20" >
                </div>

                <span class="signUp-message" id="pwMessage">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span>
				
				<!-- 이름 입력 -->
				<div class="signUp-input-area">
                    <input type="text" name="memberName" id="memberName" placeholder="이름" maxlength="20" >
                </div>

                <span class="signUp-message" id="nameMessage"></span>
				
                <!-- 닉네임 입력 -->
                
                <div class="signUp-input-area">
                    <input type="text" name="memberNickname" id="memberNickname" placeholder="닉네임" maxlength="10" >
                </div>

                <span class="signUp-message" id="nickMessage">한글,영어,숫자로만 2~10글자</span>


				<!-- 주소 입력 -->
                
                <div class="signUp-input-area">
                    <input type="text" name="memberAddress" id="sample6_postcode" placeholder="우편번호" maxlength="10">
                    
                    <button type="button" onclick="sample6_execDaumPostcode()">검색</button>
                </div>

                <div class="signUp-input-area">
                    <input type="text" name="memberAddress" id="sample6_address" placeholder="도로명/지번 주소">
                </div>

                <div class="signUp-input-area">
                    <input type="text" name="memberAddress" id="sample6_detailAddress" placeholder="상세 주소">
                </div>

				<br>
				
				<!-- 이메일 입력 -->
                
                <div class="signUp-input-area">
                    <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일" maxlength="40">
                    
                    <button id="sendAuthKeyBtn" type="button">인증번호 받기</button>
                </div>

                <span class="signUp-message" id="emailMessage">메일을 받을 수 있는 이메일을 입력해주세요</span>
                
                <!-- 인증번호 입력 -->

                <div class="signUp-input-area">
                    <input type="text" name="authKey" id="authKey" placeholder="인증번호 입력" maxlength="6" autocomplete="off" >
                    
                    <button id="checkAuthKeyBtn" type="button">인증확인</button>
                </div>
                <span class="signUp-message" id="authKeyMessage"></span>
                                <!-- 인증번호가 일치하지 않습니다 -->
				
                <!-- 전화번호 입력 -->
                
                <div class="signUp-input-area">
                    <input type="text" name="memberPhoneNum" id="memberPhoneNum" placeholder="휴대폰 번호(- 없이 숫자만 입력)" maxlength="11">
                </div>

                <span class="signUp-message" id="phoneMessage"></span>


                <button id="btnbox" class="signUpEnd">가입완료</a> </button>

                
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
	
    
    <script src="/resources/js/signUp.js"></script>
    
</body>
</html>