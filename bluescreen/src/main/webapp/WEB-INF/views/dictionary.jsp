<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>사전 페이지</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function doSelect(){
		if($("#category").val() == "질병"){
			str = "";
			str += '<table><colgroup><col width="15%"><col width="15%"><col width="70%"></colgroup><tr><th>번호</th><th>질병코드</th><th>질병명</th></tr>';
/* 			str += '<tr>';
	        str += '<td><span class="table-notice">NOTICE</span></td>';
	        str += '<td class="table-title">신종코로나바이러스 예방관련 운영 안내</td>';
	        str += '<td>2020-02-28</td>';
	      	str += '</tr>'; */
			$("#tableLocate").html(str);
		}else if($("#category").val() == "의약품"){
			str = "";
			str += '<table><colgroup><col width="10%"><col width="25%"><col width="25%"><col width="30%"><col width="10%"></colgroup><tr><th>번호</th><th>품목기준코드</th><th>업체명</th><th>제품명</th><th>사진여부</th></tr>';
			$("#tableLocate").html(str);
		}else{			
			$("#tableLocate").html("");
		}
	}
</script>
</head>      
<body>
	<%@include file = "header.jsp" %>
	 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="/css/notice_list.css">
  <link rel="stylesheet" href="/css/lista.css">
  <section style = "height:400px; margin:150px">
	
    <h1 style = "margin-top: 40px; margin-bottom: 50px; font-size: 40px;">질병 및 의약품 사전</h1>
    <div class="wrapper">
      <form action="" name="search" method="post">
        <select name="category" id="category" onchange = "doSelect()" style = "position: absolute; top: 50%; left: 50%; width: 80px; height: 40px; margin-left: -185px; margin-top: -20px; padding: 5px; border: 1px solid #666666; font-family: inherit; background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/search-box-select.png) no-repeat 95% 50%; -webkit-appearance: none; -moz-appearance: none; appearance: none;">
          <option value="0">선택</option>
          <option value="질병">질병</option>
          <option value="의약품">의약품</option>
        </select>

        <div class="title">
          <input type="text" size="16" id = "textBox">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>
    
    <div id = "tableLocate">
    
    </div>
	<div style = "margin-bottom: 50px">
		<br>
	</div>

  </section>
		<%@include file = "footer.jsp" %>
</body>
</html>