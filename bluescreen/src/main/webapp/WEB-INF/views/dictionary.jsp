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
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<script>
	$(function(){
		if($("#category").val() == "none"){
			$("#categoryDetail").html('<option value = "none"></option>');
		}else if($("#category").val() == "drug"){
			let optionHtml = "";
			optionHtml += '<option value = "itemName" class = \'selectList\' <c:if test="${categoryDetail == \'itemName\' }">selected</c:if>>제품명</option>';
			optionHtml += '<option value = "entpName" class = \'selectList\' <c:if test="${categoryDetail == \'entpName\' }">selected</c:if>>회사명</option>';
			optionHtml += '<option value = "efcyQesitm" class = \'selectList\' <c:if test="${categoryDetail == \'efcyQesitm\' }">selected</c:if>>효능</option>';
			optionHtml += '<option value = "atpn" class = \'selectList\' <c:if test="${categoryDetail == \'atpn\' }">selected</c:if>>주의사항</option>';
			$("#categoryDetail").html(optionHtml);
		}
	})
	
	function doSelectBig() {
		if ($("#category").val() == "disease") {
			location.href = "dict?category=disease"
					
		} else if ($("#category").val() == "drug") {
			location.href = "dict?category=drug"

		} else {
			location.href = "dict"

		}
	}
	
	function searchBtn(){
		location.href = "dict?category=${category}&textBox="+$("#textBox").val()+"&categoryDetail="+$("#categoryDetail").val()+"&onlyBookMark=${onlyBookMark}";
	}
	
	function enterKey(){
		if (event.keyCode === 13) {
			location.href = "dict?category=${category}&textBox="+$("#textBox").val()+"&categoryDetail="+$("#categoryDetail").val()+"&onlyBookMark=${onlyBookMark}";
		}
	}
	
	
	function enableBookMarkDrug(dno){
		if(!("${sessionUno}" == null || "${sessionUno}" == "")){
			$(function(){
				if(confirm(dno+"번을 즐겨찾기로 등록하시겠습니까?")){
					$.ajax({
						url: "/enableBookMarkDrug",
						method: "post",
						data: {"uno":"${sessionUno}", "dno":dno},
						success: function(data){
							if(data == "성공"){
								$('#bookMarkDrug'+dno).html('<img onclick = "disableBookMarkDrug('+dno+')" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUFJREFUSEu1lYGNgzAMRWNYpLcBShiATtIySdtJrptcByARG5RFkE9GCQLqBFNBJESLwM/2d35AHbzg4PhqE8AY86eU6qy1tTQxMUBrfQWAXwoMAOemaV4SiBjgs6980Je19rwboCzLChGpPeOSViGqYJF9gIiqWAUURXHK8/zNtKMDgHpNixFAgbIsuwDASSlFF63pb67lnX84u/d9/2jbdng2AiJtkOjIgq21PzOA1voGAPdvI06/Q8TaOfecAejPHpDldH2IPN1QG6thRWen6AtIdKKiY2qMIVu4SqpIbboUgHZusIYkBxHvzrkH91IKgJLs17xpNw3C3C+T2gSgVni7/tgvMR1YACPwbEq8P5FGwVKI++QOohiAzG34OCbgxLtCNXTSDfYwXakKKolb+mpopNmjdNWuN0wS++rhgH9ykY0ZQa97UwAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
							} // if
						},
						error: function(){
							console.log("error");
						} // error
					}); // ajax
				}else{
					alert("취소되었습니다.");
				} // else
			}); // jquery
		}else{
			if(confirm("로그인 하셔야 이용할 수 있습니다.\n로그인 하시겠습니까?")){
				location.href = "/login";		
			}
		} // else
	} // enableBookMarkMedicine
	
	function disableBookMarkDrug(dno){
		$(function(){
			if(confirm(dno+"번을 즐겨찾기에서 삭제하시겠습니까?")){
				$.ajax({
					url: "/disableBookMarkDrug",
					method: "post",
					data: {"uno":"${sessionUno}", "dno":dno},
					success: function(data){
						if(data == "성공"){
							$('#bookMarkDrug'+dno).html('<img onclick = "enableBookMarkDrug('+dno+')" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUdJREFUSEu1ldFRAzEMRDedQCdQCVAJUAlQSegEOgEe42U2h+zoPuKZjJMbn56k1ToHXXgdLhxfewFHSZ+SHrqJ7QHcS3oZgW8lvXcgewBkfzOCEhzI2dUFEBhArlYVXYCzfxoE9lYVHcCVpI8R+Hrs/LbYSy0SQKA7Sex8WPn9NaYHsREdCGu7P/tZAlLErXgEoOcOBJjzTqQ6/1ttAh5/HrjHlO0sHLSamKyU9z1l+ISK/xktIcCAdFZWfzJdlchpqA7EwUvRZ1PUde0yeNWibIcnJadn2y4DpqZb+cAv/wlWiOEkpq1cAb7CXPSXiSEgO1AmzVfI1NUdDTiT02Vj0bq34XISsMtPCj0HILN0c95F6WDOlDrMAO6ts9mOYOXkchhmAC4zu3QmoO8uV1W2aVUBAlrMlZstfvlX2rmuO1fF9MzFAd+iKVUZhSjEFAAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
						}
					},
					error: function(){
						console.log("error");
					}
				});
			}else{
				alert("취소되었습니다.");
			}
		});
	}
	
	function onlyBookMark(){
		if($("#onlyBookMark").is(":checked")){
			location.href = "dict?category=${category}&page=1&textBox=${textBox}&categoryDetail=${categoryDetail}&onlyBookMark=1";
		}else{
			location.href = "dict?category=${category}&page=1&textBox=${textBox}&categoryDetail=${categoryDetail}&onlyBookMark=0";
		}
	}
	
</script>
<script type="text/javascript">
	
function modalUp(dno){
	$.ajax({
		url: "/getDrugOne",
		method: "post",
		data: {"dno":dno},
		success: function(data){
			$(function(){
				const modal = document.querySelector("#modal");
				const btn = document.querySelector("#modal-btn");
				const close = document.querySelector(".close");
				$("#modal").css("display","block");
				if((data.drug.defendOverInsert>=1 &&data.drug.defendOverInsert<=99999) || "${sessionId}"=="" ){
					$("#modalTitle").text(data.drug.item_name);
				}else{
					$("#modalTitle").html(data.drug.item_name+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' onclick=\"myMediUp('${sessionUno}','"+dno+"')\" value='등록' style='background:#0A47FF; color:#fff; border:none; margin-top:-10px;'/>");
				}
					
					let mContent = "<table class = 'modalTable'>";
					
					
					if(data.drug.entp_name != null){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">회사명</td>';
						mContent += '<td>'+data.drug.entp_name+'</td>';
						mContent += '</tr>';
					}
					
					if(data.drug.item_name != null){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">제품명</td>';
						mContent += '<td>'+data.drug.item_name+'</td>';
						mContent += '</tr>';
					}
					
					if(data.drug.item_seq != null){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">품목기준코드</td>';
						mContent += '<td>'+data.drug.item_seq+'</td>';
						mContent += '</tr>';
					}
					
					if(data.drug.chart != null){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">성상</td>';
						mContent += '<td>'+data.drug.chart+'</td>';
						mContent += '</tr>';
					}
					
					if(data.drug.valid_term != null){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">소비기간</td>';
						mContent += '<td>'+data.drug.valid_term+'</td>';
						mContent += '</tr>';
					}
					
					if(data.drug.storage_method != null){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">보관법</td>';
						mContent += '<td>'+data.drug.storage_method+'</td>';
						mContent += '</tr>';
					}
					
					if(data.drug.atc_code != null){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">분류코드</td>';
						mContent += '<td>'+data.drug.atc_code+'</td>';
						mContent += '</tr>';
					}
					
					if(data.drugEffect.length != 0){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">효능</td>';
						mContent += '<td>';
						
						for(let i = 0; i < data.drugEffect.length; i++){
							if(data.drugEffect[i].article_title != null){
								mContent += data.drugEffect[i].article_title+'<br>';
							}else if(data.drugEffect[i].article_content != null){
								mContent += data.drugEffect[i].article_content+'<br>';
							}
						}
						
						mContent += '</td></tr>';
					}
					
					if(data.drugGeneralWarning.length != 0){
						mContent += '<tr>';
						mContent += '<td class = "modalTitleTD">주의사항</td>';
						mContent += '<td>';
						
						for(let i = 0; i < data.drugGeneralWarning.length; i++){
							if(data.drugGeneralWarning[i].text != null){
								mContent += data.drugGeneralWarning[i].text+'<br>';
							}
						}
						mContent += '</td></tr>';
					}
					if(data.drug.imageURL == "" || data.drug.imageURL == null){
						
					}else{
						mContent += '<tr><td class = "modalTitleTD">이미지</td>';
						mContent += '<td><img src = "'+data.drug.imageURL+'"></td>';
					}
					mContent += '</table>';
					$("#modalContent").html(mContent);
				});
			},
			error: function(status){
				console.log(status);
			}
		});
	}
	
	$(function(){
		$("#close").click(function(){
			$("#modal").css("display","none");
		});
	});
	
	function myMediUp(uno, dno){
		if(confirm("처방 받으신 약입니까?")){
			let myMdate = prompt("약 복용 기간을 입력해주세요\nex) 30일 처방 : 30일");
			$.ajax({
				url:"/myMediUp",
				method:"post",
				data:{"uno":uno,"dno":dno,"myMdate":myMdate},
				success:function(data){
					if(data=="성공"){
						alert("복용중인 약으로 등록되었습니다.");
						$("#modal").css("display","none");
					}else{
						alert("이미 등록된 약입니다.");
					}
				},
				error:function(status){
					alert("fail");
					console.log(status);
				}
			});
		}else{
			$.ajax({
				url:"/myMediUp",
				method:"post",
				data:{"uno":uno,"dno":dno,"myMdate":""},
				success:function(data){
					if(data=="성공"){
						alert("복용중인 약으로 등록되었습니다.");
						$("#modal").css("display","none");
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
</script>


</head>
<body>

	<%@include file="header.jsp"%>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<link rel="stylesheet" href="/css/notice_list.css">
	<link rel="stylesheet" href="/css/lista.css">
	<section style="height: 600px; margin: 150px">

		<h1 style="margin-top: 40px; margin-bottom: 50px; font-size: 60px; left: 50%; font-weight: bold; font-weight: 700;">의약품 사전</h1>
		<div class="wrapper">
			<table id = "searchToolTable">
				<tr>
					<td>
				<select name="category" id="category" onchange="doSelectBig()"
					style="">
					<option value="drug" class = "selectList" <c:if test="${category == 'drug' }">selected</c:if>>의약품</option>
				</select>
					</td>
					<td>
				<select name="categoryDetail" id="categoryDetail"
					style="">
					<option value="none"></option>
				</select>
					</td>
					<td>
					<input type="text" id="textBox" onkeydown="enterKey()" value = "${textBox }" style = "top: 15%" placeholder = "검색어를 입력해주세요">
					</td>
					<td>
					<img style = "height: 40px; margin-bottom: 12px;" onclick = "searchBtn()" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAqRJREFUaEPtmN1t2zAQgHWy96izgSH6vfEkjSdJMkm9SZ13U/AG1SISmwvIgqKOFCmeIhmwAD8Y4N93/3dQ3PkHd/7+4gGwtAYnaWC/3+/KsvwFAM9FUez0r9EwjVLqUpblx/V6vcwNmARwOByelVK/9YNj3oYw73Vdn2MWT1kTBYAS32w2+HCU+JSvadv2eLvdjJamnEHuGQXQUv/DcOMs2ggCjDz+Ytu69gvU0A/tG5S2GgA4cfqGF0CbzV9C8lGP0PtRc+jk9sdqTl4AIQRe3pOiUuqtruv3WHOyotWbCyGlfIo9J7SOBKiq6gUA0Gn/f6mPt/dWVfUKAD0IADhymBIJIIRA07FV3+RIzBPFss40AhoAUI7LIS3KpzjOHQAQ6j5LKU8c9ur6VY5ZejUwxyXmMkI4FynlMUc4Aw249q+UOnGVAoR5ZvsBBaBsibRt+8RVAhB+cF8AKBghRE9AUsrRciYpD7gmxBEpLB9w88ssGuhlYI5IEXDi7AgXE0azI4UBEEJgdn8x/zmEMwCgHI2jgqQSJEeA8JUSbiGXbatEcciiWRLA0wdMttdvL+Z0uBtoQSl1Timn8Rzq8Z9lOov08fyxhoZsSGJ8ItDQFBy2762F7KQR6so+owk26NjnfnRd9zU+2W63u67rfgZaSlzG2huPZsGQJBOLMDORMH0GgiSbpHvnKABuYBirfNm8JzhkgUQBOKXAa85gi+q19fmTolwSgAHJGS1S/XZOZp4EkGj7veVj5phaXnw7gM4Ng6mHTZkCsQhAYF6UPMZZBMBENj2id4deSRCLAQR6BNfFgtFpcYBAvWSDeCFWARABsX6AAMT6TYhIkMaxR7PzakyIgNjFjDRXB2BCbOwwbZUAKaXKAyBFWnOsfWhgDqmmnPkPtQu+QFAPe1oAAAAASUVORK5CYII="/>
					</td>
				</tr>
			</table>
		</div>
		<!-- <button id="modal-btn" style = "width: 150px;">자바스크립트 모달창</button> -->
		<div id="modal" class="dialog">
		  <div class="tb">
		    <div class="inner" style="max-width:1300px;">
		      <div class="top">
		        <div class="title" id = "modalTitle">모달창 제목</div>
		        <a href="#" id = "close" class="close"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAQdJREFUSEvFVdsNgzAMtGUGoRsgwX/LJu0kZZOqk5QBsMQGzSLYbRAgSIEqoY98OvJdfOfYCF8++GV8+C1BlmUHVb0AQBxYmUHEU1VVZZ8/qSBN0xsAHALB+zTDzLslAt0I3qYz8/Bwt4K/EZgZX+Zi/hWo6klESiKy/vTmt2aKyB4RC1dWH4lM0zR5XdcmSZK4I4G+U7rYfQuBzZ2QRFEU2zZcAg81eSCxAGvgwQTjDzSSa/ZD+njQSjTW3AYcT15IvAgQMXc0d43fZrKqFiJyJaIxUEtCROdnhcetXeQ9Pbwk8kb/9yz6xLgumTmfHdfdwrHGhe6E9YUTove7nN/u5HevCbl/AEcnshnv36ogAAAAAElFTkSuQmCC"/></a>
		      </div>
		      <div class="ct" id = "modalContent">
		      모달 창 내용
		      </div>
		    </div>
		  </div>
		</div>
		
		<label class="switch">
  			<input type="checkbox"  id = "onlyBookMark" name = "onlyBookMark" onclick = "onlyBookMark()" <c:if test="${onlyBookMark == 1 }">checked</c:if>>
  			<span class="slider round" ></span>
		</label>
		<label for = "switch">즐겨찾기만 보기</label>
		
		<div id="tableLocate">
			<c:if test="${category == 'drug' }">
				<table>
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="47%">
						<col width="10%">
						<col width="3%">
					</colgroup>
					<style>
						tr{
							height: 30px;
						}
						th, td{
							font-size: 20px; text-align: center; line-height: 30px;
						}
					</style>
					<tr>
						<th>번호</th>
						<th>품목기준코드</th>
						<th>업체명</th>
						<th>제품명</th>
						<th>사진여부</th>
						<th></th>
					</tr>
					<tbody id = "tbody">
						<c:forEach var = "d" items = "${list }">
							<tr class = "drugTr">
								<td onclick = "modalUp(${d.dno})">${d.dno }</td>
								<td onclick = "modalUp(${d.dno})">${d.item_seq }</td>
								<td onclick = "modalUp(${d.dno})">${d.entp_name }</td>
								<td onclick = "modalUp(${d.dno})">${d.item_name }</td>
								<c:if test="${d.imageURL != null }">
									<td><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAOBJREFUSEvtlWEOgyAMhQsncSeZ3kSM99h2D1O4ybzJuIgwTcSIYVNK2LJk/CXtl/fy2jLI/Fjm/vBZQNu2pTFGAkBBVKY556Lrut7VewqEEHfGWEls7so0Ip6CgKZp7PSBiCTrQvVeoz/gNyyao1wgotqmLVlBXdcF5/wBANoYUyml9BqSDNjMiZf3CUQCzJacrbVlYAiv48zcnIpowMqSV8PtrYZowMHVsVgVBTjY3ClTiCiiAJSF931ApC1BkWPaeillFVzXUySHYbgk3IT3B4fi+14N6bDsNV3/Zwc8ARlUvxnD4yC4AAAAAElFTkSuQmCC"/></td>
								</c:if>
								<c:if test="${d.imageURL == null }">
									<td></td>
								</c:if>
								<td id = "bookMarkDrug${d.dno }"><img onclick = "enableBookMarkDrug(${d.dno})" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUdJREFUSEu1ldFRAzEMRDedQCdQCVAJUAlQSegEOgEe42U2h+zoPuKZjJMbn56k1ToHXXgdLhxfewFHSZ+SHrqJ7QHcS3oZgW8lvXcgewBkfzOCEhzI2dUFEBhArlYVXYCzfxoE9lYVHcCVpI8R+Hrs/LbYSy0SQKA7Sex8WPn9NaYHsREdCGu7P/tZAlLErXgEoOcOBJjzTqQ6/1ttAh5/HrjHlO0sHLSamKyU9z1l+ISK/xktIcCAdFZWfzJdlchpqA7EwUvRZ1PUde0yeNWibIcnJadn2y4DpqZb+cAv/wlWiOEkpq1cAb7CXPSXiSEgO1AmzVfI1NUdDTiT02Vj0bq34XISsMtPCj0HILN0c95F6WDOlDrMAO6ts9mOYOXkchhmAC4zu3QmoO8uV1W2aVUBAlrMlZstfvlX2rmuO1fF9MzFAd+iKVUZhSjEFAAAAABJRU5ErkJggg==" style = "width: 20px;"/></td>
								<c:set var="loop_flag" value="false" />
								<c:forEach var = "bm" items = "${bookMarkListDrug }">
									<c:if test="${not loop_flag }">
										<c:if test="${bm == d.dno }">
											<script>
												$("#bookMarkDrug${bm}").html('<img onclick = "disableBookMarkDrug(${d.dno})" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAARFJREFUSEu1lYERwjAIRX830U10EnUSdRLdRDfRTdTvBQ9TSEBb7nrVtuFBPpABM9sws39kARcAdwC7aGAZwBbAqTheA7hGIBkAo18Vp3ROSNeiADomQFsoiyhARy+QUBYRwALAzdgLEbuphQbQ0QYA77xo+re134TQ6vtRnmmAtQ1dEZ0PCFzynQbsXw8Ov3qs1rFPzjWA/6eAfFWXJbJuqExCpuheFWUhbkW1ypRjgaCIuU3XAmSqisXB0hxZC/CIhF6+cbt6Sg3edV9bFiB9YvWLqYMHqAWuq4QjhBrJSGHgbKzRQeQBONxksSegzC7J5jMe9Da1MuAZwIh6JxdBzNg8SiPjOlFMcZH/cqoXPwEpvzYZ5BtIZQAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
											</script>
											<c:set var="loop_flag" value="true" />
										</c:if>
									</c:if>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
		<c:if test="${category == 'drug'}">
			<ul class="page-num" id="pageBtns" style = "margin-top: 50px; margin-bottom: 50px;" >
			
			<!-- 시작페이지 이동 시작 -->
			<c:if test="${pageDto.page != 1 }">
				<a href = "dict?category=${category }&page=1&textBox=${textBox}&categoryDetail=${categoryDetail}&onlyBookMark=${onlyBookMark}"><li class="first"></li></a>
			</c:if>
			<c:if test="${pageDto.page == 1 }">
				<li class="first"></li>
			</c:if>
			<!-- 시작페이지 이동 끝 -->
			<!-- 이전 페이지 이동 시작 -->
			<c:if test="${pageDto.page != 1 }">
				<a href = "dict?category=${category }&page=${pageDto.page - 1}&textBox=${textBox}&categoryDetail=${categoryDetail}&onlyBookMark=${onlyBookMark}"><li class="prev"></li></a>
			</c:if>
			<c:if test="${pageDto.page == 1 }">
				<li class="prev"></li>
			</c:if>
			<!-- 이전 페이지 이동 끝 -->
				<c:forEach begin = "${pageDto.startPage }" end = "${pageDto.endPage }" step = "1" var = "pNum">
					<c:if test="${pNum <= pageDto.maxPage }">
						<c:if test="${pageDto.page == pNum }">
						<li class="num"><a href = "dict?category=${category }&page=${pNum }&textBox=${textBox}&categoryDetail=${categoryDetail}&onlyBookMark=${onlyBookMark}"><div style = "margin-top:5px; font-size:16px;">
							<strong>${pNum }</strong>
						</c:if>
						<c:if test="${pageDto.page != pNum }">
						<li class="num"><a href = "dict?category=${category }&page=${pNum }&textBox=${textBox}&categoryDetail=${categoryDetail}&onlyBookMark=${onlyBookMark}"><div style = "margin-top:5px; font-size:16px;">
							${pNum }
						</c:if>
						</div></a></li>
					</c:if>
				</c:forEach>
			<!-- 다음 페이지 이동 시작 -->
			<c:if test="${pageDto.page != pageDto.maxPage }">
				<a href = "dict?category=${category }&page=${pageDto.page + 1}&textBox=${textBox}&categoryDetail=${categoryDetail}&onlyBookMark=${onlyBookMark}"><li class="next"></li></a>
			</c:if>
			<c:if test="${pageDto.page == pageDto.maxPage }">
				<li class="next"></li>
			</c:if>
			<!-- 다음 페이지 이동 끝 -->
			<!-- 마지막 페이지 이동 시작 -->
			<c:if test="${pageDto.page != pageDto.maxPage }">
				<a href = "dict?category=${category }&page=${pageDto.maxPage}&textBox=${textBox}&categoryDetail=${categoryDetail}&onlyBookMark=${onlyBookMark}"><li class="last"></li></a>
			</c:if>
			<c:if test="${pageDto.page == pageDto.maxPage }">
				<li class="last"></li>
			</c:if>
			</ul>
		</c:if>

		<footer style="margin-bottom: 50px; margin-top: 50px; text-align: left;">
			<%@include file="footer.jsp"%>
			<br>
		</footer>
	</section>
</body>
</html>