// 게시글 수정 버튼 클릭 시
document.getElementById("modifyButton").addEventListener("click", () => {
	
	location.href 
		= location.pathname.replace("link", "notice2")
			+ "/update"
			+ location.search
			
//http://localhost:8080/link/boardReadMore/70
    //				   /notice2/boardReadMore/70/update (GET 요청)
	

});


// 게시글 삭제 버튼이 클릭되었을 때

document.getElementById("deleteButton").addEventListener("click", () => {
   
  location.href
    = location.pathname.replace("link", "notice2")
		+ "/delete"
		+ location.search
		
//http://localhost:8080/link/noticeReadMore/218
    //				   /notice2/noticeReadMore/218/delete (GET 요청)

});




