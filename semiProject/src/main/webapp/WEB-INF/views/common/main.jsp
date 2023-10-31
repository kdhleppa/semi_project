<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="/resources/css/main_notLogin.css">
    <link rel="stylesheet" href="/resources/css/topbar_atag_black_style.css">
    
    
    <script src="https://kit.fontawesome.com/92fbd4b351.js" crossorigin="anonymous"></script>
   
</head>
<body>
    <div class="container">
        <nav>
            <section class="logo">
                <a href="http://192.168.120.16:5500/SemiDesign/main.html">
                    <img src="/resources/images/logo.png">
                </a>
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
                <div id="login">
                    <a href="/link/login">로그인</a>
                </div>
                <div id="signup">
                    <a href="/link/signUp">회원가입</a>
                </div>
            </section>
        </nav>

        <div class="mainsearch">
            <p>
                어떤 집을 찾으세요?
            </p>
            <section class="search-section">
                <form action="#" class="search-form">
                    <button class="fa-solid fa-magnifying-glass"></button> 
                    <input class="searchbox" type="search" placeholder="지역 또는 단지명을 입력하세요.">
                </form>
            </section>
        </div>

        <div class="banner">
            <a href="https://event.dabangapp.com/2023/08/absolut">
                <img id="bannerad" src="/resources/images/ban1.png">
            </a>
        </div>

        <div class="content">
            <div class="content-left"></div>
            <div class="content-center">
                <div class="content-center-top">
                    <div id="content1">
                        <div>
                            <img src="/resources/images/content-1.png" id="content1-img">
                        </div>                     
                        <div id="text-container">
                            안전한 직거래 방법!
                        </div>
                        <div id="text-container">
                            개인 간 연결을 통해<br>
                            전세, 월세를<br>
                            빠르게 거래하세요.
                        </div>
                    </div>
                    <div id="content2">
                        <div>
                            <img src="/resources/images/content-2.png" id="content2-img">
                        </div>                             
                        <div id="text-container">
                            원룸, 투룸(전,월세만)<br>
                            전문으로 다룹니다!
                        </div>
                        <div id="text-container">
                            생생한 매물 정보를<br>
                            지도로 한눈에 확인하세요.<br>
                            원룸, 투룸 직거래로<br>
                            시작부터 끝까지 함께 해주는<br>
                            꼬집을 만나보세요!
                        </div>
                    </div>
                    <div id="content3">
                        <div>
                            <img src="/resources/images/content-1.png" id="content1-img">
                        </div>                        
                        <div id="text-container">
                            제휴 중개사 안내
                        </div>
                        <div id="text-container">
                            제휴 중개사를 통해<br>
                            수수료는 다운, 안전은 업!<br>
                            계약 전반과정을 검토하고<br>
                            안내해드립니다.<br>
                            매물 상세페이지에서<br>
                            확인해보세요!
                        </div>
                    </div>
                </div>  
                <div class="content-center-bottom">
                    <a href="/link/safeDeal">
                        <button id="view-more">자세히 보기</button>
                    </a>
                </div>
            </div>
            <div class="content-right"></div>
        </div>

        <div class="bottom">
            <div class="bottom-left">
            </div>
            <div class="bottom-center">
                <div>
                    <a>회사소개</a> |
                    <a>이용 약관</a> |
                    <a>개인정보 처리방침</a> |
                    <a>매물관리규정</a>
                </div>
                <div>
                    (주) 꼬집<br>
                    주소 : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F<br>
                    Copyright © 1998-2023 KH Information Educational Institute All Right Reserved<br>
                </div>
            </div>
            <div class="bottom-right">
            </div>            
        </div>
    </div>    
   

	<%--<c:if test="${not empty message}">
    	<script>
    		// EL/JSTL 구문이 먼저 해석
    		// 문자열의 경우 따옴표가 없는 상태이니 옆에 붙여줘야함.
    	
    		alert('${message}') // ${message}
    	
    	
    	</script>
    	
    		session에 message를 추가하면
    		브라우저 종료 또는 만료 전까지 계속 메시지가 출력된다
    		
    		-> 1회 출력 후 session에서 message 삭제	
    	 
    	 <c:remove var="message" scope="session"/>
    	 
    </c:if>--%>
    
</body>
</html>