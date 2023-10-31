<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="products" value="${products}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Map Main</title>
    <link rel="stylesheet" href="/resources/css/map_main.css">
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">

    <script src="https://kit.fontawesome.com/75b9a966ac.js" crossorigin="anonymous"></script>
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
            <%-- 각 글씨에 링크 걸것 --%>
            <section class="menu">

                
                <div id="board">
                    <a href="/link/login">로그인</a>
                </div>
                <div id="mypage">
                    <a href="/link/signUp">회원가입</a>
                </div>

            </section>
        </nav>

       <div class="mid-top">
            <div id="mid-top-left">
                <i class="fa-solid fa-magnifying-glass" id="icon1"></i>&nbsp;
                <input type="text" id="input-adress" placeholder="검색할 지역이나 주소를 입력해 주세요">
                <button id="adress-btn">검색</button>
                <%-- 폼테그 제출하면 연결되게끔 할것 --%>
            </div>
            <div id="mid-top-right">
                <form id="option" action="/link/getProducts" method="get" onsubmit="return handleFormSubmit(event)">
                    <select name="roomType" id="">
                        <option class="optionsize" value="all" selected>원룸, 투룸</option>
                        <option class="optionsize" value="원룸">원룸</option>
                        <option class="optionsize" value="투룸">투룸</option>
                        
                    </select>

                    <select name="productRentType" id=""  onchange="showFields(this)">
                        <option value="all" selected>전세, 월세</option>
                        <option value="전세" >전세</option>
                        <option value="월세" >월세</option>

                    </select>
                    <label for="productDeposit" id="depositLabel">보증금&nbsp</label>
					    <input type="text" name="productDeposit" id="productDeposit" placeholder="보증금~까지"/><span id="depositWon">&nbsp만원&nbsp&nbsp&nbsp&nbsp</span>
                    <label for="productMonthlyRent" id="monthlyRentLabel">월세&nbsp</label>
					    <input type="text" name="productMonthlyRent" id="productMonthlyRent" placeholder="월세~까지"/><span id="rentWon" >&nbsp만원</span>
                    <button id="optionbtn" type="submit">검색</button>
			


                </form>
            </div>
        </div>

        <div class="main">
            <div id="main-left">
            </div>
                
               <div id="main-right"></div> 
            
            
            
        </div>

        
        

        
        
    </div>

    


    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb9b63d71a5408fd96cba9a1674b9d43&libraries=services,clusterer"></script>
    <script src="/resources/js/map_main.js"></script>
</body>
</html>