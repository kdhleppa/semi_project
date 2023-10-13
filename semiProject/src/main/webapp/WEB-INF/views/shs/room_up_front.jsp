<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>방내놓기</title>
    <link rel="stylesheet" href="/resources/css/topbar_atag_white_style.css">
    <link rel="stylesheet" href="/src/main/webapp/resources/css/room_up_front.css">
    <script src="https://kit.fontawesome.com/75b9a966ac.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <nav>
            <section class="logo">
                <a href="http://192.168.120.16:5500/SemiDesign/main.html">
                    <img src="/src/main/webapp/resources/images/logo.png">
                </a>
            </section>
            <!-- 각 글씨에 링크 걸것 -->
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

    


   

        <div class="main">
           
            <div id="title">
                  방내놓기
           </div>

 
           <div id="choice">
                <div id="choice-box">
                    <div id="choice-one" >원룸</div>
                    <div id="choice-two" >투룸</div>
                </div>
             

           </div>
 
           <div id="information1">

            ※ 거실1+방1 도 원룸으로 들어갑니다.

           </div>
           
        <div class="footer">

            <div id="information2">

                ※ 복수의 매물 등록을 원하시는 분들은 <br>
                   추가 증명자료가 필요합니다.

            </div>
        
            <div id="Attachments">

                <button id="attach" aria-setsize="100px">파일 첨부하기 </button>

            </div>

        </div>
         
 
          

        </div>

        


        
    </div>
        
        
   

    


</body>
</html>