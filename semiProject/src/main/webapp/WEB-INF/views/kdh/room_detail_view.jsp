<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                <a href="/">
                    <img src="/resources/images/logo.png">
                </a>
            </section>
           
            <section class="menu">
				
				<div id="map">
                    <a href="/link/mapMainLogin">지도</a>
                </div>
                <div id="favorites">
                    <a href="/link/likeList">관심목록</a>
                </div>

                <div id="roomup">
                    <a href="/link/roomUpFront">방내놓기</a>
                </div>

                <div id="board">
                    <a href="/link/communityList">게시판</a>
                </div>
                <div id="mypage">
                    <a href="/link/myInfo">내정보</a>
                </div>

            </section>
        </nav>

        <main id="main-container">
            <div id="main-left"></div>
            <div id="main-mid">
                <div id="img-container">
                    <div id="img1" class="img">
                        <img src="/resources/images/beautiful-shot-of-a-white-british-shorthair-kitten.jpg" alt="">
                    </div>
                    <div id="img-2and3" class="imgall">
                        <div id="img2" class="img upside">
                            <img src="/resources/images/view-of-adorable-kitten-inside-house.jpg" alt="">
                        </div>
                        <div id="img3" class="img">
                            <img src="/resources/images/little-grey-kitten-with-blue-eyes-lies-on-the-grey-couch.jpg" alt="">
                        </div>
                    </div>
                    <div id="img-4and5" class="imgall">
                        <div id="img4" class="img upside">
                            <img src="/resources/images/little-grey-kitten-with-blue-eyes-lies-on-the-grey-couch.jpg" alt="">
                        </div>
                        <div id="img5" class="img">
                            <img src="/resources/images/view-of-adorable-kitten-inside-house.jpg" alt="">
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
                                <td>전세</td>
                                <td>1억 2000</td>
                            </tr>
                            <tr>
                                <td>관리비</td>
                                <td>7만</td>
                            </tr>
                            <tr>
                                <td>주차여부</td>
                                <td>불가</td>
                            </tr>
                            <tr>
                                <td>룸타입</td>
                                <td>원룸</td>
                            </tr>
                        </table>
                        </div>
                        <div id="map">맵 위치</div>
                        
                    </div>
                </div>
                <div class="info">
                    <p>상세정보</p>
                    <div id="icon">
                        <img src="/resources/images/refrigerator.png" alt="냉장고">
                        <img src="/resources/images/induction-stove.png" alt="인덕션">
                        <img src="/resources/images/laundry.png" alt="세탁기">
                        <img src="/resources/images/air-conditioner.png" alt="에어컨">
                    </div>

                </div>
                <div class="detail-container">
                    <div class="detail-header">신림역 버스10분 거리 원룸 전세</div>
                    <p>싸요</p>
                    <p>버스정거장이 바로 옆에(1분거리) 있어요</p>
                    <p>주변이 조용해요</p>
                    <p>세부 내용 내용 내용...</p>
                    <p>세부 내용 내용 내용...</p>
                    <p>세부 내용 내용 내용...</p>
                    <p>세부 내용 내용 내용...</p>
                    <p>세부 내용 내용 내용...</p>
                </div>
                <div>여백의미</div>
                
            </div>
            <div id="main-right">
                <div class="right-btn-container">
                    <button class="right-btn rb1"><img src="/src/main/webapp/resources/images/chat.png" class="right-icon">쪽지로 문의하기</button>
                    <button class="right-btn"><img src="/src/main/webapp/resources/images/warning.png" class="right-icon">허위매물 신고하기</button>
                </div>
                <p id="linkname">매물근처 제휴 중개사보기</p>
                <div class="right-link-container">
                    <div class="right-link">
                        <div>
                            <p>OK공인중개사사무소</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/person.png" alt="">조지은</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/telephone.png" alt="">02-853-3233</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/home.png" alt="">빌라/원룸</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/medal.png" alt="">등록번호 11545-2022-00058</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/maps.png" alt="">서울특별시 금천구 남부순환로108길 20 1층 일부(가산동)</p>
                        </div>
                        <div id="map2"></div>
                    </div>
                    <div class="right-link">
                        <div>
                            <p>캐슬공인중개사사무소</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/person.png" alt="">정세민</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/telephone.png" alt="">02-883-9821</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/home.png" alt="">빌라/원룸</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/medal.png" alt="">등록번호 11620-2015-00168</p>
                            <p class="linkp"><img src="/src/main/webapp/resources/images/maps.png" alt="">서울특별시 관악구 행운1마길 20 2층201호(봉천동)</p>
                        </div>
                        <div id="map3"></div>
                    </div>
                    <div class="right-link">3</div>
                    
                </div>
            </div>






        </main>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb9b63d71a5408fd96cba9a1674b9d43&libraries=services,clusterer"></script>
        <script src="/resources/js/room_detail_view.js"></script>
        
</body>
</html>