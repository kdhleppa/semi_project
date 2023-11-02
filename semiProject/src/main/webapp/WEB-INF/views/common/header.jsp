<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/map_main.css">

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

        <div id="favorites">
            <a href="/link/likeList">관심목록</a>
        </div>

        <div id="roomup">
            <a href="/link/roomUp">방내놓기</a>
        </div>

        <div id="board">
            <a href="/link/communityList">게시판</a>
        </div>
        <div id="myInfo">
            <a href="/link/myInfo">내정보</a>
        </div>
		
    </section>
</nav>




