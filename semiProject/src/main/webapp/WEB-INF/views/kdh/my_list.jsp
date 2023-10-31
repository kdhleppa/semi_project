<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 매물 목록</title>
    <link rel="stylesheet" href="/resources/css/my_list.css">
    <link rel="stylesheet" href="/resources/css/topbar_atag_black_style.css">
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

                <div id="favorites">
                    <a href="/link/likeList">관심목록</a>
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

        <main id="main-container">
            <div id="main-left"></div>
            <div id="main-mid">
                  
               
             <c:choose>
             	<c:when test="${empty membersProduct}">
             		<h3>등록하신 물건이 없습니다.</h3>
             	</c:when>
             	<c:otherwise>
             		<c:forEach items="${membersProduct}" var="mp">
             			<div class="mid-favorite-container">
             				<a href="/productDetail/${mp.productNo}">
			                    <div class="mid-img-container">
			                        <img src="${mp.thumbnail}" alt="" class="mid-img">
			                    </div>
			                    <p>${mp.roomType}</p>
			                    <p class="value">${mp.productRentType}</p>
			                    <p>보증금 : ${mp.productDeposit}만원</p>
			                    <c:if test="${mp.productMonthlyRent} > 0">
			                    <p>월세 : ${mp.productMonthlyRent}</p> 
			                    </c:if>
			                    <p>${mp.roomSize}제곱미터, 관리비 ${mp.productMaintenace}만원</p>
		                     </a>
		                </div> 	
             		
             		</c:forEach>
             	</c:otherwise>
             
             
             </c:choose>
                
                
                
              
            </div>
            <div id="main-right">
                
                
            </div>






        </main>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb9b63d71a5408fd96cba9a1674b9d43&libraries=services,clusterer"></script>
        <script src="/resources/js/like_list.js"></script>
</body>
</html>