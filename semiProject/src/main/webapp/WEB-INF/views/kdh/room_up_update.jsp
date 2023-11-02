<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매물 등록(수정페이지)</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/resources/css/room_up.css">
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

                   <div id="map">
                        <a href="/link/mapMainLogin">지도</a>
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

        
            <div id="title">

                <div id="top-title">

                방내놓기(수정)

                </div>

                <div id="mid-title">

                    아래 안내 사항을 한번 더 확인해주세요.

                </div>

                <div id="bottom-title">

                    원룸 투룸 전/ 월세 매물만 등록할 수 있습니다.<br>
                        1. 1개의 매물만 등록만 추천드리며, 꼬집에서 직거래로 표시됩니다.<br>
                        2. 주소를 다르게 입력할 경우 허위매물로 신고될 수 있으니 꼭 동일하게 입력 바랍니다. <br>
                        3. 등록한 매물은 30일 간 노출됩니다. <br>
                       

                </div>

            </div>

		<form action="update" method="POST" name="roomUpFrm" id= "roomUpFrm" enctype="multipart/form-data">    

            <div class="main">
            
                

            <div id="property-information">

                <h4>매물 정보</h4>

                <table class="tg1" >
                    <colgroup>
                    <col style="width: 264px">
                    <col style="width: 1003px">
                    </colgroup>

                <thead>
                    <tr>
                      <th class="tg1-0lax" >매물 주소</th>
                      <th class="tg1-0lax" id="productSerchBox">

                        주소 검색 <br>
						<div class="serchDiv">                       
                        <input type="text" name="productAddress" id="productAddress" placeholder="예) 번동 10-1, 강북구 번동" value="${product.productAddress}" readonly>
                        <button type="button" onclick="sample6_execDaumPostcode()" class="address-btn">주소검색</button>
                        <button type="button" id="adress-btn" class="address-btn">위치확인</button>
                        </div>
                        <input type="text" name="productAddressHo" id="productAddressHo" placeholder="예) 101호" value="${product.productAddressHo}">
						
						
                      </th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
                      <td class="tg1-0lax">방 타입</td>
                      <td class="tg1-0lax">
						<c:choose>
							<c:when test="${product.roomType == '원룸'}">
		                        <input type="radio"  name="roomType" value="원룸" checked> 원룸
		
		                        <input type="radio"  name="roomType" value="투룸"> 투룸
							
							</c:when>
							<c:otherwise>
		                        <input type="radio"  name="roomType" value="원룸"> 원룸
		
		                        <input type="radio"  name="roomType" value="투룸" checked> 투룸
							</c:otherwise>
						</c:choose>

                      </td>
                    </tr>
                    <tr>
                      <td class="tg1-0lax">매물 크기</td>
                      <td class="tg1-0lax">

                        <input type="text" name="roomSize" id="roomSize" value="${product.roomSize}">㎡

                      </td>
                    </tr>
                  </tbody>
                  </table>

            </div>
    		<div id="mapbox">123</div>
    		
            <div id="transaction-information">

                <h4>거래 정보 </h4>

                <table class="tg2">
                    <colgroup>
                    <col style="width: 264px">
                    <col style="width: 1003px">
                    </colgroup>

                <thead>
                    <tr>
                      <th class="tg2-0lax">거래 종류</th>
                      <th class="tg2-0lax">
						<c:choose>
							<c:when test="${product.productRentType == '전세'}">
		                        <input type="radio" name="productRentType" value="전세" onclick="showFields('전세')" checked> 전세
								<input type="radio" name="productRentType" value="월세" onclick="showFields('월세')"> 월세
							</c:when>
							<c:otherwise>
								<input type="radio" name="productRentType" value="전세" onclick="showFields('전세')"> 전세
								<input type="radio" name="productRentType" value="월세" onclick="showFields('월세')" checked> 월세
							</c:otherwise>
						</c:choose>
						
						
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="tg2-0lax">가격 정보</td>
                      <td class="tg2-0lax">
						<p id="rentTypeMessage">전세 또는 월세를 클릭해 주세요.</p>
                        <span style="display: flex;">
						<label for="productDeposit" id="depositLabel" >보증금&nbsp</label>
					    <input type="text" name="productDeposit" id="productDeposit" value="${product.productDeposit}"/><span id="depositWon">&nbsp만원</span>
					    </span>
					    <br>
						<span style="display: flex;">			    
					    <label for="productMonthlyRent" id="monthlyRentLabel">월세&nbsp&nbsp&nbsp&nbsp</label>
					    <c:choose>
					    	<c:when test="${product.productMonthlyRent > 0}">
					    		<input type="text" name="productMonthlyRent" id="productMonthlyRent" value="${product.productMonthlyRent}"/><span id="rentWon">만원</span>
					    	</c:when>
					    	<c:otherwise>
							    <input type="text" name="productMonthlyRent" id="productMonthlyRent" value="0"/><span id="rentWon">만원</span>
					    	</c:otherwise>
					    </c:choose>
					    </span>        
					     
                      </td>
                    </tr>
                    <tr>
                      <td class="tg2-0lax">공용관리비</td>
                      <td class="tg2-0lax">


                            <p>관리비</p>

                            <input type="int" name="productMaintenace" value="${product.productMaintenace}">만원

                      </td>
                    </tr>
                    <tr>
                        <td class="tg2-0lax">입주 가능 일자</td>
                        <td class="tg2-0lax"> 

							<c:choose>
								<c:when test="${product.enterDate <= currentDate}">
									<input type="radio" name="enterDate" id="immediateMoveIn" onclick="toggleInputVisibility()" checked value="Y"> 즉시 입주

		                            <input type="radio" name="enterDate" id="dateSelection" onclick="toggleInputVisibility()"> 일자 선택
		
		                            <input type="date" name="enterDateText" id="enterDateText" placeholder="예) 20210721" onchange="validateDate()" oninput="updateRadioValue()" style="display: none;">
								</c:when>
								<c:otherwise>
									<input type="radio" name="enterDate" id="immediateMoveIn" onclick="toggleInputVisibility()"> 즉시 입주

		                            <input type="radio" name="enterDate" id="dateSelection" onclick="toggleInputVisibility()" checked value="${product.enterDate}"> 일자 선택
		
		                            <input type="date" name="enterDateText" id="enterDateText" placeholder="예) 20210721" onchange="validateDate()" oninput="updateRadioValue()" style="display: none;" value="${product.enterDate}">
		
								
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${product.enterDateNego == 'Y'}">
		                            <input type="checkbox" name="enterDateNego" value="Y" checked> 협의 가능할 경우
								</c:when>
								<c:otherwise>
								    <input type="checkbox" name="enterDateNego" value="Y"> 협의 가능할 경우
								</c:otherwise>
							</c:choose>



                        </td>
                      </tr>
                  </tbody>
                  </table>

            </div>
    
            <div id="Facility-information">

                <h4>시설 정보 </h4>


                <table class="tg3">
                    <colgroup>
                    <col style="width: 264px">
                    <col style="width: 1003px">
                    </colgroup>

                <thead>
                    <tr>
                        <td class="tg3-0lax">난방 시설</td>
                        <td class="tg3-0lax">

                        <c:choose>
                        	<c:when test="${product.heatType == '중앙난방'}">
								<input type="radio" name="heatType" value="중앙난방" checked> 중앙 난방

		                        <input type="radio" name="heatType" value="개별난방"> 개별 난방                        	
                        	</c:when>
                        	<c:otherwise>
		                        <input type="radio" name="heatType" value="중앙난방"> 중앙 난방

		                        <input type="radio" name="heatType" value="개별난방" checked> 개별 난방                        	
                        	</c:otherwise>
                        </c:choose>    

                        

                        </td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                     <th class="tg3-0lax">에어컨</th>
                      <th class="tg3-0lax">

                        <c:choose>
                        	<c:when test="${product.airCon == 'Y'}">
		                        <input type="radio" name="airCon" value="N"> 없음
	
		                        <input type="radio" name="airCon" value="Y" checked> 있음
                        	</c:when>
                        	<c:otherwise>
    	                        <input type="radio" name="airCon" value="N" checked> 없음
	
		                        <input type="radio" name="airCon" value="Y"> 있음
                        	</c:otherwise>
                        </c:choose>
                        
                      </th>
                    </tr>
                    <tr>
                      <td class="tg3-0lax">생활 시설</td>
                      <td class="tg3-0lax">
						
						
						<c:choose>
							<c:when test="${product.fridge == 'Y'}">
	                        <input type="checkbox" name="fridge" value="Y" checked> 냉장고
							</c:when>
							<c:otherwise>
							<input type="checkbox" name="fridge" value="Y"> 냉장고
							</c:otherwise>
						</c:choose>
						<c:choose>
						    <c:when test="${product.washer == 'Y'}">
						        <input type="checkbox" name="washer" value="Y" checked> 세탁기
						    </c:when>
						    <c:otherwise>
						        <input type="checkbox" name="washer" value="Y"> 세탁기
						    </c:otherwise>
						</c:choose>
                        <c:choose>
						    <c:when test="${product.cctv == 'Y'}">
						        <input type="checkbox" name="cctv" value="Y" checked> CCTV
						    </c:when>
						    <c:otherwise>
						        <input type="checkbox" name="cctv" value="Y"> CCTV
						    </c:otherwise>
						</c:choose>
						<c:choose>
						    <c:when test="${product.doorlock == 'Y'}">
						        <input type="checkbox" name="doorlock" value="Y" checked> 도어락 <br>
						    </c:when>
						    <c:otherwise>
						        <input type="checkbox" name="doorlock" value="Y"> 도어락 <br>
						    </c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${product.stove == 'Y'}">
								<input type="checkbox" name="stove" value="Y" checked> 가스레인지
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="stove" value="Y"> 가스레인지
							</c:otherwise>
						</c:choose>						                        
						<c:choose>
							<c:when test="${product.microwave == 'Y'}">
								<input type="checkbox" name="microwave" value="Y" checked> 전자레인지
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="microwave" value="Y"> 전자레인지
							</c:otherwise>
						</c:choose>

                      </td>
                    </tr>
                  </tbody>
                  </table>

            </div>
    
            <div id="Register-photo">

                <h4> 사진 등록 </h4>


                <table class="tg4">
                    <colgroup>
                    <col style="width: 264px">
                    <col style="width: 1003px">
                    </colgroup>

                <thead>
                    <tr>
                      <th class="tg4-0lax">방 사진(5장 모두 올려주세요)</th>
                      <th class="tg4-0lax">
														
							<c:forEach items="${product.imageList}" var="img">
				                <c:choose>
				                    <c:when test="${img.imgOrder == 0}">
				                        <c:set var="img0" value="${img.imgPath}${img.imgRename}"/>
				                    </c:when>
				
				                    <c:when test="${img.imgOrder == 1}">
				                        <c:set var="img1" value="${img.imgPath}${img.imgRename}"/>
				                    </c:when>
				
				                    <c:when test="${img.imgOrder == 2}">
				                        <c:set var="img2" value="${img.imgPath}${img.imgRename}"/>
				                    </c:when>
				
				                    <c:when test="${img.imgOrder == 3}">
				                        <c:set var="img3" value="${img.imgPath}${img.imgRename}"/>
				                    </c:when>
				
				                    <c:when test="${img.imgOrder == 4}">
				                        <c:set var="img4" value="${img.imgPath}${img.imgRename}"/>
				                    </c:when>
				                </c:choose>
				            </c:forEach>
							

				            <div class="img-box">
				
				                <div class="boardImg">
				                    
				                    <img class="preview" src="${img0}">
				                    <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
				                    <span class="delete-image">&times;</span>
				                </div>
				                <div class="boardImg">
				                    
				                    <img class="preview" src="${img1}">
				                    <input type="file" name="images" class="inputImage" id="img1" accept="image/*">
				                    <span class="delete-image">&times;</span>
				                </div>
				                <div class="boardImg">
				                    
				                    <img class="preview" src="${img2}">
				                    <input type="file" name="images" class="inputImage" id="img2" accept="image/*">
				                    <span class="delete-image">&times;</span>
				                </div>
				                <div class="boardImg">
				                    
				                    <img class="preview" src="${img3}">
				                    <input type="file" name="images" class="inputImage" id="img3" accept="image/*">
				                    <span class="delete-image">&times;</span>
				                </div>
				                <div class="boardImg">
				                    
				                    <img class="preview" src="${img4}">
				                    <input type="file" name="images" class="inputImage" id="img4" accept="image/*">
				                    <span class="delete-image">&times;</span>
				                </div>
				               
							 
				
				               
				            </div>
                        

                      </th>
                    </tr>
                  </thead>
                 
                  </table>


            </div>
    
            <div id="Additional-information">

                <h4>추가 정보 </h4>

                <table class="tg5" style="undefined;table-layout: fixed; width: 1267px">
                    <colgroup>
                    <col style="width: 264px">
                    <col style="width: 1003px">
                    </colgroup>

                <thead>
                    <tr>
                      <th class="tg5-0lax">엘리베이터</th>
                      <th class="tg5-0lax">

						<c:choose>
							<c:when test="${product.elevator == 'Y'}">
								<input type="radio" name="elevator" value="N"> 없음

	                        	<input type="radio" name="elevator" value="Y" checked> 있음
							</c:when>
							<c:otherwise>
								<input type="radio" name="elevator" value="N" checked> 없음

                        		<input type="radio" name="elevator" value="Y"> 있음
							</c:otherwise>
						</c:choose>
                        
                        

                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="tg5-0lax">주차 가능 여부</td>
                      <td class="tg5-0lax">

						<c:choose>
							<c:when test="${product.parking == 'Y'}">
                        		<input type="radio" name="parking" value="N"> 불가능

		                        <input type="radio" name="parking" value="Y" checked> 가능
		                    </c:when>
		                    <c:otherwise>
                          		<input type="radio" name="parking" value="N" checked> 불가능

		                        <input type="radio" name="parking" value="Y"> 가능
		                    </c:otherwise>
		                </c:choose>

         

                        

                        

                      </td>
                    </tr>
                    
                  </tbody>
                  </table>


            </div>
    
            <div id="detailed-description">

                <h4>상세 설명</h4>

                <table class="tg6" style="undefined;table-layout: fixed; width: 1267px">
                    <colgroup>
                    <col style="width: 264px">
                    <col style="width: 1003px">
                    </colgroup>

                <thead>
                    <tr>
                      <th class="tg6-0lax">제목</th>
                      <th class="tg6-0lax">

                        <input id="Description-title" name = "productTitle" type="text" placeholder="리스트에 노출되는 문구입니다. 40자 이내로 작성해주세요." value="${product.productTitle}"> <br>

                      

                        - 한글, 영어, 숫자, 허용된 특수문자(+ - / , . ) 이외에 문자는 입력할 수 없습니다. 평행, 평, 기타 특수문자, 매물과 관련 없는 정보는 삭제 처리 됩니다. 



                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="tg6-0lax">상세 설명</td>

                      <td class="tg6-0lax">
                        
						<textarea name="productContent" rows="20" cols="80" placeholder="매물 상세 페이지에 노출되는 문구입니다. 1000자 이내로 작성해 주세요.">${product.productContent}</textarea>
						<br>

                        - 매물 정보와 관련없는 홍보성 정보는 입력할 수 없습니다. <br>

                        - 매물등록규정에 위반되는 금칙어는 입력할 수 없습니다. <br>

                        - 위 주의사항 위반시 임의로 매물 삭제 혹은 서비스 이용이 제한될 수 있습니다. <br>



                      </td>
                    </tr>
                 
                  </tbody>
                  </table>


            </div>
    
            
            

            <div class="footer">
            
                
                <div id="checkbox">
    
                    <input type="checkbox" name="registration-checkbox"  id="registration-checkbox" value="Y">  매물 관리 규정을 확인 하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.
    
                </div>
        
                
                <div id="registration">
    
                    <button type="submmit" id="registration-btn">매물 등록</button>
    
                </div>
        
                </div>

            </div>
        <input type="hidden" name="deleteList" value="">     
		</form>


            
        </div>

	<c:if test="${not empty loginMember}" >
       <div id="chattingicon">
           <a href="/chatting">
              <img src="/resources/images/chat_icon.png" id="chat-icon">
          </a>
       </div>
    </c:if>
    
    <c:if test="${not empty message}">
    	<script>
    		// EL/JSTL 구문이 먼저 해석
    		// 문자열의 경우 따옴표가 없는 상태이니 옆에 붙여줘야함.
    	
    		alert('${message}') // ${message}
    	
    	
    	</script>
    	
    </c:if>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                
	                var addr = ''; // 주소 변수

	                
	                if (data.userSelectedType === 'R') { 
	                    addr = data.roadAddress;
	                } else {
	                    addr = data.jibunAddress;
	                }
	
	                
	
	              
	                
	                document.getElementById("productAddress").value = addr;
	               
	                
	            }
	        }).open();
	    }
	</script>
     <script>
     
		const centerAddress = "${centerAddress}";
		console.log(centerAddress);
	
	
		
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb9b63d71a5408fd96cba9a1674b9d43&libraries=services,clusterer"></script>
	<script src="/resources/js/room_up_update.js"></script>
</body>
</html>