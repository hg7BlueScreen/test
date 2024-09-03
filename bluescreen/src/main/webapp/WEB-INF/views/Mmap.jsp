<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>box_map.jsp</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d99aad64257f4c7b6af58515d60b1a79&libraries=services,clusterer,drawing"></script>
		<link rel="stylesheet" type="text/css" href="/css/map.css">
		
	</head>
	<body>
	<%-- <%@ include file = "header.jsp" %> --%>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">    <!-- 키워드로 장소를 검색 -->
                   <h1 id="su">유형&nbsp;:&nbsp; 
						<select name="box" id="box" style="width:130px;font-size:25px;">
							<option value="우체통">우체통</option>
							<option value="수거함">수거함</option>
						</select><br>
						지역&nbsp;:&nbsp; 
						<select name="box" id = "city" onchange="cbtn()" style="width:100px;font-size:25px;">
							<option value="" >시</option>
							<option value="서울" >서울</option>
							<option value="세종" >세종</option>
							<option value="인천">인천</option>
						</select>
						<select name="box" id="gu" onchange="sbtn()" style="width:200px;font-size:25px;">
							<option value="">구</option>
						</select>
					</h1>
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script>
let userLoc ="21160570" //시청역 1호선 id // 기본 출발지 
//let userLoc = "";  // 회원 전용 출발지 

// 마커를 담을 배열입니다
var markers = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var pBoxImg = "/image/p_box.png"; //우체통 이미지
var mBoxImg = "/image/m_box.png"; //수거함 이미지
var userImg = ""; //유저 이미지

function cbtn(){
	let seoul = ["강남","강동","강북","강서","관악","광진","구로","금천","노원","도봉","동대문","동작",
		"마포","서대문", "서초","성동","성북","송파","양천","영등포","용산","은평","종로","중","중랑"]
	let incheon = ["강화","검단","계양","남동","미추홀","부평","서","연수","영종","옹진","제물포"]
	let sejong = ["특별자치시"];
	let str = "";
	if($("#city").val()=="서울"){
		
		str += '<option value="">구</option>'
		for(let i=0;i<seoul.length;i++){
		str += '<option value="'+seoul[i]+'">'+seoul[i]+'구</option>'
		}
	}	$("#gu").html(str);
	
	if($("#city").val()=="인천"){
		
		str += '<option value="">구</option>'
		for(let i=0;i<incheon.length;i++){
			str += '<option value="'+incheon[i]+'">'+incheon[i]+'구</option>'
		}
	}	$("#gu").html(str);
	
	if($("#city").val()=="세종"){
		
		str += '<option value="">구</option>'
		for(let i=0;i<sejong.length;i++){
			str += '<option value="'+sejong[i]+'">'+sejong[i]+'</option>'
		}
	}	$("#gu").html(str);
} 
function sbtn(){
	if($("#box").val()=="우체통"){
	alert($("#city").val()+" "+$("#gu").val());
	var keyword = $("#city").val()+" "+$("#gu").val() +" "+$("#box").val();
	//console.log(keyword);
	
	// 키워드로 장소 검색
	ps.keywordSearch(keyword, placesSearchCB);
	
	}//$("#box").val()=="우체통"
	else if($("#box").val()=="수거함"){
		$.ajax({
			url:"/mBoxgu",
			method:"post",
			data:{"gu" : $("#gu").val()},
			success:function(data){
				//alert();console.log(data);
				var positions=[];
				MdisplayPlaces(data);
				displayPagination(pagination);
				
				function MdisplayPlaces(places) {
					//console.log("dis1"+places);
				    var listEl = document.getElementById('placesList'),
				    menuEl = document.getElementById('menu_wrap'),
				    fragment = document.createDocumentFragment(), 
				    bounds = new kakao.maps.LatLngBounds(), 
				    listStr = '';
				    // 검색 결과 목록에 추가된 항목들을 제거합니다
				    removeAllChildNods(listEl);
				    // 지도에 표시되고 있는 마커를 제거합니다
				    removeMarker();
				    
				    for ( var i=0; i<places.length; i++ ) {
				    	
				        // 마커를 생성하고 지도에 표시합니다
				        var placePosition = new kakao.maps.LatLng(places[i].x, places[i].y),
				        	marker = addMarker(placePosition, i, places[i].name), 
				            itemEl = MgetListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
				            //console.log("dis"+places[i]);
				            
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        bounds.extend(placePosition);
						
				        // 마커와 검색결과 항목에 mouseover 했을때
				        // 해당 장소에 인포윈도우에 장소명을 표시합니다
				        // mouseout 했을 때는 인포윈도우를 닫습니다
				        
				        (function(marker, title) {
				            kakao.maps.event.addListener(marker, 'mouseout', function() {
				                infowindow.close();
				            });

				            itemEl.onmouseover =  function () {
				                displayInfowindow(marker, title);
				            };

				            itemEl.onmouseout =  function () {
				                infowindow.close();
				            };
				        })(marker, places[i].name);
				        fragment.appendChild(itemEl);
				    }
				    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
				    listEl.appendChild(fragment);
				    menuEl.scrollTop = 0;
				    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				    map.setBounds(bounds);
				}//displayPlaces(places)
				
				// 검색결과 항목을 Element로 반환하는 함수입니다
				function MgetListItem(index, places) {
					//console.log("getListItem"+places);
					
					
				    var el = document.createElement('li'),
				    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
				                '<div class="info">' +
				                '   <h5>' + places.name + '</h5>';
				    itemStr += '    <span>' + places.addr + '</span>';
				    itemStr += '  <span class="tel">' + places.phone  + '</span>' +
				                '</div>';           

				    el.innerHTML = itemStr;
				    el.className = 'item';

				    return el;
				}//getListItem
			},
			error:function(){
				alert("실패")
			}
		});//ajax
	}
}


// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
		//console.log(data);		console.log(status);		console.log(pagination);
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);
		
        // 페이지 번호를 표출합니다
        displayPagination(pagination);
		
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;
    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
	//console.log(places);
    var listEl = document.getElementById('placesList'),
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    //console.log(places);
    
    for ( var i=0; i<places.length; i++ ) {
    	
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
        	marker = addMarker(placePosition, i, places[i].place_name), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
           
            
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
		
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
	//console.log(places);
	
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
		if($("#box").val()=="우체통"){
	    var imageSrc = pBoxImg; 
		}else if($("#box").val()=="수거함"){
	    var imageSrc = mBoxImg;
		}
        var imageSize = new kakao.maps.Size(30, 30),  // 마커 이미지의 크기
        imgOptions = {offset: new kakao.maps.Point(13, 37)} // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });
	//console.log(position);
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	//console.log(title);
	//console.log(position);
	
    //var mposition = new kakao.maps.LatLng(position.y, position.x);
    var iwContent = '<div style="padding:5px;">'+title+'<br>'+
					'<button id = "showRoute" onclick="showRoute(\''+title+'\',\''+position.Ma+'\',\''+position.La+'\')">길찾기</button>'
	var infowindowC = new kakao.maps.InfoWindow({
        content : iwContent,
        position : position,
        removable : true
    });	    
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindowC));
    
    return marker;
}
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}	

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}



// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
	
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커에 마우스 올렸을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
function showRoute(title, x, y){
	//console.log(pid);
	$("#menu_wrap").hide();
 	var str ='<iframe style="width:100%;height:1000px;"  src="'
	+'https://map.kakao.com/link/from/'+userLoc+'/to/'+title+','+x+','+y+'"></iframe>'; 
	 
	$("#map").html(str);
}
</script>
	<%@ include file = "footer.jsp" %>
	</body>
	
</html>