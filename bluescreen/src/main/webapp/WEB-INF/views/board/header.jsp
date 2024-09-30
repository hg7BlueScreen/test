<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link type="text/css" rel="stylesheet" href="/css/info/common_total1a8e.css?20240805140085">
<link type="text/css" rel="stylesheet" href="/css/info/sub_main1a8e.css?20240805140085" />
<link rel="stylesheet" href="/js/aos/aos.css" />

<link type="text/css" rel="stylesheet" href="/css/info/micropage_total1a8e.css?20240805140085" />

<link rel="stylesheet" href="/npm/swiper%4011/swiper-bundle.min.css" />
<link rel="stylesheet" href="/css/layout.css">
<link rel="stylesheet" href="/css/main_new.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../../r.incru.it/static/js/aos/aos367a.js?20240821162485"></script>
<script type="text/javascript" src="../../fastly.jsdelivr.net/npm/swiper%4011/swiper-bundle.min.js?20240821162485"></script>
<script type="text/javascript" src="../../r.incru.it/ajs/product/ats_crm_v2367a.js?20240821162485"></script>
<script type="text/javascript" src="../../r.incru.it/ajs/product/micro_v2367a.js?20240821162485"></script>
<header id="header" class="">
	<!-- <div class="v2banner">배너영역 2차 시 내용 추가</div> -->
		<div class="inner">
			<div class="logo">
				<a class="logo-incruit" href="/"></a>
			</div>
			<div class="overlay">
				<nav id="nav" class="overlay-menu">
					<ul class="gnb cf">
						<li class="pc onList on">
							<a href="#" class="mainMenu">메인메뉴</a>

							<div class="show_onlist">
								<div class="dropdown_inner">
									<a href="Mmap" class="go_ats_crm list_menuBox">
										<span class="d-menu-t">MAP</span>
										<span class="d-menu-t2">폐의약품 수거함 검색</span>
									</a>
									<a href="dict?category=drug" class="go_assess list_menuBox">
										<span class="d-menu-t">DICTIONARY</span>
										<span class="d-menu-t2">의약품 및 질병 사전</span>
									</a>
									<a href="/board/myPage" class="go_interview list_menuBox">
										<span class="d-menu-t">MYPAGE</span>
										<span class="d-menu-t2">개인 정보 및 의료 정보</span>
									</a>
								</div>
							</div>
						</li>







						<c:if test="${sessionId!=null }">
						<li class="outLink"><a href="/logout" class="consulting roundBtn on">로그아웃</a></li>
						</c:if>
						
						<c:if test="${sessionId==null }">
						<li class="pc">
							<a href="/login" class="roundBtn">로그인</a>
						</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</header>