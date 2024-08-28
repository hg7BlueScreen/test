<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

 
	<style>
		
	</style>
</head>      
<body>
	<%@include file = "header.jsp" %>
	 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="/css/notice_list2.css">
  <link rel="stylesheet" href="/css/lista2.css">
  <section style = "height:400px; margin:150px">
	
    <h1 style = "margin-top: 40px; margin-bottom: 50px; font-size: 40px;">게시판</h1>
    <div class="wrapper">
      <form action="/search" name="search" method="post">
        <select name="category" id="category" style = "position: absolute; top: 50%; left: 50%; width: 80px; height: 40px; margin-left: -185px; margin-top: -20px; padding: 5px; border: 1px solid #666666; font-family: inherit; background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/search-box-select.png) no-repeat 95% 50%; -webkit-appearance: none; -moz-appearance: none; appearance: none;">
          <option value="0">전체</option>
          <option value="title">제목</option>
          <option value="content">내용</option>
          <option value="plus">제목+내용</option>
        </select>

        <div class="title">
          <input type="text" size="16" id = "textBox">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>
    
    <table>
      <colgroup>
        <col width="18%">
        <col width="40%">
        <col width="12%">
        <col width="12%">       
        <col width="18%">
      </colgroup>
      <tr>
        <th>NO</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      <tr>
        <td><span class="table-notice">N</span></td>
        <td class="table-title">신종코로나바이러스 예방관련 운영 안내</td>
        <td>User</td>
        <td>2020-02-28</td>
        <td>32</td>
      <tr>
        <td><span class="table-notice">N</span></td>
        <td class="table-title">[2020년3월] 시설 정비 공사 안내</td>
        <td>User</td>
        <td>2020-02-28</td>
        <td>32</td>
      </tr>
      <tr>
        <td><span class="table-notice">N</span></td>
        <td class="table-title">홈페이지 개인정보 보안 강화</td>
        <td>User</td>
        <td>2018-11-14</td>
        <td>32</td>
      <tr>
        <td>5</td>
        <td class="table-title">[키즈잼] 3월 프로그램 안내</td>
        <td>User</td>
        <td>2020-02-18</td>
        <td>32</td>
      </tr>
      <tr>
        <td>4</td>
        <td class="table-title">[키즈잼] 2월 프로그램 안내</td>
        <td>User</td>
        <td>2020-01-17</td>
        <td>32</td>
      <tr>
        <td>3</td>
        <td class="table-title">마이다스 멤버쉽 안내</td>
        <td>User</td>
        <td>2019-05-08</td>
        <td>32</td>
      </tr>
      <tr>
        <td>2</td>
        <td class="table-title">[마이다스 호텔&리조트] 제23회 경기건축문화 금상 수상</td>
        <td>User</td>
        <td>2018-10-10</td>
        <td>32</td>
      </tr>
      <tr>
        <td>1</td>
        <td class="table-title">카카오플러스 친구 오픈</td>
        <td>User</td>
        <td>2018-07-11</td>
        <td>32</td>
      </tr>
    </table>

    <ul class="page-num">
      <li class="first"></li>
      <li class="prev"></li>
      <li class="num">
        <div>1</div>
      </li>
      <li class="num">
        <div>2</div>
      </li>
      <li class="num">
        <div>3</div>
      </li>
      <li class="num">
        <div>4</div>
      </li>
      <li class="num">
        <div>5</div>
      </li>
      <li class="next"></li>
      <li class="last"></li>
    </ul>

    <div class="write">쓰기</div>
  </section>
		<%@include file = "footer.jsp" %>
</body>
</html>