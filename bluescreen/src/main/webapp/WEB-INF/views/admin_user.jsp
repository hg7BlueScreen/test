<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	function searchBtn(){
		$(function(){
			var userCategory = $("#userCategory").val();
			var searchKeyword = $("#user_sinfo").val();
			location.href = "admin_user?userCategory="+userCategory+"&keyword="+searchKeyword;
		}); // jquery
	}
	
	function setCaution(uno){
		if(confirm(uno+"번 유저에게 경고를 부여하시겠습니까?")){
			location.href = "admin_report?uno="+uno;
		}
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
  		background-color: #3f80ea;
	}
	button:hover {opacity: 50;}
	#user_info{border-radius: 12px;}
	#user_info:hover {border-radius: 2px; border: 3px solid #3F80EA; cursor: pointer;}
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
        <a href="admin_user" class = "active">
          <i class='bx bx-user'></i>
          <span class="links_name">
            회원정보
          </span>
        </a>
      </li>
      <li>
        <a href="admin_report">
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
        <div class="card_header">
          <h2><span class = "links_name">유저 검색</span></h2>
        </div>
        <table>
        <colgroup>
        	<col width = "7%">
        	<col width = "10%">
        	<col width = "15%">
        	<col width = "68%">
        </colgroup>
			
				 <tr>
				 <td><span class = "links_name">
				 	<select id = "userCategory" name = "userCategory">
				 		<option value = "name" <c:if test = "${userCategory == 'name' }">selected</c:if>>이름</option>
				 		<option value = "nickName" <c:if test = "${userCategory == 'nickName' }">selected</c:if>>닉네임</option>
				 		<option value = "ID" <c:if test = "${userCategory == 'ID' }">selected</c:if>>아이디</option>
				 	</select>
				 </span></td>
				 <td><input type = "text" id = "user_sinfo" name = "user_sinfo" value = "${keyword }"></td>
				 <td><button type = "button" onclick = "searchBtn()" style = "width:80px;"><span class = "links_name">검색</span></button></td>
				 <td></td>
            </tr>
			     
        </table>
        <table>
        <colgroup>
        	<col width = "10%">
        	<col width = "25%">
        	<col width = "25%">
        	<col width = "20%">
        	<col width = "20%">
        </colgroup>
          <thead>
            <tr>
              <td>번호</td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;닉네임</td>
              <td>아이디</td>
              <td>누적 경고</td>
              <td>가입일</td>
            </tr>
          </thead>
          <tbody>
          <!-- 반복 시작 -->
          <c:forEach var = "m" items = "${memberList }" step = "1">
            <tr id = "user_info" onclick = "setCaution(${m.uno})">
            <td>${m.uno }</td>
              <td>${m.nickname }</td>
              <td>${m.id }</td>
              <td>${m.caucount }</td>
                <!-- <span class="badge bg_worning">
                  Meduim
                </span> -->
              <td>${m.birthday }</td>
            </tr>
          </c:forEach>
            
            <!-- 반복 끝 -->
          </tbody>
        </table>
      </div>
      </div>
  
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