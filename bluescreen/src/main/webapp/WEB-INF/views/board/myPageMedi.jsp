<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>  MYPAGE-MEDI </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/my_medicine.css?" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/info/member.css">
<!-- <script type="text/javascript" src="../js/jquery.min.js"></script> -->
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/common1.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
});
</script>
</head>
<body>
<%@include file = "header.jsp" %> 
	<!-- container -->
	<div id="" style="margin-top:150px; ">
		<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
		<div id="left" style="float:left; width:250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">마이페이지<span style="font-size: 13px;">내 정보</span></div>
			<ul >	
				<li style="height:40px;"><a href="myPage" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%;">내 정보</a></li>
				<li style="height:40px;"><a href="myPageFind" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%;">즐겨찾기</a></li>
				<li style="height:40px;"><a id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%;">복용 중인 약</span></a></li>
				<li class="last" style="height:40px;"><a href="myPageFix" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%;">회원정보수정</a></li>
			</ul>				
		</div><script type="text/javascript">initSubmenu(3,0);</script>
		<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
		<div class="myTab">
			<ul>
				<li><a href="myPage" >내 정보</a></li>
				<li class="dep"><a href="myPageFind" >즐겨찾기</a></li>
				<li><a class="on">복용 중인 약</a></li>
				<li class="last"><a href="myPageFix">회원정보수정</a></li>
			</ul>						
		</div>	
	</div>
		<div id="container" style = "margin-bottom: 500px;">
		
		
<script type="text/javascript">
let id = "${sessionId}";
if(id==null || id==""){
	alert("로그인 후 이용가능합니다.");
	location.href="/login";
}
function medicineAdd(){//복용약 등록, 의약품 사전으로 이동
	location.href="/dict?category=drug";
}

function medicineImage(){//복용약 등록, 사진으로 추가함.
	$(function() {
		alert("업로드 할 사진은 정면에서 글자가 뚜렷하게 보여야 합니다.");
	    var formData = new FormData();

	    $(this).val('');
	    $("#fileInput").click();
		
	    // 파일 선택 후 AJAX 요청
	    $('#fileInput').on('change', function() {
	        let file = this.files[0]; // 선택된 파일 가져오기
	        if (file) {
	            formData.append('file', file); // FormData에 파일 추가

	            $.ajax({
	                url: "imageToString",
	                method: "post",
	                data: formData,
	                processData: false, // FormData를 자동으로 변환하지 않도록 설정
	                contentType: false, // Content-Type을 자동으로 설정하지 않도록 설정
	                success: function(data) {
	                    console.log(data);
	                    if(data == '' || data == null){
	                    	alert("약 정보를 찾을 수 없습니다.");
	                    	return false;
	                    }
	                    let str = '';
	                    str += '<table class = "modalTable"><thead><tr><th>품목기준번호</th><th>회사명</th><th>제품명</th><th>이미지</th></tr></thead>';
	                    str += '<tbody>';
	                    for(let i = 0; i < data.length; i++){
							str += '<tr onclick = "modalTRClick('+data[i].dno+')" id = "modalTROne'+data[i].dno+'">';
							str += '<td>'+data[i].item_seq+'</td>';             	
							str += '<td>'+data[i].entp_name+'</td>';             	
							str += '<td>'+data[i].item_name+'</td>';             	
							str += '<td><img style = "width: 75px;" src = "'+data[i].imageURL+'"></td>';
							str += '</tr>';
	                    }
	                    str += '</tbody></table>';
	                    str += '<input type = "button" onclick = "insertDrugModi()" value = "확인">';
	                    $("#modalContent").html(str);
	                },
	                error: function(status) {
	                    console.log(status);
	                }
	            });
	            modalUp(); // 모달 열기
	        }
	    });
	});
}

function modalTRClick(dno){
	let uno = "${sessionUno}";
	myMediUp(uno,dno);
}

function myMediUp(uno, dno){
	if(confirm("처방 받으신 약입니까?")){
		let myMdate = prompt("약 복용 기간을 입력해주세요\nex) 30일 처방 : 30일");
		$.ajax({
			url:"/myMediUp",
			method:"post",
			data:{"uno":uno,"dno":dno,"myMdate":myMdate},
			success:function(data){
				console.log(data);
				if(data=="성공"){
					alert("복용중인 약으로 등록되었습니다.");
					$("#modalTROne"+dno).remove();
				}else{
					alert("이미 등록된 약입니다.");
				}
			},
			error:function(){
				alert("fail");
			}
		});
	}else{
		$.ajax({
			url:"/myMediUp",
			method:"post",
			data:{"uno":uno,"dno":dno,"myMdate":""},
			success:function(data){
				console.log(data);
				if(data=="성공"){
					alert("복용중인 약으로 등록되었습니다.");
					$("#modalTROne"+dno).remove();
				}else{
					alert("이미 등록된 약입니다.");
				}
			},
			error:function(){
				alert("fail");
			}
		});
	}
}

function insertDrugModi(){
	$("#modal").css("display","none");
	location.href = "my_medicine";
}

function modalUp() {
	const modal = document.querySelector("#modal");
	const btn = document.querySelector("#modal-btn");
	const close = document.querySelector(".close");
	$("#modal").css("display","block");
}

$(function(){
	$("#close").click(function(){
		$("#modal").css("display","none");
	});
});

function medicineDel(){// 복용약 삭제
	let dno = [];
	let uno = "${sessionUno}";
	if($(".deleteCheck").is(":checked")){
		if(confirm("체크된 약품들을 목록에서 삭제하시겠습니까?")){
		//console.log("${uno}"); console.log($("input[class=deleteCheck]:checked").eq(0).val());
			for(var i=0;i<$("input[class=deleteCheck]:checked").length;i++){
				dno.push($("input[class=deleteCheck]:checked").eq(i).val());
			}
			console.log(dno);
			$.ajax({
				url:"/deleteCk",
				method:"post",
				data:{"dno":dno, "uno":uno},
				success:function(data){
					//alert("성공"); console.log(data);
					$("input[class=deleteCheck]:checked").parent().parent().parent().remove();
				},
				error:function(status){
					//alert("실패");
				}
			});
		}	
	}else{
		alert("체크된 약품이 없습니다.");
	}
}
function alarm(){ // 소비기한 만료 알람 기간 선택 보내기
	console.log($('#alram').val());
	$.ajax({
		url:"/alarmDate",
		method:"post",
		data:{"alDate":$("#alram").val()},
		success:function(data){
			//alert("성공"); console.log(data);
			alert("선택하신 기간으로 알람주기가 설정되었습니다.");
		},
		error:function(status){
			alert("실패");
			console.log(status);
		}
	}); 
}

</script>
			<!-- contents -->
			<div id="contents">
				<div>
					<div class="faqList">
						<div id="myMedicineHd">
							<label for="alarm">복용약 소비기한 임박알림 받기</label>
							<select id="alram" onchange="alarm()" >
								<option value="90" <c:if test="${member.datealarm == '90'}">selected</c:if>>3개월 전</option>
								<option value="30" <c:if test="${member.datealarm == '30'}">selected</c:if>>1개월 전</option>
								<option value="15"<c:if test="${member.datealarm == '15'}">selected</c:if>>15일 전</option>
								<option value="7"<c:if test="${member.datealarm == '7'}">selected</c:if>>일주일 전</option>
								<option value="1"<c:if test="${member.datealarm == '1'}">selected</c:if>>하루 전</option>
								<option value="0"<c:if test="${member.datealarm == '0'}">selected</c:if>>당일</option>
								<option value="" <c:if test="${member.datealarm == ''}">selected</c:if>>없음</option>
							</select>
							<button id="medicineImage" onclick="medicineImage()">사진으로 추가</button>
							<input type="file" id="fileInput" style="display: none;">
							<button id="medicineAdd" onclick="medicineAdd()">사전에서 추가</button>
							<button id="medicineDel" onclick="medicineDel()">복용약 삭제</button>
						</div>
						<ul>
							<!-- list -->
							<li>
								<div class="na">이름</div>
								<div class="date">권장소비기한</div>
								<div class="img">사진</div>
							</li>
							<c:forEach var="d" items="${dList }">
								<li>
									<a href="javascript:;" class="faqbtn">
										<div class="list">
											<input type="checkbox" class="deleteCheck" value="${d.dno }"/>
											<div class="name">${d.item_name }</div>
											<c:if test="${d.dateCh == 'past' }">
												<div class="ddate" style="color:red;"><fmt:formatDate value="${d.ddate }" pattern="yyyy-MM-dd"/></div>
											</c:if>
											<c:if test="${d.dateCh != 'past' }">
												<div class="ddate"><fmt:formatDate value="${d.ddate }" pattern="yyyy-MM-dd"/></div>
											</c:if>
											<div class="image"><img src="${d.imageURL }"></div>
										</div>
									</a>
									<div class="faqanswer" style="display: none;">
										<div class="faqbox">
											<c:if test="${d.storage_method!=null }">
												<div class="blet">보관방법</div>
												<div class="text">
													${d.storage_method } 
												</div>
											</c:if>
										<c:forEach var="m" items="${mList }">
											<c:if test="${d.item_seq==m.itemSeq}">
												<c:if test="${m.useMethodQesitm != null}">
													<div class="blet">복용법</div>
													<div class="text">
														${m.useMethodQesitm }
													</div>
												</c:if>
												<div class="blet">주의사항</div>
												<div class="text">
											<c:if test="${m.atpnWarnQesitm!=null }">
													<strong><u>복용 전 주의</u></strong><p>${m.atpnWarnQesitm}</p>
											</c:if>
											<c:if test="${m.atpnQesitm!=null }">
													<strong><u>복용 중 주의</u></strong><p>${m.atpnQesitm}</p>
											</c:if>
											<c:if test="${m.intrcQesitm!=null }">
													<strong><u>복용 후 주의</u></strong><p>${m.intrcQesitm}</p>
											</c:if>
												</div>
											<c:if test="${m.seQesitm!=null }">
												<div class="blet">부작용</div>
												<div class="text">
													${m.seQesitm } 
												</div>
											</c:if>
											</c:if>
										</c:forEach>
										</div>
									</div>
								</li> 
							</c:forEach>
							<!-- //list -->
						</ul>
					</div>
					<!-- //FAQ -->

					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">
						<c:if test="${page.page!=1 }">
							<a href="myPageMedi?page=1" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
							<a href="myPageMedi?page=${page.page-1 }" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						</c:if>
						<c:if test="${page.page==1 }">
							<a class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
							<a class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						</c:if>
						<c:forEach begin="${page.startPage }" end="${page.maxPage }" step="1" var ="pNum">
							<c:if test="${page.page == pNum}">
								<a style="color:#0a47ff; border:1px #0a47ff solid; background:#fff;">${pNum }</a>
							</c:if>
							<c:if test="${page.page != pNum}">
								<a href="myPageMedi?page=${pNum }" class="faqq">${pNum }</a>
							</c:if>
						</c:forEach>
						<c:if test="${page.page!=page.maxPage }">
							<a href="myPageMedi?page=${page.page+1}" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
							<a href="myPageMedi?page=${page.maxPage }" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</c:if>
						<c:if test="${page.page==page.maxPage }">
							<a class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
							<a class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</c:if>
						</div>
						<!-- //페이징이동1 -->
					</div>
				</div>
			</div>
			<!-- //contents -->
		 </div>
	 </div>
	<!-- //container -->
	<div id="modal" class="dialog">
		  <div class="tb">
		    <div class="inner" style="max-width:1300px;">
		      <div class="top">
		        <div class="title" id = "modalTitle">등록할 약을 선택해주세요.</div>
		        <a href="#" id = "close" class="close"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAQdJREFUSEvFVdsNgzAMtGUGoRsgwX/LJu0kZZOqk5QBsMQGzSLYbRAgSIEqoY98OvJdfOfYCF8++GV8+C1BlmUHVb0AQBxYmUHEU1VVZZ8/qSBN0xsAHALB+zTDzLslAt0I3qYz8/Bwt4K/EZgZX+Zi/hWo6klESiKy/vTmt2aKyB4RC1dWH4lM0zR5XdcmSZK4I4G+U7rYfQuBzZ2QRFEU2zZcAg81eSCxAGvgwQTjDzSSa/ZD+njQSjTW3AYcT15IvAgQMXc0d43fZrKqFiJyJaIxUEtCROdnhcetXeQ9Pbwk8kb/9yz6xLgumTmfHdfdwrHGhe6E9YUTove7nN/u5HevCbl/AEcnshnv36ogAAAAAElFTkSuQmCC"/></a>
		      </div>
		      <div class="ct" id = "modalContent">
		      로딩 중...
		      </div>
		    </div>
		  </div>
		</div>
	<%@include file = "footer.jsp" %>
</body>
</html>