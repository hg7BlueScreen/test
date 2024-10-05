<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Report Page</title>
  <link rel="stylesheet" href="/css/main.css">
  <!-- box icon -->
  <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
  <link href = "https://fonts.google.com/specimen/IBM+Plex+Sans+KR?subset=korean&script=Kore" rel="stylesheet" type = "text/css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#logoImage").click(function(){
			location.href = "/";
		}); // logoImage
	}); // jquery
	
	function applyCaution(uno, nickname){
		var reportScore = $("#report_score").val();
		if(confirm(nickname+"에게 "+reportScore+"점을 추가하시겠습니까?")){
			let reason = prompt("사유를 입력해주세요.");
			$.ajax({
				url: "applyCaution",
				method: "post",
				data: {"CautionScore":reportScore, "uno":uno, "CautionReason":reason},
				success: function(data){
					if(data == '성공'){
						alert("처리되었습니다.");
					}
					
				},
				error: function(status){
					console.log(status);
				}
			}); // ajax
		}
	}
	
	function deleteReportOne(cno) {
		$.ajax({
			url: "deleteReportOne",
			method: "post",
			data: {"cno":cno},
			success: function(data){
				if(data == '성공'){
					$("#complainTR"+cno).remove();
					
				}
			},
			error: function(status){
				console.log(status);
			}
		});
	}
	
	function jumpToBoard(bno) {
		location.href = "/board/bread?bno="+bno;
	}
	
</script>
  <style>
  	.links_name {
  font-family: "IBM Plex Sans KR", sans-serif;
  font-weight: 400;
  font-style: normal;
}
  .scroll {
  overflow: hidden;
}
	
	td{
		font-family: "IBM Plex Sans KR", sans-serif;
  		font-weight: 400;
  		font-style: normal;	
	}
	button{
		border-radius: 20px; border: 2px solid #ffffff; cursor: pointer;
		font-family: "IBM Plex Sans KR", sans-serif;
  		font-weight: 400;
  		font-style: normal;
  		color: #ffffff;
  		background-color: #5ca08f;
	}
	#user_info{border-radius: 12px;}
	#user_info:hover {border-radius: 2px; border: 2px solid #3F80EA; cursor: pointer;}
  </style>
</head>
<body>
  <div class="sidebar">
    <div class="logo_details">
      <img src = "/image/team.png" width = "50px" id = "logoImage">
      <div class="logo_name">
        &nbsp;&nbsp;Waste Drugs
      </div>
    </div>
    <ul>
    <li>
        <a href="announceWrite">
          <i class='bx bx-bar-chart'></i>
          <span class="links_name">
            공지사항 작성
          </span>
        </a>
      </li>
      <li>
        <a href="admin_user">
          <i class='bx bx-user'></i>
          <span class="links_name">
            회원정보
          </span>
        </a>
      </li>
      <li>
        <a href="admin_report" class = "active">
          <i class='bx bx-error-circle'></i>
          <span class="links_name">
            신고관리
          </span>
        </a>
      </li>
      <li>
        <a href="admin_update">
          <i class='bx bx-revision'></i>
          <span class="links_name">
            업데이트
          </span>
        </a>
      </li>
    </ul>
  </div>
  <!-- End Sideber -->
  <section class="home_section">
	<div class="details">
      <div class="recent_project">
        <div class="card_header" style = "height:15px;">
          <h2><span class = "links_name">경고 처리</span></h2>
        </div>

        <table>    
        <colgroup>
        	<col width = "10%">
        	<col width = "10%">
        	<col width = "20%">
        	<col width = "20%">
        	<col width = "40%">
        </colgroup>
          <thead>
            <tr>
              <td>닉네임</td>
              <td>누적 경고</td>
              <td>&nbsp;&nbsp;&nbsp;아이디</td>
              <td>추가 경고</td>
              <td></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>${member.nickname }</td>
              <td>${member.caucount }</td>
              <td>${member.id }</td>
              <td><select id = "report_score">
              <c:forEach var = "r" begin = "1" end = "10" step = "1">
              	<option value = "${r }">${r }</option>
              </c:forEach>
              </select>
              </td>
                <!-- <span class="badge bg_worning">
                  Meduim
                </span> -->
              <td><button type = "button" onclick = "applyCaution('${member.uno}', '${member.nickname }')" style = "width: 80px; background-color: #3f80ea; border: 1px white;">적용</button></td>
            </tr>
            
          </tbody>
        </table>
      </div>
      </div>
    
      
      <div class="details">
      <div class="recent_project">
        <div class="card_header" style = "height:15px;">
          <h2><span class = "links_name">신고 목록</span></h2>
        </div>

        <table>    
        <colgroup>
        	<col width = "10%">
        	<col width = "10%">
        	<col width = "20%">
        	<col width = "20%">
        	<col width = "20%">
        	<col width = "20%">
        </colgroup>
          <thead>
            <tr>
              <td>글 번호</td>
              <td>&nbsp;&nbsp;&nbsp;구분</td>
              <td>신고자</td>
              <td>신고 날짜</td>
              <td>신고 사유</td>
              <td></td>
            </tr>
          </thead>
          <tbody>
          <c:forEach var = "c" items = "${complain }" step = "1">
            <tr id = "complainTR${c.cno }">
              <td>${c.no }</td>
              <td>
    	          <c:if test="${c.division == 0 }">
	        	      게시글
        	      </c:if>
    	          <c:if test="${c.division == 1 }">
	        	      댓글
        	      </c:if>
              </td>
              <td>${c.nickname }</td>
              <td><fmt:formatDate pattern="yyyy-MM-dd" value = "${c.cdate }"/></td>
                <!-- <span class="badge bg_worning">
                  Meduim
                </span> -->
              <td>${c.creason }</td>
              <td>
              <button type = "button" onclick = "deleteReportOne(${c.cno})" style = "width: 80px; background-color: #3f80ea; border: 1px white;">삭제</button>
              <button type = "button" onclick = "jumpToBoard(${c.bno})" style = "width: 80px; background-color: #3f80ea; border: 1px white;">이동</button>
              </td>
            </tr>
          </c:forEach>
            
          </tbody>
        </table>
      </div>
      </div>
      <a></a>
      
  </section>

  <script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");

    closeBtn.addEventListener("click", () => {
      sidebar.classList.toggle("open");
      // call function
      changeBtn();
    });

    function changeBtn() {
      if(sidebar.classList.contains("open")) {
        closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
      } else {
        closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");
      }
    }
  </script>
</body>
</html>