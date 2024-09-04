<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사전 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		if($("#category").val() == "none"){
			$("#categoryDetail").html('<option value = "none"></option>');
		}else if($("#category").val() == "disease"){
			let optionHtml = "";
			optionHtml += '<option value = "sickCd" <c:if test="${categoryDetail == \'sickCd\' }">selected</c:if>>질병코드</option>';
			optionHtml += '<option value = "sickNm" <c:if test="${categoryDetail == \'sickNm\' }">selected</c:if>>질병명</option>';
			$("#categoryDetail").html(optionHtml);
		}else if($("#category").val() == "medicine"){
			let optionHtml = "";
			optionHtml += '<option value = "entpName" <c:if test="${categoryDetail == \'entpName\' }">selected</c:if>>회사명</option>';
			optionHtml += '<option value = "itemName" <c:if test="${categoryDetail == \'itemName\' }">selected</c:if>>제품명</option>';
			optionHtml += '<option value = "efcyQesitm" <c:if test="${categoryDetail == \'efcyQesitm\' }">selected</c:if>>효능</option>';
			optionHtml += '<option value = "atpn" <c:if test="${categoryDetail == \'atpn\' }">selected</c:if>>주의사항</option>';
			$("#categoryDetail").html(optionHtml);
		}
	})
	
	function doSelectBig() {
		if ($("#category").val() == "disease") {
			location.href = "dict?category=disease"
					
		} else if ($("#category").val() == "medicine") {
			location.href = "dict?category=medicine"

		} else {
			location.href = "dict"

		}
	}
	
	function searchBtn(){
		location.href = "dict?category=${category}&textBox="+$("#textBox").val()+"&categoryDetail="+$("#categoryDetail").val();
	}
	
	function enterKey(){
		if (event.keyCode === 13) {
			location.href = "dict?category=${category}&textBox="+$("#textBox").val()+"&categoryDetail="+$("#categoryDetail").val();
		}
	}
	
</script>
<style type="text/css">
	.dialog {
  display:none;
  position: fixed;
  left: 0;
  top: 0;
  z-index: 10;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.4);
}

.dialog>.tb {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
}

.dialog>.tb .inner {
  width: 100%;
  padding: 20px;
  background: #fff;
  border-radius: 16px;
}

.dialog .top {
  display: flex;
  align-item: center;
  border-bottom: 1px solid #ddd;
  justify-content: space-between;
  padding-bottom: 15px;
  margin-bottom: 15px;
}

.dialog .title {
  font-weight: bold;
  font-size: 20px;
}

.dialog .ct {
  max-height: 60vh;
  height: 60vh;
  overflow-y: auto;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  background-color: #fff;
}

.num {
   background-color: #ffffff;

   transition-property: width, background-color, color; /* 어떤 css 프로퍼티를 transition할지 지정 */
   transition-duration: 0.1s, 0.1s; /* width와 bg-color가 2초동안 변화 */
}
.num:hover { /* 마우스를 올리면 transition발동해서 적용될 상태 */
	background-color: #cccccc; 
}

.medicineTr {
   background-color: #ffffff;

   transition-property: width, background-color, color; /* 어떤 css 프로퍼티를 transition할지 지정 */
   transition-duration: 0.1s, 0.1s; /* width와 bg-color가 2초동안 변화 */
}
.medicineTr:hover { /* 마우스를 올리면 transition발동해서 적용될 상태 */
	background-color: #cccccc; 
}
</style>
<script type="text/javascript">
	
	function modalUp(mno){
		$.ajax({
			url: "/getMedicineOne",
			method: "post",
			data: {"mno":mno},
			success: function(data){
				console.log("success");
				$(function(){
					const modal = document.querySelector("#modal");
					const btn = document.querySelector("#modal-btn");
					const close = document.querySelector(".close");
					$("#modal").css("display","block");
					$("#modalTitle").text(data.itemName);
					let mContent = "";
					if(data.entpName != null){
						mContent += '<h2>'+"회사명"+'</h2>';
						mContent += '<p>'+data.entpName+'</p>';
						mContent += '<br>';
					}
					if(data.itemName != null){
						mContent += '<h2>'+"제품명"+'</h2>';
						mContent += '<p>'+data.itemName+'</p>';
						mContent += '<br>';
					}
					if(data.itemSeq != null){
						mContent += '<h2>'+"품목기준코드"+'</h2>';
						mContent += '<p>'+data.itemSeq+'</p>';
						mContent += '<br>';
					}
					if(data.efcyQesitm != null){
						mContent += '<h2>'+"효능"+'</h2>';
						mContent += '<p>'+data.efcyQesitm+'</p>';
						mContent += '<br>';
					}
					if(data.useMethodQesitm != null){
						mContent += '<h2>'+"용법"+'</h2>';
						mContent += '<p>'+data.useMethodQesitm+'</p>';
						mContent += '<br>';
					}
					if(data.atpnWarnQesitm != null){
						mContent += '<h2>'+"복용 전 주의사항"+'</h2>';
						mContent += '<p>'+data.atpnWarnQesitm+'</p>';
						mContent += '<br>';
					}
					if(data.atpnQesitm != null){
						mContent += '<h2>'+"복용 시 주의사항"+'</h2>';
						mContent += '<p>'+data.atpnQesitm+'</p>';
						mContent += '<br>';
					}
					if(data.intrcQesitm != null){
						mContent += '<h2>'+"복용 중 주의사항"+'</h2>';
						mContent += '<p>'+data.intrcQesitm+'</p>';
						mContent += '<br>';
					}
					if(data.seQesitm != null){
						mContent += '<h2>'+"부작용"+'</h2>';
						mContent += '<p>'+data.seQesitm+'</p>';
						mContent += '<br>';
					}
					if(data.depositMethodQesitm != null){
						mContent += '<h2>'+"보관법"+'</h2>';
						mContent += '<p>'+data.depositMethodQesitm+'</p>';
						mContent += '<br>';
					}
					if(data.imageURL == "" || data.imageURL == null){
						
					}else{
						mContent += '<h2>'+"이미지"+'</h2>';
						mContent += '<p>'+'<img src = "'+data.imageURL+'">'+'</p>';
					}
					
					$("#modalContent").html(mContent);
				});
				
			},
			error: function(){
				console.log("error");
			}
		});
	}
	
	$(function(){
		$("#close").click(function(){
			$("#modal").css("display","none");
		});
	});
</script>


</head>
<body>

	<%@include file="header.jsp"%>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<link rel="stylesheet" href="/css/notice_list.css">
	<link rel="stylesheet" href="/css/lista.css">
	<section style="height: 600px; margin: 150px">

		<h1 style="margin-top: 40px; margin-bottom: 50px; font-size: 40px; left: 50%;">질병
			및 의약품 사전</h1>
		<div class="wrapper">
				<select name="category" id="category" onchange="doSelectBig()"
					style="position: absolute; top: 50%; left: 46.9%; width: 80px; height: 38px; margin-left: -180px; margin-top: -20px; padding: 5px; border: 1px solid #666666; font-family: inherit; background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/search-box-select.png) no-repeat 95% 50%; -webkit-appearance: none; -moz-appearance: none; appearance: none;">
					<option value="disease" <c:if test="${category == 'disease' }">selected</c:if>>질병</option>
					<option value="medicine" <c:if test="${category == 'medicine' }">selected</c:if>>의약품</option>
				</select>
				<select name="categoryDetail" id="categoryDetail"
					style="position: absolute; top: 50%; left: 52.5%; width: 120px; height: 38px; /* margin-left: -185px; */ margin-top: -20px; padding: 5px; border: 1px solid #666666; font-family: inherit; background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/search-box-select.png) no-repeat 95% 50%; -webkit-appearance: none; -moz-appearance: none; appearance: none;">
					<option value="none" <%-- <c:if test="${category == 'disease' }">selected</c:if> --%>></option>
				</select>

				<div class="title" style = "left: 55%">
					<input type="text" size="16" id="textBox" onkeydown="enterKey()" value = "${textBox }">
				</div>

				<button type="button" onclick = "searchBtn()" style = "height: 38px; left: 55%">
					<i class="fas fa-search"></i>
				</button>
		</div>
		
		<!-- <button id="modal-btn" style = "width: 150px;">자바스크립트 모달창</button> -->
		<div id="modal" class="dialog">
		  <div class="tb">
		    <div class="inner" style="max-width:1300px;">
		      <div class="top">
		        <div class="title" id = "modalTitle">모달창 제목</div>
		        <a href="#" id = "close" class="close">닫기</a>
		      </div>
		      <div class="ct" id = "modalContent">
		      모달 창 내용
		      </div>
		    </div>
		  </div>
		</div>

		<div id="tableLocate">
			<c:if test="${category == 'disease' }">
				<table>
					<colgroup>
						<col width="15%">
						<col width="15%">
						<col width="70%">
					</colgroup>
					<tr>
						<th>번호</th>
						<th>질병코드</th>
						<th>질병명</th>
					</tr>
					<tbody id = "tbody">
						<c:forEach var = "d" items = "${list }">
							<tr>
								<td>${d.dno}</td>
								<td>${d.sickCd}</td>
								<td>${d.sickNm}</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</c:if>
			<c:if test="${category == 'medicine' }">
				<table>
					<colgroup>
						<col width="10%">
						<col width="25%">
						<col width="25%">
						<col width="30%">
						<col width="10%">
					</colgroup>
					<tr>
						<th>번호</th>
						<th>품목기준코드</th>
						<th>업체명</th>
						<th>제품명</th>
						<th>사진여부</th>
					</tr>
					<tbody id = "tbody">
						<c:forEach var = "m" items = "${list }">
							<tr onclick = "modalUp(${m.mno})" class = "medicineTr">
								<td>${m.mno }</td>
								<td>${m.itemSeq }</td>
								<td>${m.entpName }</td>
								<td>${m.itemName }</td>
								<c:if test="${m.imageURL != null }">
									<td>Y</td>
								</c:if>
								<c:if test="${m.imageURL == null }">
									<td>N</td>								
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
		<c:if test="${category == 'disease' || category == 'medicine'}">
			<ul class="page-num" id="pageBtns">
			
			<!-- 시작페이지 이동 시작 -->
			<c:if test="${pageDto.page != 1 }">
				<a href = "dict?category=${category }&page=1&textBox=${textBox}&categoryDetail=${categoryDetail}"><li class="first"></li></a>
			</c:if>
			<c:if test="${pageDto.page == 1 }">
				<li class="first"></li>
			</c:if>
			<!-- 시작페이지 이동 끝 -->
			<!-- 이전 페이지 이동 시작 -->
			<c:if test="${pageDto.page != 1 }">
				<a href = "dict?category=${category }&page=${pageDto.page - 1}&textBox=${textBox}&categoryDetail=${categoryDetail}"><li class="prev"></li></a>
			</c:if>
			<c:if test="${pageDto.page == 1 }">
				<li class="prev"></li>
			</c:if>
			<!-- 이전 페이지 이동 끝 -->
				<c:forEach begin = "${pageDto.startPage }" end = "${pageDto.endPage }" step = "1" var = "pNum">
					<c:if test="${pNum <= pageDto.maxPage }">
						<c:if test="${pageDto.page == pNum }">
						<li class="num"><a href = "dict?category=${category }&page=${pNum }&textBox=${textBox}&categoryDetail=${categoryDetail}"><div style = "margin-top:5px;">
							<strong>${pNum }</strong>
						</c:if>
						<c:if test="${pageDto.page != pNum }">
						<li class="num"><a href = "dict?category=${category }&page=${pNum }&textBox=${textBox}&categoryDetail=${categoryDetail}"><div style = "margin-top:5px;">
							${pNum }
						</c:if>
						</div></a></li>
					</c:if>
				</c:forEach>
			<!-- 다음 페이지 이동 시작 -->
			<c:if test="${pageDto.page != pageDto.maxPage }">
				<a href = "dict?category=${category }&page=${pageDto.page + 1}&textBox=${textBox}&categoryDetail=${categoryDetail}"><li class="next"></li></a>
			</c:if>
			<c:if test="${pageDto.page == pageDto.maxPage }">
				<li class="next"></li>
			</c:if>
			<!-- 다음 페이지 이동 끝 -->
			<!-- 마지막 페이지 이동 시작 -->
			<c:if test="${pageDto.page != pageDto.maxPage }">
				<a href = "dict?category=${category }&page=${pageDto.maxPage}&textBox=${textBox}&categoryDetail=${categoryDetail}"><li class="last"></li></a>
			</c:if>
			<c:if test="${pageDto.page == pageDto.maxPage }">
				<li class="last"></li>
			</c:if>
			</ul>
		</c:if>

		<div style="margin-bottom: 50px">
			<br>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>