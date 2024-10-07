<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>QNA</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/notice_list2.css">
  
  <link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
  <link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
  <link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
 <script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@include file = "../header.jsp" %>
  
  <div id="" style="">
  <!-- 	<div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">고객센터</a></li>
			<li class="last">게시판</li>
		</ol>
	</div> -->
	
		<div id="left" style="float:left; width:250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">커뮤니티<span style="font-size: 13px;">게시판</span></div>
				<ul >
					<li style="height: 40px;"><a href="../announceList" id="leftNavi4"style="height: 40px; font-size: 15px; line-height: 270%; text-decoration-line: none;">공지사항</a></li>		
					<li style="height:40px;"><a href="/board/blist" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none; ">게시판</a></li>
					<li style="height:40px;"><a href="#" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">QnA</a></li>
					<li class="last" style="height:40px;"><a href="/board/faq" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">FAQ</span></a></li>
					<!-- <li class="last" style="height:40px;"><a href="#" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">이용안내</a></li> -->
				</ul>				
			</div><script type="text/javascript">initSubmenu(3,0);</script>
			
		
	<!-- contents -->
	<div style="width:1000px; margin-right: auto; margin-left:auto;">					
   			<h2 style="margin:150px 0 70px 0; text-align: center;">
   				<strong style="font-size: 55px; font-weight:600px; color:#444444; ">QNA</strong>
   				<br>
   				<br>
   				<span style="font-size: 15px; color: #888888; font-weight: normal;">QNA 목록</span>
   			</h2>
    
								
    <div class="searchWrap">
								
						<div class="search" style="margin-left: 330px;">
							<ul>
								<li class="web"><p style="font-weight: bold; color:#666666; line-height: 28px; margin-right: 20px; font-size: 13px;">검색</p></li>
								<li class="se">
									<select style="width:85px;">
										<option value="title" />제목</option>
										<!-- <option value="content" />내용</option>
										<option value="plus">제목+내용</option> -->
									</select>
								</li>
								<li><input type="text" id="text" class="searchInput" placeholder="내용을 입력하세요." style="margin-left:-1px; font-size: 11px;" value = "${text }"/></li>
								<li class=""><a href="#" ><button class="bllist" onclick="bllist()" style="margin: -14px 0 0 92px; padding-left:1.5px; ">검색</button></a></li>
							</ul>
						</div>
					</div> 
    
   <script type="text/javascript">
   	function bllist(){
   		let text = $("#text").val();
   		location.href="qnaList?text="+text;
   	}
   </script>
   <!--  <div class="wrapper">
      <form action="/search" name="search" method="post">
        <select name="category" id="category">
          <option value="0">전체</option>
          <option value="title">제목</option>
          <option value="content">내용</option>
          <option value="plus">제목+내용</option>
        </select>

        <div class="title">
          <input type="text" size="16">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div> -->
      <div style=" padding:80px 0 15px 0; font-size: 22px; /* color:#0a47ff; */ font-weight: bold;">
       <%-- 전체&nbsp;&nbsp;
       ${sessionId }
       개 --%>
      <a href="/qnaWrite" onclick="writeBBtn()"><button class="write">쓰기</button></a>
      </div>
      <div class="faqList" >
		    <ul style="padding-bottom: 10px;">
		    <c:forEach var = "q" items = "${list }">
		    	<li>
		    		<a href="javascript:;" class="faqbtn">
		    		<div class="question">
				        <%-- <div class="blets"> ${board.bno }  </div> --%>
				        <div class="categorys" style="width:600px;font-size: 12px;">${q.id } 님</div>			       
				       	<div class="titles" style="margin-bottom:-40px; font-size: 19px; padding:15px 0 25px 0; font-weight: bold;"><a href = "/qnaRead?qno=${q.qno }" id="ddd">${q.qtitle }</a></div>
				        
				        <%-- <td class="table-title">
				       <c:forEach begin="1" end="${board.bindent }" step="1">
				       	<img src="/image/chat2.png" style="width:17px;">
				       </c:forEach>
				       <c:if test="${board.bfile!=null }">
				       	 <span class="ttable-notice" style="margin-left:10px;">i</span>
				       	<!-- <img src="/images/image.png" style="width:17px;"> -->
				       </c:if>
				        </td> --%>
				       	<div class="bbdate">2024-10-06&nbsp;에 작성</div>
				        <div style="overflow: hidden; width:20px; height:20px; float:left; left:130px;  margin-top:-16px;"><img src="/image/eye.png"></div>
				       	<div style="overflow: hidden; width:18px; height:25px; float:left; margin-left:20px;  margin-bottom:19px; margin-top:-15px;"><img src="/image/bubble-chating.png"></div>
						
						<div class="bbhit" style="display: flex; align-items: center; ">조회&nbsp;&nbsp; <div style="font-weight: bold;">${q.qhit }</div></div>
				        <div class="bbchat" id="ccnt" style="display: flex; align-items: center;">댓글&nbsp;&nbsp; <div style="font-weight: bold;">${q.comCount }</div></div>
				     
				     
		    		</div>
			        </a>	
			    </li>      
		    </c:forEach>
		    </ul>
		    
      	
      </div>
<div class="btnAreaList" style="margin-bottom:300px;">
<ul class="page-num">
    <!-- 첫페이지로이동 -->
    <c:if test="${page.page!=1 }">
      <a href="/qnaList?page=1&text${text }"><li class="first" style="width:25px;height:25px;line-height:23px; vertical-align:top;"></li></a>
    </c:if>
    <c:if test="${page.page==1 }">
      <li class="first" style="width:25px;height:25px; line-height:23px; vertical-align:top;"></li>
    </c:if>
    <c:if test="${page.page > 1}">
      <a href="/qnaList?page=${page.page-1 }&text${text }"><li class="prev" style="width:19px;height:27px; line-height:23px; vertical-align:top; margin-right:5px;"></li></a>
    </c:if>
    <c:if test="${page.page == 1}">
      <li class="prev" style="width:19px; height:27px; line-height:23px; vertical-align:top; margin-right:5px;"></li>
    </c:if>
    <c:forEach var="pNum" begin="${page.startPage }"  end="${page.maxPage }" step="1">
       <c:if test="${page.page == pNum }">
       	<a class="allPageMoving2" style="color:#0a47ff; border:1px #0a47ff solid; background:#fff;"><li><div style="height:25px;line-height:25px; margin-left:-2px;">${pNum }</div></li></a>
       </c:if>
       <c:if test="${page.page != pNum }">
       <a href="/qnaList?page=${pNum }&text${text }" class="allPageMoving2"><li><div style="height:25px;line-height:25px; margin-left:-2px;">${pNum }</div></li></a>
       </c:if>
     </c:forEach> 
   <c:if test="${page.page < page.maxPage}">
     <a href="/qnaList?page=${page.page+1 }&text${text }"> <li class="next" style="width:19px;height:27px;line-height:23px; vertical-align:top; margin-left:5px;"></li> </a>
   </c:if>   
   <c:if test="${page.page == page.maxPage}">
      <li class="next" style="width:19px;height:27px;line-height:23px; vertical-align:top;margin-left:5px;"></li>
   </c:if>   
   <c:if test="${page.page!= page.maxPage}">
      <a href="/qnaList?page=${page.maxPage }&text${text }"><li class="last1" style="width:25px;height:25px;line-height:23px; vertical-align:top;"></li></a>
   </c:if>
   <c:if test="${page.page == page.maxPage}">
      <li class="last1" style="width:25px;height:25px;line-height:23px; vertical-align:top;"></li>
   </c:if>   
    </ul>
     <!-- <a href="bwrite" onclick="writeBBtn()"><button class="write">쓰기</button></a> -->
</div>
<!-- 	<div class="btnAreaList">
		페이징이동1
		<div class="allPageMoving1">

			<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
			<a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
			<strong>1</strong>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
			<a href="#" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

		</div>
		//페이징이동1
	</div> -->
					
   		</div>
  	</div>
<div>

   
</div>
<%@include file = "../footer.jsp" %>
</body>
</html>