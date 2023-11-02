<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호수정</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/new_password.css">
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

            </section>
        </nav>

        <div class="mainpart">
            <div class="leftmenu">
                
            </div>
            
            <form class="content" action="/link/newPassword" method="POST" name="newPwFrm" id="newPwFrm"> 

                <div class="title" style="font-weight: 500; margin-bottom: 40px;">
                    <div id="findId">
                        <a href="/link/findId" style="text-decoration: none;">아이디 찾기</a>
                    </div>
                    

                    <div id="findPw" style="margin-left: 70px;">
                        <a href="/link/findPassword" style="font-weight: 1000; text-decoration: none;">비밀번호 찾기</a>
                    </div>
                </div>

                <!-- 새 비밀번호/비밀번호 확인 입력 -->
                
                <div class="signUp-input-area">
                    <input type="password" name="newMemberPw" id="newMemberPw" 
                    placeholder="새 비밀번호" maxlength="20" >
                </div>
                
                <div class="signUp-input-area">
                    <input type="password" name="newMemberPwConfirm" id="newMemberPwConfirm" 
                    placeholder="새 비밀번호 확인" maxlength="20" >
                </div>

                <span class="signUp-message" id="pwMessage">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span>

				<input type="hidden" name="memberEmail" value="${member.memberEmail}">

                <button id="btnbox" style="color:white; text-decoration:none;">확인</a> </button>
                
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
	
	
	<script src="/resources/js/newPassword.js"></script>
	
</body>
</html>