<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매물 상세정보</title>
    <link rel="stylesheet" href="/resources/css/room_detail_view.css">
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
           
            <section class="menu">
				
				<c:choose>
                  <c:when test="${loginMember != null}">
                     <div id="map">
                     	<a href="/link/mapMainLogin">지도</a>
                     </div>
                  </c:when>
						                  	
                  <c:when test="${loginMember == null}">
                     <div id="map">
                     	<a href="/link/mapMainNotLogin">지도</a>
                     </div>
                  </c:when>
               </c:choose> 
				<c:choose>
					<c:when test="${loginMember != null}">                
	                <div id="roomup">
	                    <a href="/link/roomUp">방내놓기</a>
	                </div>
	
	                <div id="board">
	                    <a href="/link/boardList">게시판</a>
	                </div>
	                <div id="mypage">
	                    <a href="/link/myInfo">내정보</a>
	                </div>
	                </c:when>
	                <c:otherwise>
		                <div id="board">
		                    <a href="/link/login">로그인</a>
		                </div>
		                <div id="mypage">
		                    <a href="/link/signUp">회원가입</a>
		                </div>
	                </c:otherwise>
				</c:choose>
            </section>
        </nav>

        <main id="main-container">
            <div id="main-left"></div>
            <div id="main-mid">
                <div id="img-container">
                    <div id="img1" class="img">
                        <img src="${sProduct.imageList[0].imgPath}${sProduct.imageList[0].imgRename}" alt="">
                    </div>
                    <div id="img-2and3" class="imgall">
                        <div id="img2" class="img upside">
                            <img src="${sProduct.imageList[1].imgPath}${sProduct.imageList[1].imgRename}" alt="">
                        </div>
                        <div id="img3" class="img">
                            <img src="${sProduct.imageList[2].imgPath}${sProduct.imageList[2].imgRename}" alt="">
                        </div>
                    </div>
                    <div id="img-4and5" class="imgall">
                        <div id="img4" class="img upside">
                            <img src="${sProduct.imageList[3].imgPath}${sProduct.imageList[3].imgRename}" alt="">
                        </div>
                        <div id="img5" class="img">
                            <img src="${sProduct.imageList[4].imgPath}${sProduct.imageList[4].imgRename}" alt="">
                        </div>
                    </div>
                </div>
                <div>
                    <div class="info" id="inbox">
                        <div class = "table-container">
                        <p>가격정보</p>
                        <p>&nbsp;</p>
                        <table id="table">
                            <tr>
                                <td>${sProduct.productRentType}</td>
                                <td>보증금 : ${sProduct.productDeposit}만원
                                <c:if test="${sProduct.productMonthlyRent > 0}"><br>
                                월차임 : ${sProduct.productMonthlyRent}만원
                                </c:if>
                                
                                </td>
                            </tr>
                            <tr>
                                <td>관리비</td>
                                <td>${sProduct.productMaintenace}</td>
                            </tr>
                            <tr>
                                <td>방크기</td>
                                <td>${sProduct.roomSize}㎡</td>
                            </tr>
                            <tr>
                                <td>주차여부</td>
                                <td>
                                <c:choose>
                                	<c:when test="${sProduct.parking == 'Y'}">
                                	가능
                                	</c:when>
                                	<c:otherwise>
                                	불가능
                                	</c:otherwise>
                                </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <td>룸타입</td>
                                <td>${sProduct.roomType}</td>
                            </tr>
                            <tr>
                                <td>난방타입</td>
                                <td>${sProduct.heatType}</td>
                            </tr>
                            <tr>
                                <td>입주가능일</td>
                                <td>
	                                <c:choose>
									    <c:when test="${sProduct.enterDate <= currentDate}">
									        즉시입주가능
									    </c:when>
									    <c:otherwise>
									        ${sProduct.enterDate}
									        <br>
									        <c:choose>
									        <c:when test="${sProduct.enterDateNego == 'Y'}">
									        입주협의가능
									        </c:when>
									        <c:otherwise>
									        입주협의불가
									        </c:otherwise>
									        </c:choose>
									    </c:otherwise>
									</c:choose>
                                </td>
                            </tr>
                        </table>
                        </div>
                        <div id="mapin">맵 위치</div>
                        
                    </div>
                </div>
                <div class="info">
                    <p>상세정보</p>
                    <div id="icon">
						
                        <c:if test="${fn:contains(sProduct.airCon, 'Y')}">
                        <img class="iconimg" src="/resources/images/optionicon/air-conditioner.png" alt="에어컨">
                        </c:if>
                        <c:if test="${fn:contains(sProduct.fridge, 'Y')}">
                        <img class="iconimg" src="/resources/images/optionicon/refrigerator.png" alt="냉장고">
                        </c:if>
                        <c:if test="${fn:contains(sProduct.washer, 'Y')}">
                        <img class="iconimg" src="/resources/images/optionicon/laundry.png" alt="세탁기">
                        </c:if>
                        <c:if test="${fn:contains(sProduct.cctv, 'Y')}">
                        <img class="iconimg" src="/resources/images/optionicon/laundry.png" alt="CCTV">
                        </c:if>
                        <c:if test="${fn:contains(sProduct.doorlock, 'Y')}">
                        <img class="iconimg" src="/resources/images/optionicon/doorlock.png" alt="도어락">
                        </c:if>
                        <c:if test="${fn:contains(sProduct.stove, 'Y')}">
                        <img class="iconimg" src="/resources/images/optionicon/induction-stove.png" alt="인덕션">
                        </c:if>
                        <c:if test="${fn:contains(sProduct.microwave, 'Y')}">
                        <img class="iconimg" src="/resources/images/optionicon/microwave.png" alt="전자레인지">
                        </c:if>
                        <c:if test="${fn:contains(sProduct.elevator, 'Y')}">
                        <img class="iconimg" src="/resources/images/optionicon/elevator.png" alt="엘레베이터">
                        </c:if>
                                                
                    </div>

                </div>
                <div class="detail-container">
                    <div class="detail-header">${sProduct.productTitle}</div>
                    <textarea rows="20" cols="157" readonly>${sProduct.productContent}</textarea>
                    
                </div>
                <div id= "nowLogin">
                <c:if test="${loginMember.memberNo == sProduct.memberNo}">
	                <button id="modifyBtn">수정</button>
	                <button id="deleteBtn">삭제</button>
                </c:if>
                <c:if test="${loginMember == null}">
                	<br><br><br><br>
                </c:if>
                </div>
                
            </div>
            <div id="main-right">
                <div class="right-btn-container">
                    <c:choose>
                    	<c:when test="${loginMember != null}">
		                    <a href="/chatting">
		                    	<div class="right-btn rb1"><img src="/resources/images/chat.png" class="right-icon">채팅으로 문의하기</div>
		                    </a>
		                    <div class="right-btn">닉네임 : ${productsNickName}</div>
                    	</c:when>
                    	<c:otherwise>
                    		<a href="/link/login" onclick="confirmLink()">
		                    	<div class="right-btn rb1"><img src="/resources/images/chat.png" class="right-icon">채팅으로 문의하기</div>
		                    </a>
		                    <div class="right-btn">닉네임 : ${productsNickName}</div>
                    	</c:otherwise>
                    </c:choose>
                </div>
                <p id="linkname">매물근처 제휴 중개사보기</p>
                <div class="right-link-container">
                    <div class="right-link">
                        <div>
                            <p>OK공인중개사사무소</p>
                            <p class="linkp"><img src="/resources/images/person.png" alt="">조지은</p>
                            <p class="linkp"><img src="/resources/images/telephone.png" alt="">02-853-3233</p>
                            <p class="linkp"><img src="/resources/images/home.png" alt="">빌라/원룸</p>
                            <p class="linkp"><img src="/resources/images/medal.png" alt="">등록번호 11545-2022-00058</p>
                            <p class="linkp"><img src="/resources/images/maps.png" alt="">서울특별시 금천구 남부순환로108길 20 1층 일부(가산동)</p>
                        </div>
                        <div id="map2"></div>
                    </div>
                    <div class="right-link">
                        <div>
                            <p>캐슬공인중개사사무소</p>
                            <p class="linkp"><img src="/resources/images/person.png" alt="">정세민</p>
                            <p class="linkp"><img src="/resources/images/telephone.png" alt="">02-883-9821</p>
                            <p class="linkp"><img src="/resources/images/home.png" alt="">빌라/원룸</p>
                            <p class="linkp"><img src="/resources/images/medal.png" alt="">등록번호 11620-2015-00168</p>
                            <p class="linkp"><img src="/resources/images/maps.png" alt="">서울특별시 관악구 행운1마길 20 2층201호(봉천동)</p>
                        </div>
                        <div id="map3"></div>
                    </div>
                    
                    
                </div>
            </div>





        </main>
		<c:if test="${not empty loginMember}" >
		   <div id="chattingicon">
		       <a href="/chatting">
		          <img src="/resources/images/chat_icon.png" id="chat-icon">
		      </a>
		   </div>
		</c:if>
        
        	 <c:if test="${not empty message}">
    			<script>
    		    	
    			alert('${message}') // ${message}
    	
    	</script>
    		</c:if>
        <script>
        const nowAddress = "${sProduct.productAddress}";
		
		</script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb9b63d71a5408fd96cba9a1674b9d43&libraries=services,clusterer"></script>
        <script src="/resources/js/room_detail_view.js"></script>
        
</body>
</html>