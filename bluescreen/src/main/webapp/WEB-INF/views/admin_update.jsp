<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Update Page</title>
<link rel="stylesheet" href="/css/main.css">
<!-- box icon -->
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.google.com/specimen/IBM+Plex+Sans+KR?subset=korean&script=Kore"
	rel="stylesheet" type="text/css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#logoImage").click(function(){
			location.href = "/";
		}); // logoImage
	}); // jquery
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

td {
	font-family: "IBM Plex Sans KR", sans-serif;
	font-weight: 400;
	font-style: normal;
}

button {
	border-radius: 20px;
	border: 2px solid #ffffff;
	cursor: pointer;
	font-family: "IBM Plex Sans KR", sans-serif;
	font-weight: 400;
	font-style: normal;
	color: #ffffff;
	background-color: #5ca08f;
}

#user_info {
	border-radius: 12px;
}

#user_info:hover {
	border-radius: 2px;
	border: 2px solid #3F80EA;
	cursor: pointer;
}
.num {
   background-color: #ffffff;
   transition-property: width, background-color, color; /* 어떤 css 프로퍼티를 transition할지 지정 */
   transition-duration: 0.1s, 0.1s; /* width와 bg-color가 2초동안 변화 */
}
.num:hover { /* 마우스를 올리면 transition발동해서 적용될 상태 */
	background-color: #cccccc; 
}
html {
  scrollbar-gutter: stable;
}
</style>
<script type="text/javascript">
	let medicine = [];
		$(function(){
			$('#img1').on({
				mouseenter: function(){
					$("#img1").attr('src',"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAABUCAYAAAAcaxDBAAAAAXNSR0IArs4c6QAABM1JREFUeF7tnItt2zAQhknEgziTNBnEbDVJk0ls04PUnaTuHhaYniECqmLxHjxKdEADBhJIOpMf/3tQomhN+6gSsKrWmjHTgCqLoAFtQJUJKJtrCm1AlQkom6tKofv9frvZbL5DH0MIL8aY7fC9TPoN/8P3t7X2stvtzspcxOZWBRoBDvAAoPQTAR+dcwepEY3rVgE6Avmm0Yk76j1ba49rKHdRoADy6elpb4zJUSNnDA593793XTcNGRwbrHMXAVpYkViHL9baw/V6PS4BtjjQ0+n0EkL4hfV6geM3sLvd7r3kbxUFejqdfoYQSsRJKZPiUIsB9d6DKiWx8tbpEMJfKImu1+sFXBXCBlDcbDbbEMLtb2MMlFjs37DWvpVSahGgApiQlc+STg7xGSAD3B8M6V76vn/VjqvqQJkwz33fd1qdEiS/i3PumTEI6KmqQBkwi6gj9pZZnh2ccx1KiniCGlDvPdSXqMuVjF/TPlOTomabVIBSSyNr7evSs5dBrX8QgUEi7DTapgLUew8Njpn3XtvVGkz0vP9OG6BC1ZFso0Y8zQZKiZtrKHMKnqjU7HiaBZTi6jXAjHC99xDjIdbPfbI9KQsopk7NYC9x9XvXEBJVlkrFQAnqPDvnXrVAaNohCEGcPMVAsTKpJlcXxFOxGHKAhoRqstxGU41zthCVimdQIqBYcO/7/llrOlkKLpb1pR4mBZqaFVWvzlHWT90RE7m9FGiqkO/WflBGVTXiaSK3ZwP9Cu4+uYkyOy2VuL020Idxd6Lbs72NDTRVGNdYyGPur90fNlCk/mSPKNbh0seRCQo7MUmAzmZGScwpDQyzjwBlJyYJ0NkM/wj1J3PW1IBiimxAuYSY5yMzpkUU+qViaAPKVCB2eg1ZPjWPf7iyCZn5sScq7CyvXQhjCip9HKmrywNFRpRdCJcGhtnXnqhIFJpcnvhotaj3fvZGuaQvbKAw4sjd7oeJo9idM+ccmw/7AgCKPDl8GLfXjp/ARgo05fbZz7axuKdxnPDUVuRpIqDY85h/i2CrVyn2KFni7mKFEuKoqfnOE0Gd7HIpeo1IoXAxQaXseTDFlQGGMeabZLUz8S69kWT3bKCDSudmTUUW1MasnPNkoNqlOHMqzelsSqHjjCz9DYKrZ6kzK4aO3CeuaCuiynvLuyVAKTAldqciEMfQaCi+KJAT0+aUOQeB23EKTHi7uYoFt5REIjknNYvhACXCVKtKshUqgYVdQ1jZR3pxi5CAbk3hDBDW9qqAUl+HwQBQ7QxwxDXnPbjVAKW6ZkpRTJBgSn1GVwVQ7K7Pp0w6elczY1cIdZgqZRMWU7DjWLycuf4AL9ZmbK2h6ubjNq6mUIF7YmNDOo7FX5KRxEmrAOXEy9wOjq5f5Lbi4kC58VIBaPFNB1Z1eWptqABStb6ktmdxhULDiO9eUvswPW/RTVs+VSDSVudepwz1BhF2GtN4ozinb6soNDZYsANDvDQCNEttH0SFvCrQ2EhuXC1d+lDhVT315ISABpQ45FSoDSgRaKwAYMvL1AZaDSgDKCWuNqACoKl6tQEVAp2D2oBmAL0XVxvQTKDTuNqAKgEdhYCXWl8hr2KmpMh7dVMNqPIQNKANqDIBZXNNoQ2oMgFlc02hykA/AEFrNYLx1CFvAAAAAElFTkSuQmCC");
				},
				mouseleave: function(){
					$("#img1").attr('src',"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAABUCAYAAAAcaxDBAAAAAXNSR0IArs4c6QAABOpJREFUeF7tnG1unDAQhjHJQZIbrJb8b3KSZk/S5CTdnKSb/2GVG5TcI+Bm0FqiCDMfHoOJvFKlRpjB8/DOeAw2psg/VQJG1Vo2VmSgyiLIQDNQZQLK5rJCM1BlAsrmklLobre7KcvyJ/hojLkviuLm8q8Z+Q1/N9ba17Ism7e3t5MyF7G5VYE6gBd4AFD6c4BfzufzUWpE47xVgA5APmk4MaHekzHmZQ3lLgoUQF5dXf0uiiJEjZx7cGzb9vn9/X2cMjg2WG0XARpZkZjDkGuPXde9LAE2OtC7u7t7a+0fzOsFjvdgz+fzc8xrRQW63+9/GWNi5Ekpk+hQowGtqgpUKcmVvdNFUXxASfT5+dlAqELaAIrX19c3Xdf1/zfGQInFvoa19imWUqMAFcA8WWtPEicBNEC21gLcR4Z0m7ZtH7TzqjpQJsxT27YHLacEg19T1/Ut4yagTVWBMmBGUYfzllmeHeu6PqCkiA3UgFZVBfUlGnIx89fYZ+qgqNknFaDU0sgY87D07OWi1r+IwBpjzEGjbypAq6qCDvcjr+en1mFi5P3X7AIVqo7ZPmrk02CglLy5hjLH4IlKDc6nQUApoZ4CTAd3v98/GmMg10eLpCCgmDo1k70k1KfOIQxUQSoVAyWo81TX9YMWCE07mBBCokoMFCuTQjqlCW/KFiGfisUQAtTOOB4UNrGBgn1EpeIZlAgoltzbtr3Vmk7GgoupVBphIqBIuCevTneTEJWKwl4K1FvIW2sPa78oo6oaiTRR2LOBfodwHz1E8U5LJWGvDXQz4U4Je0m0SYB6X2ukWMhj4T9X6Ev8YQOdG5AkdxRzOPZxZILCHpgkQL3viiQ5JzYwzD4ClD0wSYB6R/gt1J/Mp1AZKKbIDJRLiNkemTEtotBvlUMzUKYCseYpjPLet5tbLJuQmR97osIe5bULYUxBsY9rP+iRAJ17L8MuhGMDw+xrT1TYQLFXH1urRauq8j4ol/jCBoo97d5SHsWenNV1zebDPgGAIm8ONxP22vkT2IiAYvNfrWUtWP4LOY6lLmmkiYBi72O+FsEmr1LsVbIk3MUKxfJob3iFhWFUxWLq/FoDxa4/3bVFCoWTCSplz4MpQABG13U/JKudKU/poY1kdA8GelGpb9YUZUGtG5UlT9Kdw8kuxfGpNMTZOYUOR2TpNQihHqTOoBw6uONu5hRFlVPLuyVAKTAldsciEOdQZ8htFAjJaT5l+iBwHafAhN3NSSy4pQwkkjZzsxgOUCJMtaokWKESWNg52Mo+KlDCANR3hWoP67dKDqVchNqGuh0GA0C1c+mXuOac8isZhVJDc05RTJBgSn1GlwRQ7KnPWAlDhQZ8FUIdZhIhj+VLT7o4Wmthqw5snGVvng2ZWmLpazWFCsIT84V0HMu/JCMzjVYBysmXoQ4Ozl9k89niQLn5UgFo9I8ODPu4BtDFvvIQO7yTKZuIey+l4lz0oy3qc3mp18pQe4hlWb5q7CiW+rR62ST4AoPz1X2XpFjq80FUyIvn0KmOUefc7tw1cuOmgEJnOSkgAyXeXirUDJQI1CkVPnk59wGtDJQB1DXd6iq/JAYlH29fCsgKFSjUnTIFNQMNADqVVzPQQKDjvJqBKgEdqPU+1S3kSQ9KivdhMVMZqDLqDDQDVSagbC4rNANVJqBsLitUGeg/LNqDgtD2d0QAAAAASUVORK5CYII=");
				},
				click: function(){
					$(".home_section").empty();
					$.ajax({
						url: '/updateCheckMedicine',
						method: "get",
						success: function(data){
							console.log(data);
							if(data.length != 0){
								let str = "";
								str += '<div class="details" style = "height: 400px;" id = "details_medicine">';
								str += '<div class="recent_project" id = "recent_project_medicine">';
								str += '<div class="card_header" style = "height:15px;"><h2><span class = "links_name">의약품 정보 업데이트</span></h2></div>';
								str += '<table><colgroup><col width = "18%"><col width = "18%"><col width = "18%"><col width = "18%"><col width = "18%"><col width = "10%"></colgroup><thead><tr><td>업체명</td><td>제품명</td><td>기준코드</td><td>업로드 날짜</td><td>이미지여부</td><td></td></tr></thead>';
								str += '<tbody>';
								for(let i = 0; i < data.length; i++){
									medicine.push({'entpName':data[i].entpName,'itemName':data[i].itemName,'itemSeq':data[i].itemSeq,'efcyQesitm':data[i].efcyQesitm,'useMethodQesitm':data[i].useMethodQesitm,'atpnWarnQesitm':data[i].atpnWarnQesitm,'atpnQesitm':data[i].atpnQesitm,'intrcQesitm':data[i].intrcQesitm,'seQesitm':data[i].seQesitm,'depositMethodQesitm':data[i].depositMethodQesitm,'imageURL':data[i].imageURL});
			
									str += '<tr id = "'+data[i].itemSeq+'">';
									str += '<td>'+data[i].entpName+'</td>';
									str += '<td>'+data[i].itemName+'</td>';
									str += '<td>'+data[i].itemSeq+'</td>';
									str += '<td>'+data[i].updateDe+'</td>';
									str += '<td>';
									if(data[i].imageURL == ""){
										str += 'N';
									}else{
										str += 'Y';
									}
									str += '</td>';
									str += '<td><button type = "button" onclick = "medicineUpdateButton(\''+i+'\')" style = "width: 80px; background-color: #3f80ea; border: 1px white;">업데이트</button></td>';
									str += '</tr>';
								}
								str += '</tbody></table></div></div></div>';
								console.log("메디슨",medicine);
								$(".home_section").append(str);
							}
						},
						error: function(){
							alert("실패");
						} // error
					}); // ajax 
					
					$.ajax({
						url: '/updateCheckDisease',
						method: "get",
						success: function(data){
							console.log(data);
							if(data.length != 0){
								let str = "";
								str += '<div class="details" style = "height: 400px;" id = "details_disease">';
								str += '<div class="recent_project" id = "recent_project">';
								str += '<div class="card_header" style = "height:15px;"><h2><span class = "links_name">질병 정보 업데이트</span></h2></div>';
								str += '<table><colgroup><col width = "20%"><col width = "20%"><col width = "20%"><col width = "40%"></colgroup><thead><tr><td>질병코드</td><td>&nbsp;&nbsp;&nbsp;질병명</td><td></td><td></td></tr></thead>';
								str += '<tbody>';
								for(let i = 0; i < data.length; i++){
									str += '<tr id = "'+data[i].sickCd+'">';
									str += '<td>'+data[i].sickCd+'</td>';
									str += '<td>'+data[i].sickNm+'</td>';
									str += '<td><button type = "button" onclick = "diseaseUpdateButton(\''+data[i].sickCd+'\',\''+data[i].sickNm+'\')" style = "width: 80px; background-color: #3f80ea; border: 1px white;">업데이트</button></td>';
									str += '<td></td>';
									str += '</tr>';
								}
								str += '</tbody></table></div></div></div>';
								
								$(".home_section").append(str);
							}
						},
						error: function(){
							alert("실패");
						} // error
					}); // ajax 
				} // click function
			}); // img on
		}); // jquery
		
		function diseaseUpdateButton(sickCd, sickNm){
			$.ajax({
				url: "/insertDiseaseOne",
				method: "post",
				data: {"sickCd":sickCd, "sickNm":sickNm},
				success: function(data){
					$("#"+sickCd).html("");
				},
				error: function(error){
					alert(error);
				} // error
			}); // ajax
		}
		
		function medicineUpdateButton(idx){
			console.log(medicine[idx].entpName);
			$.ajax({
				url: "/insertMedicineOne",
				method: "post",
				data: {"entpName":medicine[idx].entpName,"itemName":medicine[idx].itemName,"itemSeq":medicine[idx].itemSeq,"efcyQesitm":medicine[idx].efcyQesitm,"useMethodQesitm":medicine[idx].useMethodQesitm,"atpnWarnQesitm":medicine[idx].atpnWarnQesitm,"atpnQesitm":medicine[idx].atpnQesitm,"intrcQesitm":medicine[idx].intrcQesitm,"seQesitm":medicine[idx].seQesitm,"depositMethodQesitm":medicine[idx].depositMethodQesitm,"imageURL":medicine[idx].imageURL,},
				success: function(data){
					$("#"+medicine[idx].itemSeq).html("");
				},
				error: function(error){
					alert(error);
				} // error
			}); // ajax
		}
		
</script>
</head>
<body>
	<div class="sidebar">
		<div class="logo_details">
			<img src="/image/team.png" width="50px" id = "logoImage">
			<div class="logo_name">&nbsp;&nbsp;Waste Drugs</div>
		</div>
		<ul>
			<li><a href="adminpage"> <i class='bx bx-bar-chart'></i> <span
					class="links_name"> 통계 </span>
			</a></li>
			<li><a href="admin_user"> <i class='bx bx-user'></i> <span
					class="links_name"> 회원정보 </span>
			</a></li>
			<li><a href="admin_report"> <i class='bx bx-error-circle'></i>
					<span class="links_name"> 신고관리 </span>
			</a></li>
			<li><a href="admin_update"> <i class='bx bx-revision'></i> <span
					class="links_name"> 업데이트 </span>
			</a></li>
		</ul>
	</div>
	<!-- End Sideber -->
	
	<section class="home_section">
		<div class="details" style = "height: 400px;" id = "details_disease">
			<div class="recent_project" style = "height: 900px;" id = "recent_project_disease">
			<a id = "reloadingBtn" style = "position: absolute; top: 40%; left: 47%;"><img id = "img1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAABUCAYAAAAcaxDBAAAAAXNSR0IArs4c6QAABOpJREFUeF7tnG1unDAQhjHJQZIbrJb8b3KSZk/S5CTdnKSb/2GVG5TcI+Bm0FqiCDMfHoOJvFKlRpjB8/DOeAw2psg/VQJG1Vo2VmSgyiLIQDNQZQLK5rJCM1BlAsrmklLobre7KcvyJ/hojLkviuLm8q8Z+Q1/N9ba17Ism7e3t5MyF7G5VYE6gBd4AFD6c4BfzufzUWpE47xVgA5APmk4MaHekzHmZQ3lLgoUQF5dXf0uiiJEjZx7cGzb9vn9/X2cMjg2WG0XARpZkZjDkGuPXde9LAE2OtC7u7t7a+0fzOsFjvdgz+fzc8xrRQW63+9/GWNi5Ekpk+hQowGtqgpUKcmVvdNFUXxASfT5+dlAqELaAIrX19c3Xdf1/zfGQInFvoa19imWUqMAFcA8WWtPEicBNEC21gLcR4Z0m7ZtH7TzqjpQJsxT27YHLacEg19T1/Ut4yagTVWBMmBGUYfzllmeHeu6PqCkiA3UgFZVBfUlGnIx89fYZ+qgqNknFaDU0sgY87D07OWi1r+IwBpjzEGjbypAq6qCDvcjr+en1mFi5P3X7AIVqo7ZPmrk02CglLy5hjLH4IlKDc6nQUApoZ4CTAd3v98/GmMg10eLpCCgmDo1k70k1KfOIQxUQSoVAyWo81TX9YMWCE07mBBCokoMFCuTQjqlCW/KFiGfisUQAtTOOB4UNrGBgn1EpeIZlAgoltzbtr3Vmk7GgoupVBphIqBIuCevTneTEJWKwl4K1FvIW2sPa78oo6oaiTRR2LOBfodwHz1E8U5LJWGvDXQz4U4Je0m0SYB6X2ukWMhj4T9X6Ev8YQOdG5AkdxRzOPZxZILCHpgkQL3viiQ5JzYwzD4ClD0wSYB6R/gt1J/Mp1AZKKbIDJRLiNkemTEtotBvlUMzUKYCseYpjPLet5tbLJuQmR97osIe5bULYUxBsY9rP+iRAJ17L8MuhGMDw+xrT1TYQLFXH1urRauq8j4ol/jCBoo97d5SHsWenNV1zebDPgGAIm8ONxP22vkT2IiAYvNfrWUtWP4LOY6lLmmkiYBi72O+FsEmr1LsVbIk3MUKxfJob3iFhWFUxWLq/FoDxa4/3bVFCoWTCSplz4MpQABG13U/JKudKU/poY1kdA8GelGpb9YUZUGtG5UlT9Kdw8kuxfGpNMTZOYUOR2TpNQihHqTOoBw6uONu5hRFlVPLuyVAKTAldsciEOdQZ8htFAjJaT5l+iBwHafAhN3NSSy4pQwkkjZzsxgOUCJMtaokWKESWNg52Mo+KlDCANR3hWoP67dKDqVchNqGuh0GA0C1c+mXuOac8isZhVJDc05RTJBgSn1GlwRQ7KnPWAlDhQZ8FUIdZhIhj+VLT7o4Wmthqw5snGVvng2ZWmLpazWFCsIT84V0HMu/JCMzjVYBysmXoQ4Ozl9k89niQLn5UgFo9I8ODPu4BtDFvvIQO7yTKZuIey+l4lz0oy3qc3mp18pQe4hlWb5q7CiW+rR62ST4AoPz1X2XpFjq80FUyIvn0KmOUefc7tw1cuOmgEJnOSkgAyXeXirUDJQI1CkVPnk59wGtDJQB1DXd6iq/JAYlH29fCsgKFSjUnTIFNQMNADqVVzPQQKDjvJqBKgEdqPU+1S3kSQ9KivdhMVMZqDLqDDQDVSagbC4rNANVJqBsLitUGeg/LNqDgtD2d0QAAAAASUVORK5CYII="/></a><!-- onmouseout = "updateMouseOut()" onmouseover = "updateMouseOver()" -->
				
			</div>
		</div>
		
		<div class="details" style = "height: 400px;" id = "details_medicine">
		
		</div>
	</section>

</body>
</html>