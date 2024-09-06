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
		}else if($("#category").val() == "disease"){
			let optionHtml = "";
			optionHtml += '<option value = "sickCd" class = \'selectList\' <c:if test="${categoryDetail == \'sickCd\' }">selected</c:if>>질병코드</option>';
			optionHtml += '<option value = "sickNm" class = \'selectList\' <c:if test="${categoryDetail == \'sickNm\' }">selected</c:if>>질병명</option>';
			$("#categoryDetail").html(optionHtml);
			/* for(int i = 0; i < bookMarkList.length; i++){
				$("#bookMarkDisease"+bookMarkList[i]).html("");f
			} */
		}else if($("#category").val() == "medicine"){
			let optionHtml = "";
			optionHtml += '<option value = "entpName" class = \'selectList\' <c:if test="${categoryDetail == \'entpName\' }">selected</c:if>>회사명</option>';
			optionHtml += '<option value = "itemName" class = \'selectList\' <c:if test="${categoryDetail == \'itemName\' }">selected</c:if>>제품명</option>';
			optionHtml += '<option value = "efcyQesitm" class = \'selectList\' <c:if test="${categoryDetail == \'efcyQesitm\' }">selected</c:if>>효능</option>';
			optionHtml += '<option value = "atpn" class = \'selectList\' <c:if test="${categoryDetail == \'atpn\' }">selected</c:if>>주의사항</option>';
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
	
	function enableBookMarkDisease(dno){
		if("${sessionUno}" != null){
			$(function(){
				if(confirm(dno+"번을 즐겨찾기로 등록하시겠습니까?")){
					$.ajax({
						url: "/enableBookMarkDisease",
						method: "post",
						data: {"uno":"${sessionUno}", "dno":dno},
						success: function(data){
							console.log(data);
							if(data == "성공"){
								$('#bookMarkDisease'+dno).html('<img onclick = "disableBookMarkDisease('+dno+')" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUFJREFUSEu1lYGNgzAMRWNYpLcBShiATtIySdtJrptcByARG5RFkE9GCQLqBFNBJESLwM/2d35AHbzg4PhqE8AY86eU6qy1tTQxMUBrfQWAXwoMAOemaV4SiBjgs6980Je19rwboCzLChGpPeOSViGqYJF9gIiqWAUURXHK8/zNtKMDgHpNixFAgbIsuwDASSlFF63pb67lnX84u/d9/2jbdng2AiJtkOjIgq21PzOA1voGAPdvI06/Q8TaOfecAejPHpDldH2IPN1QG6thRWen6AtIdKKiY2qMIVu4SqpIbboUgHZusIYkBxHvzrkH91IKgJLs17xpNw3C3C+T2gSgVni7/tgvMR1YACPwbEq8P5FGwVKI++QOohiAzG34OCbgxLtCNXTSDfYwXakKKolb+mpopNmjdNWuN0wS++rhgH9ykY0ZQa97UwAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
							} // if
						},
						error: function(){
							console.log("error");
						} // error
					}); // ajax
				}else{
					alert("취소되었습니다.");
				} // else
			}); //jquery
		}else{
			if(confirm("로그인 하셔야 이용할 수 있습니다.\n로그인 하시겠습니까?")){
				location.href = "/";		
			}
		}
	}
	
	function disableBookMarkDisease(dno){
		$(function(){
			if(confirm(dno+"번을 즐겨찾기에서 삭제하시겠습니까?")){
				$.ajax({
					url: "/disableBookMarkDisease",
					method: "post",
					data: {"uno":3, "dno":dno},
					success: function(data){
						console.log(data);
						if(data == "성공"){
							$('#bookMarkDisease'+dno).html('<img onclick = "enableBookMarkDisease('+dno+')" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUdJREFUSEu1ldFRAzEMRDedQCdQCVAJUAlQSegEOgEe42U2h+zoPuKZjJMbn56k1ToHXXgdLhxfewFHSZ+SHrqJ7QHcS3oZgW8lvXcgewBkfzOCEhzI2dUFEBhArlYVXYCzfxoE9lYVHcCVpI8R+Hrs/LbYSy0SQKA7Sex8WPn9NaYHsREdCGu7P/tZAlLErXgEoOcOBJjzTqQ6/1ttAh5/HrjHlO0sHLSamKyU9z1l+ISK/xktIcCAdFZWfzJdlchpqA7EwUvRZ1PUde0yeNWibIcnJadn2y4DpqZb+cAv/wlWiOEkpq1cAb7CXPSXiSEgO1AmzVfI1NUdDTiT02Vj0bq34XISsMtPCj0HILN0c95F6WDOlDrMAO6ts9mOYOXkchhmAC4zu3QmoO8uV1W2aVUBAlrMlZstfvlX2rmuO1fF9MzFAd+iKVUZhSjEFAAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
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
	
	function enableBookMarkMedicine(mno){
		if("${sessionUno}" != null){
			$(function(){
				if(confirm(mno+"번을 즐겨찾기로 등록하시겠습니까?")){
					$.ajax({
						url: "/enableBookMarkMedicine",
						method: "post",
						data: {"uno":3, "mno":mno},
						success: function(data){
							console.log(data);
							if(data == "성공"){
								$('#bookMarkMedicine'+mno).html('<img onclick = "disableBookMarkMedicine('+mno+')" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUFJREFUSEu1lYGNgzAMRWNYpLcBShiATtIySdtJrptcByARG5RFkE9GCQLqBFNBJESLwM/2d35AHbzg4PhqE8AY86eU6qy1tTQxMUBrfQWAXwoMAOemaV4SiBjgs6980Je19rwboCzLChGpPeOSViGqYJF9gIiqWAUURXHK8/zNtKMDgHpNixFAgbIsuwDASSlFF63pb67lnX84u/d9/2jbdng2AiJtkOjIgq21PzOA1voGAPdvI06/Q8TaOfecAejPHpDldH2IPN1QG6thRWen6AtIdKKiY2qMIVu4SqpIbboUgHZusIYkBxHvzrkH91IKgJLs17xpNw3C3C+T2gSgVni7/tgvMR1YACPwbEq8P5FGwVKI++QOohiAzG34OCbgxLtCNXTSDfYwXakKKolb+mpopNmjdNWuN0wS++rhgH9ykY0ZQa97UwAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
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
				location.href = "/";		
			}
		} // else
	} // enableBookMarkMedicine
	
	function disableBookMarkMedicine(mno){
		$(function(){
			if(confirm(mno+"번을 즐겨찾기에서 삭제하시겠습니까?")){
				$.ajax({
					url: "/disableBookMarkMedicine",
					method: "post",
					data: {"uno":3, "mno":mno},
					success: function(data){
						console.log(data);
						if(data == "성공"){
							$('#bookMarkMedicine'+mno).html('<img onclick = "enableBookMarkMedicine('+mno+')" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUdJREFUSEu1ldFRAzEMRDedQCdQCVAJUAlQSegEOgEe42U2h+zoPuKZjJMbn56k1ToHXXgdLhxfewFHSZ+SHrqJ7QHcS3oZgW8lvXcgewBkfzOCEhzI2dUFEBhArlYVXYCzfxoE9lYVHcCVpI8R+Hrs/LbYSy0SQKA7Sex8WPn9NaYHsREdCGu7P/tZAlLErXgEoOcOBJjzTqQ6/1ttAh5/HrjHlO0sHLSamKyU9z1l+ISK/xktIcCAdFZWfzJdlchpqA7EwUvRZ1PUde0yeNWibIcnJadn2y4DpqZb+cAv/wlWiOEkpq1cAb7CXPSXiSEgO1AmzVfI1NUdDTiT02Vj0bq34XISsMtPCj0HILN0c95F6WDOlDrMAO6ts9mOYOXkchhmAC4zu3QmoO8uV1W2aVUBAlrMlZstfvlX2rmuO1fF9MzFAd+iKVUZhSjEFAAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
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
.selectList{
	font-weight: 600;
}

.emptystar{
			background-color: yellow;
			background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAZZJREFUSEu1VYFtgzAQ9CcMQjeIgAHIJA2TpExSOkkzQIyyQRkk5tO3/NbHMdiViiVkQObv/+/uAbXxgo3jqz8B1HX9rZSatNZdbmLZAFVVnQDgkwIDwPF6vV5yQLIBXPatC3rRWh//DaBpmhYRqT1+5VaRVQFnj4gfrkW0Z1WRBDgcDuV+v/+hwMaYN9rd8wQAXYoLD0CBdrvdOwCUSim6aMn7gdVT1zWRfSJFuXNPuzGmv91u9p0HCEgM+ZuMMUf+yFVFnHAiL+e11rZaD1BV1RkAbI+pvwDQ3+/3iYPGFENA9L4oihIRz7/fWZUhYjeO4/AEQA8ShAgdx7HPkaKsPlTXC8nSUDkgIniU9KiKcl2bCv7SItkOoRSvnrBdDLBmukUfCHN5wiIAVq5rrVwDQDYXKclJkwKWbDAxQhZdneRAaw2BhAl3QsRhnucvdjXrPqwyBUAj2bs5mEUWiB2/xEMUQBDMCT1JcMHJUTEsAdBwsy5dIlDMLnY//enseJBrrYI2Z1oK8qO/0uS4zhkVa2c2B3gAO/HxGSEbSvkAAAAASUVORK5CYII=/>");
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

		<h1 style="margin-top: 40px; margin-bottom: 50px; font-size: 60px; left: 50%; font-weight: bold; font-weight: 700;">질병
			및 의약품 사전</h1>
		<div class="wrapper">
				<select name="category" id="category" onchange="doSelectBig()"
					style="position: absolute; top: 50%; left: 35%; width: 160px; height: 50px; margin-left: -180px; margin-top: -20px; padding: 5px; border: 1px solid #666666; font-family: inherit; -webkit-appearance: none; -moz-appearance: none; appearance: none; font-size: 23px; font-weight: 600;">
					<option value="disease" class = "selectList" <c:if test="${category == 'disease' }">selected</c:if>>질병</option>
					<option value="medicine" class = "selectList" <c:if test="${category == 'medicine' }">selected</c:if>>의약품</option>
				</select>
				<select name="categoryDetail" id="categoryDetail"
					style="position: absolute; top: 50%; left: 45.5%; width: 220px; height: 50px; /* margin-left: -185px; */ margin-top: -20px; padding: 5px; border: 1px solid #666666; font-family: inherit; -webkit-appearance: none; -moz-appearance: none; appearance: none; font-size: 23px; font-weight: 600;">
					<option value="none" <%-- <c:if test="${category == 'disease' }">selected</c:if> --%>></option>
				</select>

				<div class="title" style = "left: 52.5%; width: 500px;">
					<input type="text" id="textBox" onkeydown="enterKey()" value = "${textBox }" style = "width: 300px; height: 49px; left: 54.15%; font-size: 23px; font-weight: 600;">
				</div>

				<button type="button" onclick = "searchBtn()" style = "left: 61%; background-color: #ffffff; /* border: 1px solid black; */ height: 49px; width: 49px;">
					<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAqRJREFUaEPtmN1t2zAQgHWy96izgSH6vfEkjSdJMkm9SZ13U/AG1SISmwvIgqKOFCmeIhmwAD8Y4N93/3dQ3PkHd/7+4gGwtAYnaWC/3+/KsvwFAM9FUez0r9EwjVLqUpblx/V6vcwNmARwOByelVK/9YNj3oYw73Vdn2MWT1kTBYAS32w2+HCU+JSvadv2eLvdjJamnEHuGQXQUv/DcOMs2ggCjDz+Ytu69gvU0A/tG5S2GgA4cfqGF0CbzV9C8lGP0PtRc+jk9sdqTl4AIQRe3pOiUuqtruv3WHOyotWbCyGlfIo9J7SOBKiq6gUA0Gn/f6mPt/dWVfUKAD0IADhymBIJIIRA07FV3+RIzBPFss40AhoAUI7LIS3KpzjOHQAQ6j5LKU8c9ur6VY5ZejUwxyXmMkI4FynlMUc4Aw249q+UOnGVAoR5ZvsBBaBsibRt+8RVAhB+cF8AKBghRE9AUsrRciYpD7gmxBEpLB9w88ssGuhlYI5IEXDi7AgXE0azI4UBEEJgdn8x/zmEMwCgHI2jgqQSJEeA8JUSbiGXbatEcciiWRLA0wdMttdvL+Z0uBtoQSl1Timn8Rzq8Z9lOov08fyxhoZsSGJ8ItDQFBy2762F7KQR6so+owk26NjnfnRd9zU+2W63u67rfgZaSlzG2huPZsGQJBOLMDORMH0GgiSbpHvnKABuYBirfNm8JzhkgUQBOKXAa85gi+q19fmTolwSgAHJGS1S/XZOZp4EkGj7veVj5phaXnw7gM4Ng6mHTZkCsQhAYF6UPMZZBMBENj2id4deSRCLAQR6BNfFgtFpcYBAvWSDeCFWARABsX6AAMT6TYhIkMaxR7PzakyIgNjFjDRXB2BCbOwwbZUAKaXKAyBFWnOsfWhgDqmmnPkPtQu+QFAPe1oAAAAASUVORK5CYII="/>
				</button>
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

		<div id="tableLocate">
			<c:if test="${category == 'disease' }">
				<table>
					<colgroup>
						<col width="15%">
						<col width="15%">
						<col width="65%">
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
						<th>질병코드</th>
						<th>질병명</th>
						<th></th>
					</tr>
					<tbody id = "tbody">
						<c:forEach var = "d" items = "${list }">
							<tr style = "height: 30px;">
								<td>${d.dno}</td>
								<td>${d.sickCd}</td>
								<td>${d.sickNm}</td>
								<td id = "bookMarkDisease${d.dno }"><img onclick = "enableBookMarkDisease(${d.dno})" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUdJREFUSEu1ldFRAzEMRDedQCdQCVAJUAlQSegEOgEe42U2h+zoPuKZjJMbn56k1ToHXXgdLhxfewFHSZ+SHrqJ7QHcS3oZgW8lvXcgewBkfzOCEhzI2dUFEBhArlYVXYCzfxoE9lYVHcCVpI8R+Hrs/LbYSy0SQKA7Sex8WPn9NaYHsREdCGu7P/tZAlLErXgEoOcOBJjzTqQ6/1ttAh5/HrjHlO0sHLSamKyU9z1l+ISK/xktIcCAdFZWfzJdlchpqA7EwUvRZ1PUde0yeNWibIcnJadn2y4DpqZb+cAv/wlWiOEkpq1cAb7CXPSXiSEgO1AmzVfI1NUdDTiT02Vj0bq34XISsMtPCj0HILN0c95F6WDOlDrMAO6ts9mOYOXkchhmAC4zu3QmoO8uV1W2aVUBAlrMlZstfvlX2rmuO1fF9MzFAd+iKVUZhSjEFAAAAABJRU5ErkJggg==" style = "width: 20px;"/></td>
								<c:set var="loop_flag" value="false" />
								<c:forEach var = "bm" items = "${bookMarkListDisease }">
									<c:if test="${not loop_flag }">
										<c:if test="${bm == d.dno }">
											<script>
												$("#bookMarkDisease${bm}").html('<img onclick = "disableBookMarkDisease(${d.dno})" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAARFJREFUSEu1lYERwjAIRX830U10EnUSdRLdRDfRTdTvBQ9TSEBb7nrVtuFBPpABM9sws39kARcAdwC7aGAZwBbAqTheA7hGIBkAo18Vp3ROSNeiADomQFsoiyhARy+QUBYRwALAzdgLEbuphQbQ0QYA77xo+re134TQ6vtRnmmAtQ1dEZ0PCFzynQbsXw8Ov3qs1rFPzjWA/6eAfFWXJbJuqExCpuheFWUhbkW1ypRjgaCIuU3XAmSqisXB0hxZC/CIhF6+cbt6Sg3edV9bFiB9YvWLqYMHqAWuq4QjhBrJSGHgbKzRQeQBONxksSegzC7J5jMe9Da1MuAZwIh6JxdBzNg8SiPjOlFMcZH/cqoXPwEpvzYZ5BtIZQAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
											</script>
											<c:set var="loop_flag" value="true" />
										</c:if>
									</c:if>
								</c:forEach>
							</tr>
						</c:forEach>
						
					</tbody>
<!-- 					<script type="text/javascript">
		$(".star").attr({'src':'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAZZJREFUSEu1VYFtgzAQ9CcMQjeIgAHIJA2TpExSOkkzQIyyQRkk5tO3/NbHMdiViiVkQObv/+/uAbXxgo3jqz8B1HX9rZSatNZdbmLZAFVVnQDgkwIDwPF6vV5yQLIBXPatC3rRWh//DaBpmhYRqT1+5VaRVQFnj4gfrkW0Z1WRBDgcDuV+v/+hwMaYN9rd8wQAXYoLD0CBdrvdOwCUSim6aMn7gdVT1zWRfSJFuXNPuzGmv91u9p0HCEgM+ZuMMUf+yFVFnHAiL+e11rZaD1BV1RkAbI+pvwDQ3+/3iYPGFENA9L4oihIRz7/fWZUhYjeO4/AEQA8ShAgdx7HPkaKsPlTXC8nSUDkgIniU9KiKcl2bCv7SItkOoRSvnrBdDLBmukUfCHN5wiIAVq5rrVwDQDYXKclJkwKWbDAxQhZdneRAaw2BhAl3QsRhnucvdjXrPqwyBUAj2bs5mEUWiB2/xEMUQBDMCT1JcMHJUTEsAdBwsy5dIlDMLnY//enseJBrrYI2Z1oK8qO/0uS4zhkVa2c2B3gAO/HxGSEbSvkAAAAASUVORK5CYII='});
		$(".fullstar").attr({'src':'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUFJREFUSEu1lYGNgzAMRWNYpLcBShiATtIySdtJrptcByARG5RFkE9GCQLqBFNBJESLwM/2d35AHbzg4PhqE8AY86eU6qy1tTQxMUBrfQWAXwoMAOemaV4SiBjgs6980Je19rwboCzLChGpPeOSViGqYJF9gIiqWAUURXHK8/zNtKMDgHpNixFAgbIsuwDASSlFF63pb67lnX84u/d9/2jbdng2AiJtkOjIgq21PzOA1voGAPdvI06/Q8TaOfecAejPHpDldH2IPN1QG6thRWen6AtIdKKiY2qMIVu4SqpIbboUgHZusIYkBxHvzrkH91IKgJLs17xpNw3C3C+T2gSgVni7/tgvMR1YACPwbEq8P5FGwVKI++QOohiAzG34OCbgxLtCNXTSDfYwXakKKolb+mpopNmjdNWuN0wS++rhgH9ykY0ZQa97UwAAAABJRU5ErkJggg=='});
		/* $(".star").attr({'src':'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUFJREFUSEu1lYGNgzAMRWNYpLcBShiATtIySdtJrptcByARG5RFkE9GCQLqBFNBJESLwM/2d35AHbzg4PhqE8AY86eU6qy1tTQxMUBrfQWAXwoMAOemaV4SiBjgs6980Je19rwboCzLChGpPeOSViGqYJF9gIiqWAUURXHK8/zNtKMDgHpNixFAgbIsuwDASSlFF63pb67lnX84u/d9/2jbdng2AiJtkOjIgq21PzOA1voGAPdvI06/Q8TaOfecAejPHpDldH2IPN1QG6thRWen6AtIdKKiY2qMIVu4SqpIbboUgHZusIYkBxHvzrkH91IKgJLs17xpNw3C3C+T2gSgVni7/tgvMR1YACPwbEq8P5FGwVKI++QOohiAzG34OCbgxLtCNXTSDfYwXakKKolb+mpopNmjdNWuN0wS++rhgH9ykY0ZQa97UwAAAABJRU5ErkJggg=='}); */
		</script> -->
				</table>
			</c:if>
			<c:if test="${category == 'medicine' }">
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
						<c:forEach var = "m" items = "${list }">
							<tr class = "medicineTr">
								<td onclick = "modalUp(${m.mno})">${m.mno }</td>
								<td onclick = "modalUp(${m.mno})">${m.itemSeq }</td>
								<td onclick = "modalUp(${m.mno})">${m.entpName }</td>
								<td onclick = "modalUp(${m.mno})">${m.itemName }</td>
								<c:if test="${m.imageURL != null }">
									<td><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAOBJREFUSEvtlWEOgyAMhQsncSeZ3kSM99h2D1O4ybzJuIgwTcSIYVNK2LJk/CXtl/fy2jLI/Fjm/vBZQNu2pTFGAkBBVKY556Lrut7VewqEEHfGWEls7so0Ip6CgKZp7PSBiCTrQvVeoz/gNyyao1wgotqmLVlBXdcF5/wBANoYUyml9BqSDNjMiZf3CUQCzJacrbVlYAiv48zcnIpowMqSV8PtrYZowMHVsVgVBTjY3ClTiCiiAJSF931ApC1BkWPaeillFVzXUySHYbgk3IT3B4fi+14N6bDsNV3/Zwc8ARlUvxnD4yC4AAAAAElFTkSuQmCC"/></td>
								</c:if>
								<c:if test="${m.imageURL == null }">
									<td></td>
								</c:if>
								<td id = "bookMarkMedicine${m.mno }"><img onclick = "enableBookMarkMedicine(${m.mno})" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAUdJREFUSEu1ldFRAzEMRDedQCdQCVAJUAlQSegEOgEe42U2h+zoPuKZjJMbn56k1ToHXXgdLhxfewFHSZ+SHrqJ7QHcS3oZgW8lvXcgewBkfzOCEhzI2dUFEBhArlYVXYCzfxoE9lYVHcCVpI8R+Hrs/LbYSy0SQKA7Sex8WPn9NaYHsREdCGu7P/tZAlLErXgEoOcOBJjzTqQ6/1ttAh5/HrjHlO0sHLSamKyU9z1l+ISK/xktIcCAdFZWfzJdlchpqA7EwUvRZ1PUde0yeNWibIcnJadn2y4DpqZb+cAv/wlWiOEkpq1cAb7CXPSXiSEgO1AmzVfI1NUdDTiT02Vj0bq34XISsMtPCj0HILN0c95F6WDOlDrMAO6ts9mOYOXkchhmAC4zu3QmoO8uV1W2aVUBAlrMlZstfvlX2rmuO1fF9MzFAd+iKVUZhSjEFAAAAABJRU5ErkJggg==" style = "width: 20px;"/></td>
								<c:set var="loop_flag" value="false" />
								<c:forEach var = "bm" items = "${bookMarkListMedicine }">
									<c:if test="${not loop_flag }">
										<c:if test="${bm == m.mno }">
											<script>
												$("#bookMarkMedicine${bm}").html('<img onclick = "disableBookMarkMedicine(${m.mno})" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAARFJREFUSEu1lYERwjAIRX830U10EnUSdRLdRDfRTdTvBQ9TSEBb7nrVtuFBPpABM9sws39kARcAdwC7aGAZwBbAqTheA7hGIBkAo18Vp3ROSNeiADomQFsoiyhARy+QUBYRwALAzdgLEbuphQbQ0QYA77xo+re134TQ6vtRnmmAtQ1dEZ0PCFzynQbsXw8Ov3qs1rFPzjWA/6eAfFWXJbJuqExCpuheFWUhbkW1ypRjgaCIuU3XAmSqisXB0hxZC/CIhF6+cbt6Sg3edV9bFiB9YvWLqYMHqAWuq4QjhBrJSGHgbKzRQeQBONxksSegzC7J5jMe9Da1MuAZwIh6JxdBzNg8SiPjOlFMcZH/cqoXPwEpvzYZ5BtIZQAAAABJRU5ErkJggg==" style = "width: 20px;"/>')
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
		<c:if test="${category == 'disease' || category == 'medicine'}">
			<ul class="page-num" id="pageBtns" style = "margin-top: 50px; margin-bottom: 50px;" >
			
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
						<li class="num"><a href = "dict?category=${category }&page=${pNum }&textBox=${textBox}&categoryDetail=${categoryDetail}"><div style = "margin-top:5px; font-size:16px;">
							<strong>${pNum }</strong>
						</c:if>
						<c:if test="${pageDto.page != pNum }">
						<li class="num"><a href = "dict?category=${category }&page=${pNum }&textBox=${textBox}&categoryDetail=${categoryDetail}"><div style = "margin-top:5px; font-size:16px;">
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

		<footer style="margin-bottom: 50px; margin-top: 50px; text-align: left;">
			<%@include file="footer.jsp"%>
			<br>
		</footer>
	</section>
</body>
</html>