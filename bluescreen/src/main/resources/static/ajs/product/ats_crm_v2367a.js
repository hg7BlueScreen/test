const IeCheck=function(){const agent=navigator.userAgent.toLowerCase();if((navigator.appName=='Netscape'&&navigator.userAgent.search('Trident')!=-1)||(agent.indexOf("msie")!=-1)){alert('Internet Explorer는 호환되지 않는 브라우저 입니다.');}};
//IeCheck();

//이메일 정규식 체크
String.prototype.isEmail = function() {
	const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(String(this).toLowerCase());
}

//핸드폰번호 정규식 체크
String.prototype.isPhone = function() {
	const re = /^[0-9;\-]*$/;
	return re.test(String(this));
}


jQuery(document).ready(()=>{

	if(window.location.search.indexOf("showlayer=y") > 0 ){
		Consulting_Pop();
		jQuery("html").addClass('noFlow'); //overflow:hidden 추가
		jQuery("#packageSt").show(); //팝업 띄우기
	}

	if (jQuery('.sub-slider').length > 0) {
		//slider();
	}

	if (jQuery('.section-tab-wrap').length > 0) {
		tabFix();
		tabActive();
	}

    jQuery("body")
	.on("click", ".consulting", function() {
		let ecode=get_cookie("WORKSHOME")??"";
		if(ecode.length>60){
			regPopOpen();
		}else{
			Consulting_Pop();
		}


		jQuery("body").addClass('is-popupOpen'); //overflow:hidden 추가
		jQuery("#packageSt").show(); //팝업 띄우기
	})
	.on("click", ".package_solution", function() {
		Solution_Pop_01();
		jQuery("body").addClass('is-popupOpen'); //overflow:hidden 추가
		jQuery("#packageSt").show(); //팝업 띄우기
	})
    .on("click", ".newLayer_body .layer_closeBtn", ()=> {
        closeLayer();
	})
    .on("keyup", "#contact", function() {
        const charge_tel = jQuery(this).val().trim();
		if (charge_tel != ''){
			if( charge_tel.isPhone() == false ) {
				jQuery(this).val('');
				jQuery(this).focus();
				return;
			}
		}
	})
	.on("mouseover", ".onList", function() {
		jQuery('.show_onlist').addClass('active');
	})
	.on("mouseleave", ".onList", function() {
		jQuery('.show_onlist').removeClass('active');
	})
	.on("click", "#solution_reset", function() {
		jQuery("[id^='suggest']").each(function(i){
			jQuery(this).prop("checked", false);
		});
	})
	.on("click", ".drop_cont_m", function() {
		jQuery('.drop_cont_m').toggleClass('on');
		jQuery('.detail_menu_drop').toggleClass('on');
	})
	.on("click", "ul.tabs li", function() {
		var tab_id = jQuery(this).attr('data-tab');

		jQuery('ul.tabs li').removeClass('on');
		jQuery('.tab-content').removeClass('on');

		jQuery(this).addClass('on');
		jQuery("#"+tab_id).addClass('on');
	})
	.on("click", ".psgtutorial", function() {
		let betachk = location.host.indexOf('beta')==0?"beta":"";
		let go_url = "https://"+betachk+"works.incruit.com/home/psgtutorial/";

		window.open(go_url, '', '');
	})
	.on("click", ".company_tip", function() {
		viewCompanyTip();
	})
	.on("click", ".capability", function() {
		viewCapability();
	})
	.on("click", ".test_type", function() {
		viewTestType();
	})
	.on("click", ".go_ats_crm", function() {
		let betachk = location.host.indexOf('beta')==0?"beta":"";
		let go_url = "https://"+betachk+"works.incruit.com/home/?flag=ats_crm";
		location.href = go_url;
	})
	.on("click", ".go_assess", function() {
		let betachk = location.host.indexOf('beta')==0?"beta":"";
		let go_url = "https://"+betachk+"works.incruit.com/home/?flag=assess";
		location.href = go_url;
	})
	.on("click", ".go_interview", function() {
		let betachk = location.host.indexOf('beta')==0?"beta":"";
		let go_url = "https://"+betachk+"works.incruit.com/home/?flag=interview";
		location.href = go_url;
	})
	.on("click", ".go_proctor", function() {
		let betachk = location.host.indexOf('beta')==0?"beta":"";
		let go_url = "https://"+betachk+"works.incruit.com/home/?flag=proctor";
		location.href = go_url;
	})
	.on("click", ".go_referencecheck", function() {
		let betachk = location.host.indexOf('beta')==0?"beta":"";
		let go_url = "https://"+betachk+"works.incruit.com/home/?flag=referencecheck";
		location.href = go_url;
	})
	;

	productInit();
});
//메뉴 다운 토글 - 클릭형식
// jQuery(document).ready(function(){
// 	jQuery(".onList").click(function(){
// 	jQuery(".show_onlist").toggleClass("on");
// 	});
// });

var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = jQuery('.v2banner').outerHeight();

jQuery(window).scroll(function(event){
	didScroll = true;

	if (jQuery('.section-tab-wrap').length > 0) {
		tabFix();
		tabActive();
	}
});

setInterval(function() {
	if (didScroll) {
			hasScrolled();
			didScroll = false;
	}
}, 250);

function hasScrolled() {
	var st = jQuery(this).scrollTop();

	// Make sure they scroll more than delta
	if(Math.abs(lastScrollTop - st) <= delta)
			return;

	// If they scrolled down and are past the navbar, add class .nav-up.
	// This is necessary so you never see what is "behind" the navbar.
	if (st > lastScrollTop && st > navbarHeight){
			// Scroll Down
			jQuery('.v2banner').removeClass('nav-down').addClass('nav-up');
	} else {
			// Scroll Up
			if(st + jQuery(window).height() < jQuery(document).height()) {
					jQuery('.v2banner').removeClass('nav-up').addClass('nav-down');
			}
	}

	lastScrollTop = st;
}

//ATS & CRM
var swiperSw1 = new Swiper('.mySwiper.sw1', {
	loop: true,
	cssMode: true,
	navigation: {
		nextEl: '.swiper-button-next.b1',
		prevEl: '.swiper-button-prev.b1',
	},
	pagination: {
		el: '.swiper-pagination1',
		clickable: true, //버튼 클릭 여부
		type: 'bullets',
	},
});

//페이지네이션 fraction추가
var pagingSwiper = new Swiper('.mySwiper.sw1', {
	loop: true,

	pagination: {
		el: '.pagination_fraction1',
		type: 'fraction',

		formatFractionCurrent: function (number) {
			return ('0' + number).slice(-2);
		},
		formatFractionTotal: function (number) {
			return ('0' + number).slice(-2);
		},
		renderFraction: function (currentClass, totalClass) {
			return '<span class="' + currentClass + '"></span>' + ' / ' + '<span class="' + totalClass + '"></span>';
		},
	},
});

//ASSESS
var swiperSw2 = new Swiper('.mySwiper.sw2', {
	loop: true,
	cssMode: true,
	navigation: {
		nextEl: '.swiper-button-next.b2',
		prevEl: '.swiper-button-prev.b2',
	},
	pagination: {
		el: '.swiper-pagination2',
		clickable: true, //버튼 클릭 여부
		type: 'bullets',
	},
});

//페이지네이션 fraction추가
var pagingSwiper = new Swiper('.mySwiper.sw2', {
	loop: true,

	pagination: {
		el: '.pagination_fraction2',
		type: 'fraction',

		formatFractionCurrent: function (number) {
			return ('0' + number).slice(-2);
		},
		formatFractionTotal: function (number) {
			return ('0' + number).slice(-2);
		},
		renderFraction: function (currentClass, totalClass) {
			return '<span class="' + currentClass + '"></span>' + ' / ' + '<span class="' + totalClass + '"></span>';
		},
	},
});

//Interview
var swiperSw3 = new Swiper('.mySwiper.sw3', {
	loop: true,

	navigation: {
		nextEl: '.swiper-button-next.b3',
		prevEl: '.swiper-button-prev.b3',
	},
	pagination: {
		el: '.swiper-pagination3',
		clickable: true, //버튼 클릭 여부
		type: 'bullets',
	},
});

//페이지네이션 fraction추가
var pagingSwiper = new Swiper('.mySwiper.sw3', {
	loop: true,

	pagination: {
		el: '.pagination_fraction3',
		clickable: true,
		type: 'fraction',

		formatFractionCurrent: function (number) {
			return ('0' + number).slice(-2);
		},
		formatFractionTotal: function (number) {
			return ('0' + number).slice(-2);
		},
		renderFraction: function (currentClass, totalClass) {
			return '<span class="' + currentClass + '"></span>' + ' / ' + '<span class="' + totalClass + '"></span>';
		},
	},
});

//Proctor
var swiperSw4 = new Swiper('.mySwiper.sw4', {
	loop: true,
	cssMode: true,
	navigation: {
		nextEl: '.swiper-button-next.b4',
		prevEl: '.swiper-button-prev.b4',
	},
	pagination: {
		el: '.swiper-pagination4',
		clickable: true, //버튼 클릭 여부
		type: 'bullets',
	},
});

//페이지네이션 fraction추가
var pagingSwiper = new Swiper('.mySwiper.sw4', {
	loop: true,

	pagination: {
		el: '.pagination_fraction4',
		type: 'fraction',

		formatFractionCurrent: function (number) {
			return ('0' + number).slice(-2);
		},
		formatFractionTotal: function (number) {
			return ('0' + number).slice(-2);
		},
		renderFraction: function (currentClass, totalClass) {
			return '<span class="' + currentClass + '"></span>' + ' / ' + '<span class="' + totalClass + '"></span>';
		},
	},
});

//Reference Check
var swiperSw5 = new Swiper('.mySwiper.sw5', {
	loop: true,
	cssMode: true,
	navigation: {
		nextEl: '.swiper-button-next.b5',
		prevEl: '.swiper-button-prev.b5',
	},
	pagination: {
		el: '.swiper-pagination5',
		clickable: true, //버튼 클릭 여부
		type: 'bullets',
	},
});

//페이지네이션 fraction추가
var pagingSwiper = new Swiper('.mySwiper.sw5', {
	loop: true,

	pagination: {
		el: '.pagination_fraction5',
		type: 'fraction',

		formatFractionCurrent: function (number) {
			return ('0' + number).slice(-2);
		},
		formatFractionTotal: function (number) {
			return ('0' + number).slice(-2);
		},
		renderFraction: function (currentClass, totalClass) {
			return '<span class="' + currentClass + '"></span>' + ' / ' + '<span class="' + totalClass + '"></span>';
		},
	},
});

//section3 로고 슬라이드
var swiper = new Swiper('.mySwiper.corpLogo', {
	loop: true,
	cssMode: true,
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	},
	pagination: {
		el: '.swiper-pagination',
		type: 'progressbar',
	},

	mousewheel: true,
	keyboard: true,
});

window.onload = function() {
	// URL의 앵커를 가져옵니다.
	var hash = window.location.hash;
	// 앵커가 존재하는 경우 해당 앵커로 자동으로 이동합니다.
	if (hash) {
	var element = document.querySelector(hash);
	if (element) {
		element.scrollIntoView({ behavior: 'smooth' }); // 스크롤 부드럽게 이동
	}
	}
};

//상단버튼 조작
function topClick() {
	jQuery('html, body').stop().animate({ scrollTop: 0 }, 100);
}

/* AI 인성검사(AI PnA) 측정방식 및 요소 레이어  */
const viewTestType=()=>{
let img_url = jQuery("#img_url").val();
let css_ver = jQuery("#css_ver").val();

jQuery("#packageSt_1").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="$('#measure').hide(); $('body').removeClass('is-popupOpen');$('.measure_step').removeClass('on');jQuery('#packageSt_1').hide();" class="layer_closeBtn"><span>닫기</span></button>

	<div class="measure_step measure">
		<div class="newLayer_header">
			<h3>AI 인성검사(AI PnA) 측정방식 및 요소</h3>
		</div>
		<div class="assessLayer_content">
			<div class="scroll-inner2 scroll-shape">

				<div class="measure-layer-wrap">
					<div class="ms_divide left">
						<p class="measure-tit font-weight-medium">측정방식 : <span class="text-color-1">4가지 방식</span></p>
						<p class="measure-num-way font-weight-medium">1. Normative 방식
							<span class="measure-way-txt font-weight-normal">각 문항을 ‘동의하지 않음＇에서부터 ‘동의함＇까지의 :Liker 6점 척도로 응답 하는 Normative 방식</span>
						</p>

						<p class="measure-num-way font-weight-medium">2. Ipsative 방식
							<span class="measure-way-txt font-weight-normal">지원자의 응답 신뢰도를 평가하고 사회적 바람직성에 의한 반응 왜곡을 통제하는 Ipsative(강제 선택) 방식</span>
						</p>

						<p class="measure-num-way font-weight-medium">3. 상황검사 방식
							<span class="measure-way-txt font-weight-normal">특정 상황에서 응답자의 행동 패턴을 분석하여 직무 적합성, 리더십, 의사 결정 능력 등의 직무 관련 특성을 측정하는 상황검사 방식(응시자별 맞춤 문항)</span>
						</p>

						<p class="measure-num-way font-weight-medium">4. 투사검사 방식
							<span class="measure-way-txt font-weight-normal">(반생산적 행동 점수가 높은 응시자 대상) 결과를 Double-check 할 수 있는 투사검사를 통해 조직의 생산성과 건전성을 위협할 수 있는 리스크 수준 예측 (응시자별 맞춤 문항)</span>
						</p>
					</div>

					<div class="ms_divide right">
						<p class="measure-tit font-weight-medium">측정요소 : <span class="text-color-1">역량 (인재상/조직핵심), <br class="d-sm-none" />8개 반생산적 (CWB) 행동</span></p>
						<span class="measure-list font-weight-normal">국내·외 100개 기업의 인재상, 핵심가치, 필요역량을 분석하여 도출한 15개의 대표역량 중 기업이 측정하고자 하는 5개 역량을 선택하여 측정하여 조직이 필요로 하는 역량을 보유한 지원자 확인</span>

						<span class="measure-list font-weight-normal">조직의 생산성과 건전성을 위협할 수 있는 반생산적 행동을 보이는 지원자 행동 수준 예측</span>
					</div>
				</div>

			</div>
			<div class="packageSt_popup_btn flex">
				<button type="button" class="check" onclick="$('#measure').hide(); $('body').removeClass('is-popupOpen');$('.measure_step').removeClass('on');jQuery('#packageSt_1').hide();">확인</button>
			</div>
		</div>
	</div>
</div>
`).show();
};

/* 역량 커스터마이징 레이어  */
const viewCapability=()=>{
let img_url = jQuery("#img_url").val();
let css_ver = jQuery("#css_ver").val();

jQuery("#packageSt_1").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="$('#ability').hide(); $('body').removeClass('is-popupOpen');$('.ability_step').removeClass('on');jQuery('#packageSt_1').hide();" class="layer_closeBtn"><span>닫기</span></button>
	<div class="ability_step ability on">
		<div class="newLayer_header">
			<h3>역량 커스터마이징 설명</h3>
			<p class="assessLayer-tit">
				인크루트웍스가 제공하는 15개 기본 역량 중 조직이 측정하기를 희망하는 역량 5개를 선택하여 활용하거나,<br>
				이 외의 역량을 평가하기를 희망할 경우, 성격 적도를 활용하여 역량을 새롭게 만들어 조직에게 필요한 역량 측정 가능
			</p>
		</div>
		<div class="assessLayer_content">
			<img src="${img_url}/static/image/info/sub_main/assess/ability_detail_img.png?${css_ver}" alt="assess" class="pc_layer" />
			<img src="${img_url}/static/image/info/sub_main/assess/ability_detail_img_mb.png?${css_ver}" alt="assess" class="mb_layer" />

			<div class="modelling_step_wrap scroll-shape-y">
				<div class="model_step step1">
					<div class="model_tit_box">
						<p class="model_tit">역량모델링</p>
						<div class="model_txt_ct">
							<span class="model_txt">국내외 100개 기업의 인재상, 핵심가치, 필요역량을 분석하여 15개의 역량을 도출함</span>
						</div>
					</div>
					<div class="step_inner">
						<div class="ability_catalog">
							<span>역량1<br>역량2<br>역량3<br>역량4<br>역량5<br>역량6<br>역량7<br>역량8</span>
						</div>
						<div class="ability_catalog">
							<span>역량9<br>역량10<br>역량11<br>역량12<br>역량13<br>역량14<br>역량15</span>
						</div>
					</div>
				</div>
				<div class="model_step step2">
					<div class="model_tit_box">
						<p class="model_tit">1단계</p>
						<div class="model_txt_ct">
							<span class="model_txt">15개 역량 중 국내외 100대 기업에서 사용 빈도가 높은 역량 5개를 활용</span>
						</div>
					</div>
					<div class="step_inner">
						<div class="ability_catalog">
							<span>역량2<br>역량3<br>역량9</span>
						</div>
						<div class="ability_catalog">
							<span>역량11<br>역량15</span>
						</div>
					</div>
				</div>
				<div class="model_step step3">
					<div class="model_tit_box">
						<p class="model_tit">2단계</p>
						<div class="model_txt_ct">
							<span class="model_txt">15개 역량 중 조직에 필요한 <br>역량 5개를 선택하여 활용</span>
						</div>
					</div>
					<div class="step_inner">
						<div class="ability_catalog">
							<span><em class="text-color-1">역량1</em><br>역량2<br>역량3<br>역량4<br>역량5<br><em class="text-color-1">역량6</em><br>역량7<br><em class="text-color-1">역량8</em></span>
						</div>
						<div class="ability_catalog">
							<span>역량9<br>역량10<br><em class="text-color-1">역량11</em><br>역량12<br>역량13<br><em class="text-color-1">역량14</em><br>역량15</span>
						</div>
					</div>
				</div>
				<div class="model_step step4">
					<div class="model_tit_box">
						<p class="model_tit">3단계</p>
						<div class="model_txt_ct">
							<span class="model_txt">15개 역량 외 역량을 측정하기 원할 경우, 성격척도로 역량을 추가로 만들어 활용</span>
						</div>
					</div>
					<div class="step_inner2">
						<p class="inner2_txt">발전을 위한 갈등</p>
						<div class="inner2_imgBox">
							<p>43개 성격척도를 활용</p>
							<div class="personal_img">
								<img src="${img_url}/static/image/info/sub_main/assess/personal_img.png?${css_ver}" alt="성격척도 이미지">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" class="check" onclick="$('#ability').hide(); $('body').removeClass('is-popupOpen');$('.ability_step').removeClass('on');jQuery('#packageSt_1').hide();">확인</button>
			</div>
		</div>
	</div>
</div>
`).show();
};

/* 우리 기업에 적합한 검사 찾기 TIP  */
const viewCompanyTip=()=>{
let img_url = jQuery("#img_url").val();
let css_ver = jQuery("#css_ver").val();

jQuery("#packageSt_1").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="$('#findTip').hide(); $('body').removeClass('is-popupOpen');$('.findtip_step').removeClass('on');jQuery('#packageSt_1').hide();" class="layer_closeBtn"><span>닫기</span></button>
	<div class="findtip_step findtip on">
		<div class="newLayer_header">
			<h3>우리 기업에 적합한 검사 찾기 TIP</h3>
			<p class="assessLayer-tit">
				잠깐! 스마트한 인재, 조직과 직무에 잘 적응할 수 있는 인재를 한 번에 선발하고 싶다면문제해결력게임(PSG)와 AI 인성검사 (AI PnA)가 결합된 <span class="text-color-1">메타검사</span>를 이용해 보세요.
			</p>
		</div>
		<div class="assessLayer_content">
			<div class="scroll-inner scroll-shape">

				<div class="pc_layer">
					<img src="${img_url}/static/image/info/sub_main/assess/step_all_img.svg?${css_ver}" alt="assess"/>
				</div>

				<div class="mb_layer">
					<div class="layer-tabmenu__list">
						<div class="tabmenu-list-wrap">
							<ul class="tabs tabmenu-list-swip">
								<li class="tab-link on" data-tab="tab-1">문제해결게임 (PSG)</li>
								<li class="tab-link" data-tab="tab-2">AI 인성검사 (AI PnA)</li>
								<li class="tab-link" data-tab="tab-3">반생산적행동검사 (CWB)</li>
								<li class="tab-link" data-tab="tab-4">인성검사 (PnA)</li>
								<li class="tab-link" data-tab="tab-5">적성검사 (GCA)</li>
							</ul>
						</div>

						<div id="tab-1" class="tab-content on">
							<div class="tab_cont_qnatest">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 인재를 선발하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">스마트한 인재</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 방식으로 측정하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">온라인</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">지원자에게 어떤 경험을 제공하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">긍정적 / 새로움</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">문제해결력게임 (PSG) 최적</div>
						</div>
						<div id="tab-2" class="tab-content">
							<div class="tab_cont_qnatest">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 인재를 선발하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">스마트한 인재</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 방식으로 측정하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">온라인 / 오프라인</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">지원자에게 어떤 경험을 제공하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">익숙함</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">적성검사 (GCA) 최적</div>
						</div>
						<div id="tab-3" class="tab-content">
							<div class="tab_cont_qnatest">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 인재를 선발하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">조직과 직무에 잘 적응하는 인재</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 방식으로 측정하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">온라인</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">지원자에게 어떤 경험을 제공하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">부적합 지원자 변별용(Screen-out)</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">반생산적행동검사 (CWB) 최적</div>
						</div>
						<div id="tab-4" class="tab-content">
							<div class="tab_cont_qnatest long">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 인재를 선발하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">조직과 직무에 잘 적응하는 인재</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 방식으로 측정하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">온라인</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">지원자에게 어떤 경험을 제공하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">적합 지원자 선별용(Select-in)</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">지원자에게 어떤 경험을 제공하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">YES (기업 맞춤형)</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">AI 인성검사 (AI PnA) 최적</div>
						</div>
						<div id="tab-5" class="tab-content">
							<div class="tab_cont_qnatest long">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 인재를 선발하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">조직과 직무에 잘 적응하는 인재</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">어떤 방식으로 측정하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">온라인 / 오프라인</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">지원자에게 어떤 경험을 제공하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">적합 지원자 선별용(Select-in)</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">지원자에게 어떤 경험을 제공하고 싶으신가요?</span>
										<span class="tip_box_a font-weight-normal text-color-1">NO (표준형)</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">인성검사 (PnA) 최적</div>
						</div>
					</div>
				</div>

				<!--
				<div class="findtip_line_wrap step1">
					<div class="findtip_box left">
						<div class="tip_box">
							<span class="tip_box_q font-weight-normal">어떤 인재를 선발하고 싶으신가요?</span>
							<span class="tip_box_a font-weight-normal text-color-1">스마트한 인재</span>
						</div>
					</div>
					<div class="findtip_box right">
						<div class="tip_box">
							<span class="tip_box_q font-weight-normal">어떤 인재를 선발하고 싶으신가요?</span>
							<span class="tip_box_a font-weight-normal text-color-1">조직과 직무에 잘 적응하는 인재</span>
						</div>
					</div>
				</div>
				-->
			</div>

		</div>
	</div>
	<div class="packageSt_popup_btn flex">
		<button type="button" class="check" onclick="$('#findTip').hide(); $('body').removeClass('is-popupOpen');$('.findtip_step').removeClass('on');jQuery('#packageSt_1').hide();">확인</button>
	</div>

</div>
`).show();
};

const Solution_Refult_View=()=>{
	let chkVal = "";
	let uniqueChk = "";

	jQuery("[id^='suggest']").each(function(i){
		if (jQuery(this).is(":checked")){
			if (chkVal == ""){
				chkVal = chkVal + jQuery(this).val();
			} else {
				chkVal = chkVal + "," + jQuery(this).val();
			}
		}
	});

	if (chkVal == ""){
		alert("추천 패키지 솔루션을 선택해주세요.");
		return false;
	}

	uniqueChk = [...new Set(chkVal)].join(",");

	Solution_Refult_View_1(uniqueChk);
};

const Solution_Refult_View_1=(uniqueChk)=>{

	const addSolutionMenu = ( uniqueChk = '') => {
		let strHTML = "";

		if (uniqueChk.indexOf("1") >= 0){
			strHTML += `<div class="resultBox tp1">
							<p class="result_tit_e">ATS&amp;CRM</p>
							<p class="result_tit">채용관리솔루션</p>
							<span class="result_txt">
								채용홈페이지 제작부터 공고, 지원자/후보자 관리,<br>
								면접일정, 합격 관리 등 채용 전 과정 업무를 자동화하여<br>
								보다 더 효율적으로 관리해주는 솔루션입니다.
							</span>
							<button type="button" class="go_ats_crm layer_detail">자세히 보기</button>
						</div>`;
		}

		if (uniqueChk.indexOf("2") >= 0){
			strHTML += `<div class="resultBox tp2">
							<p class="result_tit_e">ASSESS</p>
							<p class="result_tit">인재검증솔루션</p>
							<span class="result_txt">
								최신이론과 기술이 적용된 인성검사에서부터 적성검사까지<br>
								가능하며 AI기술로 보다 더 정확한 검증까지 가능한<br>
								여러가지 채용검증도구 솔루션 입니다.
							</span>
							<button type="button" class="go_assess layer_detail">자세히 보기</button>
						</div>`;
		}

		if (uniqueChk.indexOf("3") >= 0){
			strHTML += `<div class="resultBox tp5">
							<p class="result_tit_e">Interview</p>
							<p class="result_tit">면접솔루션</p>
							<span class="result_txt">
								지역&amp;장소 구애없이 오프라인 방식 그대로 적용하여<br>
								온라인에서도 확실한 면접을 진행하여 기업에 적합한 인재를 <br>
								찾을 수 있도록 돕는 비대면 면접 솔루션입니다.
							</span>
							<button type="button" class="go_interview layer_detail">자세히 보기</button>
						</div>`;
		}

		if (uniqueChk.indexOf("4") >= 0){
			strHTML += `<div class="resultBox tp3">
							<p class="result_tit_e">Proctor</p>
							<p class="result_tit">시험감독솔루션</p>
							<span class="result_txt">
								다양한 유형의 온라인 시험(IBT)을 간편하게 만들고<br>
								부정행위 방지를 위한시험 감독 및 결과까지 분석해 주는<br>
								솔루션 입니다.
							</span>
							<button type="button" class="go_proctor layer_detail">자세히 보기</button>
						</div>`;
		}

		if (uniqueChk.indexOf("5") >= 0){
			strHTML += `<div class="resultBox tp4">
							<p class="result_tit_e">Reference Check</p>
							<p class="result_tit">평판조회솔루션</p>
							<span class="result_txt">
								체계적인 평판 질문 등록 및 모바일 지원을 통한 높은<br>
								응답률로 지원자/대상자의 제대로 된 검증을 통한 평판조회를<br>
								확인할 수 있는 솔루션입니다.
							</span>
							<button type="button" class="go_referencecheck layer_detail">자세히 보기</button>
						</div>`;
		}
		return strHTML;
	};

jQuery("#packageSt").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>닫기</span></button>
	<div class="packageSt_step num02 on">
		<div class="newLayer_header">
			<h3>추천 패키지 솔루션 결과</h3>
			<p class="packageLayer-tit">
				문제점을 해결할 수 있는 최적화된 <span class="t-blue-point">추천 패키지 솔루션 결과</span> 입니다.<br class="pc">
				<span class="t-blue-point">필요한 솔루션으로만 묶여진 패키지 솔루션</span>을 통해 보다 더 저렴하고 만족스러운 채용 업무 경험을 만나보세요.
			</p>
		</div>
		<div class="packageLayer_content">
			<div class="packageNum2-inner scroll-shape">
				<div class="inner_contents">
					${addSolutionMenu(uniqueChk)}
				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" class="view_close" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');">닫기</button>
				<button type="button" class="view_blue_btn" onclick="Solution_Pop_02('${uniqueChk}');">패키지솔루션 신청</button>
			</div>
		</div>
	</div>
</div>
`);
};

/* 패키지 솔루션 추천 받기 2  */
const Solution_Pop_02=(uniqueChk)=>{

let solution_title = "";
console.log(uniqueChk);

if (uniqueChk.indexOf("1") >= 0){
	if (solution_title == ""){
		solution_title += `ATS&CRM 채용관리솔루션`;
	} else {
		solution_title += `,<br class="mobile"> ATS&CRM 채용관리솔루션`;
	}
}
if (uniqueChk.indexOf("2") >= 0){
	if (solution_title == ""){
		solution_title += `ASSESS 인재검증솔루션`;
	} else {
		solution_title += `,<br class="mobile"> ASSESS 인재검증솔루션`;
	}
}
if (uniqueChk.indexOf("3") >= 0){
	if (solution_title == ""){
		solution_title += `Interview 면접솔루션`;
	} else {
		solution_title += `,<br class="mobile"> Interview 면접솔루션`;
	}
}
if (uniqueChk.indexOf("4") >= 0){
	if (solution_title == ""){
		solution_title += `Proctor 시험감독솔루션`;
	} else {
		solution_title += `,<br class="mobile"> Proctor 시험감독솔루션`;
	}
}
if (uniqueChk.indexOf("5") >= 0){
	if (solution_title == ""){
		solution_title += `Reference Check 평판조회솔루션`;
	} else {
		solution_title += `,<br class="mobile"> Reference Check 평판조회솔루션`;
	}
}

jQuery("#packageSt").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>닫기</span></button>
	<div class="packageSt_step num03 on">
		<div class="newLayer_header">
			<h3>패키지 솔루션 신청 및 문의</h3>
			<p class="caution_txt">
				※ 필요한 솔루션으로만 묶여진 추천 패키지 솔루션 신청 &amp; 문의 화면으로, 작성 시 답변은 패키지 솔루션 기준에 맞춰 진행됩니다.
			</p>
		</div>
		<div class="packageLayer_content">


			<div class="packageNum3-inner scroll-shape">
				<div class="inner_contents">

					<div class="proposal_ipt_wrap">
						<div class="pp_ipt_mb">
							<label for="exampleForControlInput" class="c-label">신청 솔루션<span class="t-star">*</span></label>
							<div id="request_solution_title" class="c-fakeinput">${solution_title}</div>
						</div>

						<div class="pp_ipt_mb2">
							<p class="c-label">요청사항<span class="t-star">*</span></p>
							<div class="wish pp_ipt_flex">
								<div class="check__line">
									<input type="checkbox" id="consulting_3" name="consulting" value="03" checked>
									<label for="consulting_3">
										<span class="chk"></span>
										<span class="suggest_txt">무료체험 신청</span>
									</label>
								</div>
								<div class="check__line">
									<input type="checkbox" id="consulting_1" name="consulting" value="01">
									<label for="consulting_1">
										<span class="chk"></span>
										<span class="suggest_txt">도입문의</span>
									</label>
								</div>
								<div class="check__line">
									<input type="checkbox" id="consulting_2" name="consulting" value="02">
									<label for="consulting_2">
										<span class="chk"></span>
										<span class="suggest_txt">서비스소개서 신청</span>
									</label>
								</div>
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">회사명<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="company_nm" id="company_nm" maxlength="50" placeholder="회사명을 입력해 주세요.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">부서명<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="department" id="department" maxlength="25" placeholder="부서명을 입력해 주세요.">
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">이름<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="mem_nm" id="mem_nm" maxlength="50" placeholder="이름을 입력해 주세요.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">연락처<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="contact" id="contact" maxlength="15" placeholder="연락처를 입력해 주세요.">
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">이메일<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="email" id="email" maxlength="50" placeholder="이메일을 입력해 주세요.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">홈페이지</label>
								<input type="text" class="c-ipt" value="" name="homepage" id="homepage" maxlength="100" placeholder="회사 홈페이지 주소를 입력해 주세요.">
							</div>
						</div>

						<div class="privacy_use_wrap">
							<p class="privacy_use">개인정보 수집 및 이용 안내</p>
							<span class="privacy_cont">수집항목 : (필수)회사명, 부서명, 이름, 연락처, 이메일, (선택) 홈페이지주소</span>
							<span class="privacy_cont">수집목적 : 인크루트웍스 도입 상담 진행, 데모 계정 발급과 솔루션 업데이트 소식 및 뉴스레터 발송</span>
							<span class="privacy_cont">이용기간 : 개인정보 이용 목적 달성 시 까지</span>
							<span class="privacy_caution">위의 개인정보 수집· 이용 동의를 거부하실 수 있으며, 거부 시 위 서비스 이용에 제한이 있을 수 있습니다.</span>
						</div>

						<div class="check__line mt-14">
							<input type="checkbox" id="agreement" name="agreement">
							<label for="agreement">
								<span class="chk"></span>
								<span class="suggest_txt">개인정보 수집 및 이용에 동의합니다. (필수)</span>
							</label>
						</div>
						<div class="check__line mt-14">
							<input type="checkbox" id="agreement2" name="agreement2">
							<label for="agreement2">
								<span class="chk"></span>
								<span class="suggest_txt">데모신청 및 솔루션 업데이트소식, 뉴스레터 수신에 동의합니다. (선택)</span>
							</label>
						</div>
					</div>

				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" class="view_blue_btn" onclick="Svc_Reg('p');">패키지솔루션 신청</button>
			</div>
		</div>
	</div>
</div>
`);
};

/* 패키지 솔루션 추천 받기 1  */
const Solution_Pop_01=()=>{
jQuery("#packageSt").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>닫기</span></button>
	<div class="packageSt_step num01 on">
		<div class="newLayer_header">
			<h3>추천 패키지 솔루션</h3>
			<p class="packageLayer-tit">
				<span class="t-blue-point">고민 또는 해결하고 싶은 채용업무</span>를 모두 선택해주세요.<br>
				고객님의 기업에 필요한 최적화된 <span class="t-blue-point">패키지 솔루션</span>으로 추천해 드립니다. (최소 1개 선택 필수)
			</p>
		</div>
		<div class="packageLayer_content">
			<div class="packageLayer-inner">
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest1" type="checkbox" value="1,2,3,5">
						<label for="suggest1">
							<span class="chk"></span>
							<span class="suggest_txt">채용 전 과정에 맞춰진 솔루션을 추천해주세요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest2" type="checkbox" value="2,3,4">
						<label for="suggest2">
							<span class="chk"></span>
							<span class="suggest_txt">저희 회사에 맞는 시험을 등록하여 지원자를 평가하고 싶어요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest3" type="checkbox" value="1,2">
						<label for="suggest3">
							<span class="chk"></span>
							<span class="suggest_txt">채용 진행 시 지원자를 평가할 수 있는 솔루션을 받아보고 싶어요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest4" type="checkbox" value="1">
						<label for="suggest4">
							<span class="chk"></span>
							<span class="suggest_txt">비대면 면접에 대한 다양한 솔루션을 추천해 주세요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest5" type="checkbox" value="1,2">
						<label for="suggest5">
							<span class="chk"></span>
							<span class="suggest_txt">반복적인 채용업무 위주로 개선하고 싶어요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest6" type="checkbox" value="2,4">
						<label for="suggest6">
							<span class="chk"></span>
							<span class="suggest_txt">온라인 평가/시험 진행 시 부정행위를 확인할 방법이 필요해요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest7" type="checkbox" value="2,3">
						<label for="suggest7">
							<span class="chk"></span>
							<span class="suggest_txt">지원자를 평가 협업이 빠르고 쉽게 진행되었으면 좋겠어요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest8" type="checkbox" value="4">
						<label for="suggest8">
							<span class="chk"></span>
							<span class="suggest_txt">채용 뿐만 아니라 인사 관련 업무 시 대상자 검증 솔루션이 필요해요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest9" type="checkbox" value="4,5">
						<label for="suggest9">
							<span class="chk"></span>
							<span class="suggest_txt">AI 기능이 들어간 채용 솔루션을 받아보고 싶어요.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest10" type="checkbox" value="1,2">
						<label for="suggest10">
							<span class="chk"></span>
							<span class="suggest_txt">가장 많이 사용하고 있는 패키지 솔루션을 추천해주세요.</span>
						</label>
					</div>
				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" id="solution_reset" class="reset">초기화</button>
				<button type="button" class="view_blue_btn" onclick="Solution_Refult_View();">결과보기</button>
			</div>
		</div>
	</div>
</div>
`);
};

/* 도입 문의  */
const Consulting_Pop=()=>{
jQuery("#packageSt").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>닫기</span></button>
	<div class="packageSt_step num04 on">
		<div class="newLayer_header">
			<h3>도입문의 및 데모 신청</h3>
		</div>
		<div class="packageLayer_content">
			<div class="packageNum3-inner scroll-shape">
				<div class="inner_contents">

					<div class="proposal_ipt_wrap">

						<div class="pp_ipt_mb2">
							<p class="c-label">요청사항<span class="t-star">*</span></p>
							<div class="wish pp_ipt_flex">
								<div class="check__line">
									<input type="checkbox" id="consulting_3" name="consulting" value="03" checked>
									<label for="consulting_3">
										<span class="chk"></span>
										<span class="suggest_txt">무료체험 신청</span>
									</label>
								</div>
								<div class="check__line">
									<input type="checkbox" id="consulting_1" name="consulting" value="01">
									<label for="consulting_1">
										<span class="chk"></span>
										<span class="suggest_txt">도입문의</span>
									</label>
								</div>
								<div class="check__line">
									<input type="checkbox" id="consulting_2" name="consulting" value="02">
									<label for="consulting_2">
										<span class="chk"></span>
										<span class="suggest_txt">서비스소개서 신청</span>
									</label>
								</div>
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">회사명<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="company_nm" id="company_nm" maxlength="50" placeholder="회사명을 입력해 주세요.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">부서명<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="department" id="department" maxlength="25" placeholder="부서명을 입력해 주세요.">
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">이름<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="mem_nm" id="mem_nm" maxlength="50" placeholder="이름을 입력해 주세요.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">연락처<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="contact" id="contact" maxlength="15" placeholder="연락처를 입력해 주세요.">
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">이메일<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="email" id="email" maxlength="50" placeholder="이메일을 입력해 주세요.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">홈페이지</label>
								<input type="text" class="c-ipt" value="" name="homepage" id="homepage" maxlength="100" placeholder="회사 홈페이지 주소를 입력해 주세요.">
							</div>
						</div>

						<div class="privacy_use_wrap">
							<p class="privacy_use">개인정보 수집 및 이용 안내</p>
							<span class="privacy_cont">수집항목 : (필수)회사명, 부서명, 이름, 연락처, 이메일, (선택) 홈페이지주소</span>
							<span class="privacy_cont">수집목적 : 인크루트웍스 도입 상담 진행, 데모 계정 발급과 솔루션 업데이트 소식 및 뉴스레터 발송</span>
							<span class="privacy_cont">이용기간 : 개인정보 이용 목적 달성 시 까지</span>
							<span class="privacy_caution">위의 개인정보 수집· 이용 동의를 거부하실 수 있으며, 거부 시 위 서비스 이용에 제한이 있을 수 있습니다.</span>
						</div>

						<div class="check__line mt-14">
							<input type="checkbox" id="agreement" name="agreement">
							<label for="agreement">
								<span class="chk"></span>
								<span class="suggest_txt">개인정보 수집 및 이용에 동의합니다. (필수)</span>
							</label>
						</div>
						<div class="check__line mt-14">
							<input type="checkbox" id="agreement2" name="agreement2">
							<label for="agreement2">
								<span class="chk"></span>
								<span class="suggest_txt">데모신청 및 솔루션 업데이트소식, 뉴스레터 수신에 동의합니다. (선택)</span>
							</label>
						</div>
					</div>

				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" class="view_blue_btn" onclick="Svc_Reg('s');">문의 및 신청</button>
			</div>
		</div>
	</div>
</div>
`);
};

/* 상담 등록 */
const Svc_Reg=(flag)=>{

	let boolflag=true;
	const $consulting=jQuery("input:checkbox[name=consulting]");
	//const $qnacontent=jQuery("#qnacontent");
	const $homepage=jQuery("#homepage")
	const $company_nm=jQuery("#company_nm");
	const $department=jQuery("#department");
	const $mem_nm=jQuery("#mem_nm");
	const $contact=jQuery("#contact");
	const $email=jQuery("#email");
	const $agreement=jQuery("#agreement");
	const site_type = jQuery("#s_type").val().trim();
	const serverset = jQuery("body").data("domain");
	let request_solution_title = "";

	if (flag == "p"){
		request_solution_title = jQuery("#request_solution_title").text();
	}

	let service_cd = "08";
	switch(site_type) {
		case 'ats_crm': service_cd = "08"; break;
		case 'interview': service_cd = "10"; break;
		case 'proctor': service_cd = "11"; break;
		case 'assess': service_cd = "12"; break;
		case 'checkmate': service_cd = "13"; break;
		case 'referencecheck': service_cd = "13"; break;
		default: service_cd = "08"; break;
	}

	// 신청하기 클릭
	gtag('event', 'consulting-apply-'+service_cd);

	let consulting="";

	if($consulting.filter(":checked").length===0){
		alert("요청사항을 선택해주세요.");
		return false;
	} else {
		jQuery("input:checkbox[name=consulting]").filter(":checked").each(function(){return consulting+=","+jQuery(this).val()});
	}

	if($company_nm.val().trim()==""){
		alert("회사명을 입력해 주세요.");
		$company_nm.focus();
		return false;
	}

	if($department.val().trim()==""){
		alert("부서명을 입력해 주세요.");
		$department.focus();
		return false;
	}

	if($mem_nm.val().trim()==""){
		alert("이름을 입력해 주세요.");
		$mem_nm.focus();
		return false;
	}

	if($contact.val().trim()==""){
		alert("연락처를 입력해 주세요.");
		$contact.focus();
		return false;
	}

	if($email.val().trim()==""||$email.val().trim().isEmail()==false){
		alert("이메일을 입력해 주세요.");
		$email.focus();
		return false;
	}

	if($agreement.is(":checked")===false){
		alert("개인정보 수집 및 이용에 동의해 주세요.");
		return false;
	}

	send_url = "//"+serverset+"rasp4.incruit.com/admin/support/api_rasp_intro.asp";

	if (confirm('무료체험을 신청하시겠습니까?')){
		// 신청하기 submit
		gtag('event', 'consulting-submit-'+service_cd);

		let ecode=get_cookie("WORKSHOME")??"";
		if(ecode.length>60){
			ecode=ecode.replace("ECODE=","");
		}

		jQuery.ajax({
			method:"post",
			url: send_url,
			dataType: 'json',
			data: {hcompany_nm:escape($company_nm.val().trim()),hmem_nm:escape($mem_nm.val().trim()),phone:$contact.val().trim(),email:$email.val().trim(),sel_type:consulting,hdepartment:escape($department.val().trim()),homepage:escape($homepage.val().trim()),agreement2:jQuery("#agreement2:checked").length===1?"Y":"", custreceivecd:service_cd, request_solution_title:escape(request_solution_title),e:ecode}
		}).done(function(result){
			if (result.RESULT == "Y"){
				alert("입력하신 이메일 주소로 무료체험 계정이 전달됩니다.\n계정 확인까지 다소 시간이 소요될 수 있습니다.\n(영업일 기준 2~3일 소요)");
				if(typeof(ga) == "function"){
					ga('send', 'event', 'button', 'web_consulting', 'button_click');
				}

				if(typeof(gtag) == "function"){
					gtag('event', 'conversion', {'send_to': 'AW-881718353/G8KTCNeuiN8BENHot6QD'});
				}

				try{
					if(typeof(fbq)=="function"){
						fbq('track', 'SubmitApplication');
					}
				}catch(e){
					closeLayer();
				}
				SetCookie("WORKSHOME","","0","/",".incruit.com","");
			} else {
				alert("다시 신청해 주세요.");
			}

			closeLayer();
		});
	}
};

const Svc_Event_Reg=(flag)=>{

	let boolflag=true;
	const $consulting=jQuery("input:checkbox[name=consulting]");
	//const $qnacontent=jQuery("#qnacontent");
	const $homepage=jQuery("#homepage")
	const $company_nm=jQuery("#company_nm");
	const $department=jQuery("#department");
	const $mem_nm=jQuery("#mem_nm");
	const $contact=jQuery("#contact");
	const $email=jQuery("#email");
	const $agreement=jQuery("#agreement");
	const site_type = jQuery("#s_type").val().trim();
	const serverset = jQuery("body").data("domain");
	let request_solution_title = "";

	if (flag == "p"){
		request_solution_title = jQuery("#request_solution_title").text();
	}

	let service_cd = "08";
	switch(site_type) {
		case 'ats_crm': service_cd = "08"; break;
		case 'interview': service_cd = "10"; break;
		case 'proctor': service_cd = "11"; break;
		case 'assess': service_cd = "12"; break;
		case 'checkmate': service_cd = "13"; break;
		case 'referencecheck': service_cd = "13"; break;
		default: service_cd = "08"; break;
	}

	// 신청하기 클릭
	gtag('event', 'consulting-apply-'+service_cd);

	let consulting="";

	if($mem_nm.val().trim()==""){
		alert("이름을 입력해 주세요.");
		$mem_nm.focus();
		return false;
	}

	if($contact.val().trim()==""){
		alert("연락처를 입력해 주세요.");
		$contact.focus();
		return false;
	}

	if($agreement.is(":checked")===false){
		alert("개인정보 수집 및 이용에 동의해 주세요.");
		return false;
	}

	send_url = "//"+serverset+"rasp4.incruit.com/admin/support/api_rasp_intro.asp";

	if (confirm('무료체험을 신청하시겠습니까?')){
		// 신청하기 submit
		gtag('event', 'consulting-submit-'+service_cd);

		let ecode=get_cookie("WORKSHOME")??"";
		if(ecode.length>60){
			ecode=ecode.replace("ECODE=","");
		}

		jQuery.ajax({
			method:"post",
			url: send_url,
			dataType: 'json',
			data: {hcompany_nm:"",hmem_nm:escape($mem_nm.val().trim()),phone:$contact.val().trim(),email:"",sel_type:"",hdepartment:"",homepage:"",agreement2:"", custreceivecd:service_cd, request_solution_title:escape(request_solution_title),e:ecode}
		}).done(function(result){
			if (result.RESULT == "Y"){
				alert("신청접수가 완료되었습니다.");
				if(typeof(ga) == "function"){
					ga('send', 'event', 'button', 'web_consulting', 'button_click');
				}

				if(typeof(gtag) == "function"){
					gtag('event', 'conversion', {'send_to': 'AW-881718353/G8KTCNeuiN8BENHot6QD'});
				}

				try{
					if(typeof(fbq)=="function"){
						fbq('track', 'SubmitApplication');
					}
				}catch(e){
					closeLayer();
				}
				SetCookie("WORKSHOME","","0","/",".incruit.com","");
			} else {
				alert("다시 신청해 주세요.");
			}
			closeLayer();
		});
	}
};

function closeLayer(){
	jQuery("body").removeClass("is-popupOpen"); //overflow-hidden 해제(스크롤 해제)
	jQuery("#packageSt").empty();
	jQuery("#packageSt").hide(); //팝업 숨김
}
function slider() {
	jQuery('.sub-slider').each(function (index) {
		var $this = jQuery(this);
		var swiper = undefined;
		var slideInx = 0;

		sliderAct();

		function sliderAct() {
			//슬라이드 인덱스 클래스 추가
			$this.addClass(`sub-slider${index}`);

			//슬라이드 초기화
			if (swiper != undefined) {
				swiper.destroy();
				swiper = undefined;
			}

			swiper = new Swiper(`.sub-slider${index} .swiper`, {
				loop: true,
				initialSlide :slideInx,
				allowTouchMove: true,
				speed: 500,
				navigation: {
					prevEl: jQuery(`.sub-slider${index} .swiper-button.prev`)[0],
					nextEl: jQuery(`.sub-slider${index} .swiper-button.next`)[0],
				},
				pagination: {
					el: jQuery(`.sub-slider${index} .swiper-pagination`)[0],
					type: 'progressbar',
				},
				on: {
					activeIndexChange: function () {
						slideInx = this.realIndex; //현재 슬라이드 index 갱신
					}
				},
			});
		}
	});
}
/* 상단 탭 스크롤 시 고정 */
function tabFix() {
	var winTop = jQuery(window).scrollTop(),
		sectionTab = jQuery('.section-tab-wrap'),
		headerH = jQuery('#header').height(),
		sectionTabTop = sectionTab.offset().top;

	if (winTop > sectionTabTop - headerH) {
		sectionTab.addClass('fixed');
	} else {
		sectionTab.removeClass('fixed');
	}
}

/* 상단 탭 스크롤 시 active */
function tabActive() {
	var winScrT = jQuery(window).scrollTop(),
		sectionTab = jQuery('.section-tab-wrap'),
		contSection = jQuery('.section-tab-contents .section'),
		headerH = jQuery('#header').height(),
		endscrTotal = jQuery(document).height() - jQuery(window).height(),
		sectionTabH = jQuery('.section-tab-list').height();

	contSection.each(function () {
		var contSectionT = jQuery(this).offset().top - sectionTabH - headerH,
			contSectionB = contSectionT + jQuery(this).outerHeight();

		if (jQuery(window).width() > 767) {
			if (winScrT >= contSectionT - 60 && winScrT <= contSectionB) {
				jQuery('.section-tab-item .link').removeClass('active');
				sectionTab.find('a[href="#' + jQuery(this).attr('id') + '"]').addClass('active');
			} else if (winScrT >= endscrTotal - 100) {
				jQuery('.section-tab-item .link').removeClass('active');
				sectionTab.find('.section-tab-item:last-child .link').removeClass('active');
			}
		} else {
			if (winScrT >= contSectionT - 50 && winScrT <= contSectionB) {
				jQuery('.section-tab-item .link').removeClass('active');
				sectionTab.find('a[href="#' + jQuery(this).attr('id') + '"]').addClass('active');
			} else if (winScrT >= endscrTotal) {
				jQuery('.section-tab-item .link').removeClass('active');
				sectionTab.find('.section-tab-item:last-child .link').removeClass('active');
			}
		}
	});
}

/* 상단 탭 클릭 시 스크롤 이동 */
jQuery('.section-tab-item .link').on('click', function () {
	var thisHref = jQuery(this).attr('href'),
		thisHrefTop = jQuery(thisHref).offset().top,
		headerH = jQuery('#header').height(),
		sectionTabH = jQuery('.section-tab-list').height();

	if (jQuery(window).width() > 767) {
		jQuery('html, body').stop().animate({ scrollTop: thisHrefTop - headerH - sectionTabH - 60}, 300);
	} else {
		jQuery('html, body').stop().animate({ scrollTop: thisHrefTop - headerH - sectionTabH - 40}, 300);
	}
	jQuery('.section-tab-item .link').removeClass('active');
	jQuery(this).addClass('active');

	return false;
});

//assess 상단 스와이퍼 - 모바일
var swiper = new Swiper(".mbSwiper", {
	pagination: {
		el: ".swiper-pagination",
	},
});

function get_cookie(name){
	var value=document.cookie.match('(^|;) ?'+name+'=([^;]*)(;|$)');
	return value?value[2]:null;
}

function SetCookie(name,value,expires,path,domain,secure){
	const today=new Date();
	today.setTime(today.getTime());

	if (expires){
		expires=expires*1000*60*60*24;
	}

	var expires_date=new Date(today.getTime()+(expires));

	document.cookie=name+"="+escape(value)+
				((expires) ?";expires="+expires_date.toGMTString() : "" ) + //expires.toGMTString()
				((path)    ?";path=" + path : "" ) +
				((domain)  ?";domain=" + domain : "" ) +
				((secure)  ?";secure" : "" ) ;
}

const Consulting_Evnet_Pop=()=>{
	jQuery("#packageSt").empty().append(`
	<div class="newLayer_container">
		<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>닫기</span></button>
		<div class="packageSt_step num04 on">
			<div class="newLayer_header">
				<h3>무료상담신청</h3>
			</div>
			<div class="packageLayer_content">
				<div class="packageNum3-inner scroll-shape">
					<div class="inner_contents">
						<div class="proposal_ipt_wrap">

							<input type="hidden" class="c-ipt" value="" name="company_nm" id="company_nm" maxlength="50" placeholder="회사명을 입력해 주세요.">
							<input type="hidden" class="c-ipt" value="" name="department" id="department" maxlength="25" placeholder="부서명을 입력해 주세요.">
							<input type="hidden" class="c-ipt" value="" name="email" id="email" maxlength="50" placeholder="이메일을 입력해 주세요.">
							<input type="hidden" class="c-ipt" value="" name="homepage" id="homepage" maxlength="100" placeholder="회사 홈페이지 주소를 입력해 주세요.">

							<div class="info pp_ipt_mb pp_ipt_flex">
								<div class="leftIpt">
									<label for="exampleForControlInput" class="c-label">이름<span class="t-star">*</span></label>
									<input type="text" class="c-ipt" value="" name="mem_nm" id="mem_nm" maxlength="50" placeholder="이름을 입력해 주세요.">
								</div>
								<div class="rightIpt">
									<label for="exampleForControlInput" class="c-label">연락처<span class="t-star">*</span></label>
									<input type="text" class="c-ipt" value="" name="contact" id="contact" maxlength="15" placeholder="연락처를 입력해 주세요.">
								</div>
							</div>

							<div class="privacy_use_wrap">
								<p class="privacy_use">개인정보 수집 및 이용 안내</p>
								<span class="privacy_cont">수집항목 : (필수)이름, 연락처</span>
								<span class="privacy_cont">수집목적 : 인크루트웍스 도입 상담 진행</span>
								<span class="privacy_cont">이용기간 : 개인정보 이용 목적 달성 시 까지</span>
								<span class="privacy_caution">위의 개인정보 수집· 이용 동의를 거부하실 수 있으며, 거부 시 위 서비스 이용에 제한이 있을 수 있습니다.</span>
							</div>

							<div class="check__line mt-14">
								<input type="checkbox" id="agreement" name="agreement">
								<label for="agreement">
									<span class="chk"></span>
									<span class="suggest_txt">개인정보 수집 및 이용에 동의합니다. (필수)</span>
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="packageSt_popup_btn flex">
					<button type="button" class="view_blue_btn" onclick="Svc_Event_Reg('s');">문의 및 신청</button>
				</div>
			</div>
		</div>
	</div>
	`);
	};


//도입문의 자동 실행.
function regPopOpen(){
	Consulting_Evnet_Pop();
	jQuery("body").addClass('is-popupOpen');
	jQuery("#packageSt").show();
}

function productInit(){
	const eCode=jQuery("#eCode").val();
	eCode.length==30?regPopOpen():null;
}