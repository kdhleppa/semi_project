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
                <a href="/">
                    <img src="/resources/images/logo.png">
                </a>
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

            <form class="content">
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

                <div>
                    <p class="infobox" style="margin-left: 60px;">&nbsp;&nbsp;&nbsp;&nbsp;아이디</p>
                    <input id="textbox" type="text"><button>중복확인</button>
                </div>

                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</p>
                    <input id="textbox" type="text">
                </div>
                    
                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호확인</p>
                    <input id="textbox" type="text">
                </div>

                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;이름</p>
                    <input id="textbox" type="text">
                </div>

                <div>
                    <p class="infobox" style="margin-left: 60px;">&nbsp;&nbsp;&nbsp;&nbsp;닉네임</p>
                    <input id="textbox" type="text"><button>중복확인</button>
                </div>
                
                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;주소</p>
                    <input id="textbox" type="text">
                </div>
                
                <div>
                    <p class="infobox">&nbsp;&nbsp;&nbsp;&nbsp;Email</p>
                    <input id="textbox" type="text">
                </div>

                <div>
                    <p class="infobox" style="margin-left: 60px;">&nbsp;&nbsp;&nbsp;&nbsp;휴대폰</p>
                    <input id="textbox" type="text"> 인증하기
                </div>

                <div style="font-size: 25px; margin-right: 300px;">
                    프로필 사진 등록
                </div>

                <div class="profileimg" style="border-image: round;">
                    <input type="image">
                </div>

                <button id="btnbox" class="signUpEnd"> <a href="/link/login" style="color:white; text-decoration:none;">가입완료</a> </button>

                
            </form>

            <div class="rightmenu">
                
            </div>
                    
        </div>

    </div>
</body>
</html>