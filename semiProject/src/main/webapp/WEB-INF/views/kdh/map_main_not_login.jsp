<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <a href="/">
                    <img src="/resources/images/logo.png">
                </a>
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
                <form id="option" action="">
                    <select name="" id="">
                        <option class="optionsize" value="default" selected><p></p>원룸, 투룸</option>
                        <option class="optionsize" value="oneroom">원룸</option>
                        <option class="optionsize" value="tworoom">투룸</option>
                        
                    </select>

                    <select name="" id="">
                        <option value="default" selected>전세, 월세</option>
                        <option value="yearpee">전세</option>
                        <option value="mpnthpee">월세</option>

                    </select>
                    <p>보증금&nbsp;</p>
                    <input type="text" placeholder="보증금~까지"><p>만원</p>
                    <p>월세&nbsp;</p>
                    <input type="text" placeholder="월세~까지"><p>만원</p>
                    <button id="optionbtn">검색</button>



                </form>
            </div>
        </div>

        <div class="main">
            <div id="main-left">
                <p> 디폴트값 ! 앗! 이주변에는 방이 없어요!</p>
                <p>js 로 불러온 데이터값 여기안에 만들어질 div생성하면서 div안에 대표사진, 링크등등 닮긴 jsp연결</p>
                <p>22일에 했던 검색결과창 늘어나는과정 참고</p>
            </div>
            <%-- 지도에 연결된 기능 이것저것 추가해야함 --%>
            <div id="main-right"><button id="realbtn">실거래가 조회</button></div>
            
        </div>

        
        

        
        
    </div>

    


    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb9b63d71a5408fd96cba9a1674b9d43&libraries=services,clusterer"></script>
    <script src="/resources/js/map_main.js"></script>
</body>
</html>