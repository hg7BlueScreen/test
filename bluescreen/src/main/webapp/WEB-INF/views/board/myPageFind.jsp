<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지-즐겨찾기</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="마이페이지-즐겨찾기" />
<meta name="keywords" content="마이페이지-즐겨찾기" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<style>


.drugTR {
   background-color: #ffffff;

   transition-property: width, background-color, color; /* 어떤 css 프로퍼티를 transition할지 지정 */
   transition-duration: 0.1s, 0.1s; /* width와 bg-color가 2초동안 변화 */
}

.drugTR:hover { /* 마우스를 올리면 transition발동해서 적용될 상태 */
	background-color: #F5F5F5; 
}

.drugGrayClass {
	background-color: #F5F5F5; 
}

.drugWhiteClass {
	background-color: #FFFFFF; 
}

.firstBtn {
  background: url(/image/paging_first.png) no-repeat;
  width:40px;
  height: 40px;
}

.prevBtn {
  background: url(/image/paging_prev.png) no-repeat;
  width:40px;
  height: 40px;
}

.numBtn {
  position: relative;
  top: -3px;
  height: 33px !important;
  margin-left: 15px;
  margin-right: 15px;
}

.numBtn > div {
  position: relative;
  top: 2px;
}

.nextBtn {
  background: url(/image/paging_next.png) no-repeat;
  width:40px;
  height: 40px;
}

.lastBtn {
  background: url(/image/paging_last.png) no-repeat;
  width:40px;
  height: 40px;
}
.page-num {
  margin-top: 15px;
}

.page-num li {
  width: 36px;
  height: 35px;
  padding: 0;

}

.firstBtn .prevBtn .numBtn .nextBtn .lastBtn {
	 margin: 0 auto;
}
</style>
<script type="text/javascript">
	function drugOnClick(dno){
		if(!$("#drugTR"+dno).hasClass('drugGrayClass')){
			$("#drugTR"+dno).addClass("drugGrayClass");
		}else{
			$("#drugTR"+dno).removeClass("drugGrayClass");
		}
	}
	
	function bookMarkDeleteBtn(){
		var numbers = [];
	    $('.drugGrayClass[id^="drugTR"]').each(function() { // 특정 클래스를 포함하는 요소 선택
	        var id = this.id;
	        var number = id.replace('drugTR', ''); // 'drug'를 제거
	        numbers.push(number);
	    });
	    console.log(numbers);
	    
	    if(numbers.length <= 0){
	    	alert("삭제할 목록을 선택해주세요.");
	    	return false;
	    }
	    var uno = "${sessionUno}";
	    $.ajax({
			url: "deleteBookMarkListFromMyPage",
			method: "post",
			data: {"dno":numbers, "uno":uno},
			success: function(data){
				alert("정상적으로 삭제되었습니다.");
				location.reload();
			},
			error: function(status){
				
			}
	    });
	}
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<!-- container -->
	<div id="" style="margin-top: 150px;">


		<!-- contents -->

		<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
		<div id="left"
			style="float: left; width: 250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">
				마이페이지<span style="font-size: 13px;">내 정보</span>
			</div>
			<ul>
				<li style="height: 40px;"><a href="myPage" id="leftNavi2"
					style="height: 40px; font-size: 15px; line-height: 270%;">내 정보</a></li>
				<li style="height: 40px;"><a href="" id="leftNavi3"
					style="height: 40px; font-size: 15px; line-height: 270%;">즐겨찾기</a></li>
				<li style="height: 40px;"><a href="myPageMedi" id="leftNavi1"
					style="height: 40px; font-size: 15px; line-height: 270%;">복용 중인
						약</a></li>
				<li class="last" style="height: 40px;"><a href="myPageFix"
					id="leftNavi4"
					style="height: 40px; font-size: 15px; line-height: 270%;">회원정보수정</a></li>
			</ul>
		</div>
		<script type="text/javascript">
			initSubmenu(3, 0);
		</script>

		<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
		<div class="myTab">
			<ul>
				<li><a href="myPage">내 정보</a></li>
				<li class="dep"><a href="" class="on">즐겨찾기</a></li>
				<li><a href="myPageMedi">복용 중인 약</a></li>
				<li class="last"><a href="myPageFix">회원정보수정</a></li>
			</ul>
		</div>


		<div
			style="overflow: hidden; border: 1px solid #8497d3; border-radius: 12px; margin: 50px 500px 100px 500px; width: 1000px;">
			<table>
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="60%">
				</colgroup>
				<tr>
					<th
						style="border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height: 34px; font-weight: bold; font-size: 15px;">품목코드</th>
					<th
						style="border-bottom: 1px solid #b9c4e8; font-weight: bold; font-size: 15px; background: #f5f5f5;">회사명</th>
					<th
						style="border-bottom: 1px solid #b9c4e8; font-weight: bold; font-size: 15px; background: #f5f5f5;">제품명</th>
				</tr>
				<c:forEach var = "d" items = "${list }">
					<tr class = "drugTR" onclick = "drugOnClick(${d.dno})" id = "drugTR${d.dno }">
						<td style="height: 32px; font-size: 15px;">${d.item_seq }</td>
						<td style="font-size: 15px;">${d.entp_name }</td>
						<td style="font-size: 15px;">${d.item_name }</td>
					</tr>
				</c:forEach>
			</table>
			<div class="page-num" id="pageBtns" style="display: flex; align-items: center; margin: 0 auto; text-align: center; justify-content: center;">
			
			
			<!-- 시작페이지 이동 시작 -->
			<c:if test="${pageDto.page != 1 }">
				<a href = "/board/myPageFind?page=1"><div class="firstBtn"></div></a>
			</c:if>
			<c:if test="${pageDto.page == 1 }">
				<div class="firstBtn"></div>
			</c:if>
			<!-- 시작페이지 이동 끝 -->
			<!-- 이전 페이지 이동 시작 -->
			<c:if test="${pageDto.page != 1 }">
				<a href = "/board/myPageFind?page=${pageDto.page - 1 }"><div class="prevBtn"></div></a>
			</c:if>
			<c:if test="${pageDto.page == 1 }">
				<div class="prevBtn"></div>
			</c:if>
			<!-- 이전 페이지 이동 끝 -->
				<c:forEach begin = "${pageDto.startPage }" end = "${pageDto.endPage }" step = "1" var = "pNum">
					<c:if test="${pNum <= pageDto.maxPage }">
						<c:if test="${pageDto.page == pNum }">
						<li class="numBtn"><div style = "margin-top:5px; font-size:16px;">
							<strong>${pNum }</strong>
						</c:if>
						<c:if test="${pageDto.page != pNum }">
						<li class="numBtn"><a href = "/board/myPageFind?page=${pNum }"><div style = "margin-top:5px; font-size:16px;">
							${pNum }
						</c:if>
						</div></a></li>
					</c:if>
				</c:forEach>
			<!-- 다음 페이지 이동 시작 -->
			<c:if test="${pageDto.page != pageDto.maxPage }">
				<a href = "/board/myPageFind?page=${pageDto.page + 1 }"><div class="nextBtn"></div></a>
			</c:if>
			<c:if test="${pageDto.page == pageDto.maxPage }">
				<div class="nextBtn"></div>
			</c:if>
			<!-- 다음 페이지 이동 끝 -->
			<!-- 마지막 페이지 이동 시작 -->
			<c:if test="${pageDto.page != pageDto.maxPage }">
				<a href = "/board/myPageFind?page=${pageDto.maxPage }"><div class="lastBtn"></div></a>
			</c:if>
			<c:if test="${pageDto.page == pageDto.maxPage }">
				<div class="lastBtn"></div>
			</c:if>
			</div>
		</div>
			<button type = "button" onclick = "bookMarkDeleteBtn()" style = "position: relative; display: flex; margin: 0 auto; bottom: 90px; left: 500px;">버튼왕 김버튼</button>

	
	
	<div style = "padding: 1px;"></div>

	<%@include file = "footer.jsp" %>
</body>
</html>