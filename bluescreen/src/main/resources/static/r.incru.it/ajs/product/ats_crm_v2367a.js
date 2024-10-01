
const IeCheck=function(){
	const agent=navigator.userAgent.toLowerCase();
	if((navigator.appName=='Netscape'&&navigator.userAgent.search('Trident')!=-1)||(agent.indexOf("msie")!=-1)){
		alert('Internet Explorer�� ȣȯ���� �ʴ� ������ �Դϴ�.');
	}
};
//IeCheck();

//�̸��� ���Խ� üũ
String.prototype.isEmail = function() {
	const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(String(this).toLowerCase());
}

//�ڵ�����ȣ ���Խ� üũ
String.prototype.isPhone = function() {
	const re = /^[0-9;\-]*$/;
	return re.test(String(this));
}

$(function(){
	

jQuery(document).ready(()=>{

	if(window.location.search.indexOf("showlayer=y") > 0 ){
		Consulting_Pop();
		jQuery("html").addClass('noFlow'); //overflow:hidden �߰�
		jQuery("#packageSt").show(); //�˾� ����
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


		jQuery("body").addClass('is-popupOpen'); //overflow:hidden �߰�
		jQuery("#packageSt").show(); //�˾� ����
	})
	.on("click", ".package_solution", function() {
		Solution_Pop_01();
		jQuery("body").addClass('is-popupOpen'); //overflow:hidden �߰�
		jQuery("#packageSt").show(); //�˾� ����
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
});
//�޴� �ٿ� ��� - Ŭ������
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
		clickable: true, //��ư Ŭ�� ����
		type: 'bullets',
	},
});

//���������̼� fraction�߰�
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
		clickable: true, //��ư Ŭ�� ����
		type: 'bullets',
	},
});

//���������̼� fraction�߰�
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
		clickable: true, //��ư Ŭ�� ����
		type: 'bullets',
	},
});

//���������̼� fraction�߰�
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
		clickable: true, //��ư Ŭ�� ����
		type: 'bullets',
	},
});

//���������̼� fraction�߰�
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
		clickable: true, //��ư Ŭ�� ����
		type: 'bullets',
	},
});

//���������̼� fraction�߰�
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

//section3 �ΰ� �����̵�
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
	// URL�� ��Ŀ�� �����ɴϴ�.
	var hash = window.location.hash;
	// ��Ŀ�� �����ϴ� ��� �ش� ��Ŀ�� �ڵ����� �̵��մϴ�.
	if (hash) {
	var element = document.querySelector(hash);
	if (element) {
		element.scrollIntoView({ behavior: 'smooth' }); // ��ũ�� �ε巴�� �̵�
	}
	}
};

//��ܹ�ư ����
function topClick() {
	jQuery('html, body').stop().animate({ scrollTop: 0 }, 100);
}

/* AI �μ��˻�(AI PnA) ������� �� ��� ���̾�  */
const viewTestType=()=>{
let img_url = jQuery("#img_url").val();
let css_ver = jQuery("#css_ver").val();

jQuery("#packageSt_1").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="$('#measure').hide(); $('body').removeClass('is-popupOpen');$('.measure_step').removeClass('on');jQuery('#packageSt_1').hide();" class="layer_closeBtn"><span>�ݱ�</span></button>

	<div class="measure_step measure">
		<div class="newLayer_header">
			<h3>AI �μ��˻�(AI PnA) ������� �� ���</h3>
		</div>
		<div class="assessLayer_content">
			<div class="scroll-inner2 scroll-shape">

				<div class="measure-layer-wrap">
					<div class="ms_divide left">
						<p class="measure-tit font-weight-medium">������� : <span class="text-color-1">4���� ���</span></p>
						<p class="measure-num-way font-weight-medium">1. Normative ���
							<span class="measure-way-txt font-weight-normal">�� ������ ���������� �������������� �������ԣ������� :Liker 6�� ô���� ���� �ϴ� Normative ���</span>
						</p>

						<p class="measure-num-way font-weight-medium">2. Ipsative ���
							<span class="measure-way-txt font-weight-normal">�������� ���� �ŷڵ��� ���ϰ� ��ȸ�� �ٶ������� ���� ���� �ְ��� �����ϴ� Ipsative(���� ����) ���</span>
						</p>

						<p class="measure-num-way font-weight-medium">3. ��Ȳ�˻� ���
							<span class="measure-way-txt font-weight-normal">Ư�� ��Ȳ���� �������� �ൿ ������ �м��Ͽ� ���� ���ռ�, ������, �ǻ� ���� �ɷ� ���� ���� ���� Ư���� �����ϴ� ��Ȳ�˻� ���(�����ں� ���� ����)</span>
						</p>

						<p class="measure-num-way font-weight-medium">4. ����˻� ���
							<span class="measure-way-txt font-weight-normal">(�ݻ����� �ൿ ������ ���� ������ ���) ����� Double-check �� �� �ִ� ����˻縦 ���� ������ ���꼺�� �������� ������ �� �ִ� ����ũ ���� ���� (�����ں� ���� ����)</span>
						</p>
					</div>

					<div class="ms_divide right">
						<p class="measure-tit font-weight-medium">������� : <span class="text-color-1">���� (�����/�����ٽ�), <br class="d-sm-none" />8�� �ݻ����� (CWB) �ൿ</span></p>
						<span class="measure-list font-weight-normal">�������� 100�� ����� �����, �ٽɰ�ġ, �ʿ俪���� �м��Ͽ� ������ 15���� ��ǥ���� �� ����� �����ϰ��� �ϴ� 5�� ������ �����Ͽ� �����Ͽ� ������ �ʿ�� �ϴ� ������ ������ ������ Ȯ��</span>

						<span class="measure-list font-weight-normal">������ ���꼺�� �������� ������ �� �ִ� �ݻ����� �ൿ�� ���̴� ������ �ൿ ���� ����</span>
					</div>
				</div>

			</div>
			<div class="packageSt_popup_btn flex">
				<button type="button" class="check" onclick="$('#measure').hide(); $('body').removeClass('is-popupOpen');$('.measure_step').removeClass('on');jQuery('#packageSt_1').hide();">Ȯ��</button>
			</div>
		</div>
	</div>
</div>
`).show();
};

/* ���� Ŀ���͸���¡ ���̾�  */
const viewCapability=()=>{
let img_url = jQuery("#img_url").val();
let css_ver = jQuery("#css_ver").val();

jQuery("#packageSt_1").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="$('#ability').hide(); $('body').removeClass('is-popupOpen');$('.ability_step').removeClass('on');jQuery('#packageSt_1').hide();" class="layer_closeBtn"><span>�ݱ�</span></button>
	<div class="ability_step ability on">
		<div class="newLayer_header">
			<h3>���� Ŀ���͸���¡ ����</h3>
			<p class="assessLayer-tit">
				��ũ��Ʈ������ �����ϴ� 15�� �⺻ ���� �� ������ �����ϱ⸦ ����ϴ� ���� 5���� �����Ͽ� Ȱ���ϰų�,<br>
				�� ���� ������ ���ϱ⸦ ����� ���, ���� ������ Ȱ���Ͽ� ������ ���Ӱ� ����� �������� �ʿ��� ���� ���� ����
			</p>
		</div>
		<div class="assessLayer_content">
			<img src="${img_url}/static/image/info/sub_main/assess/ability_detail_img.png?${css_ver}" alt="assess" class="pc_layer" />
			<img src="${img_url}/static/image/info/sub_main/assess/ability_detail_img_mb.png?${css_ver}" alt="assess" class="mb_layer" />

			<div class="modelling_step_wrap scroll-shape-y">
				<div class="model_step step1">
					<div class="model_tit_box">
						<p class="model_tit">�����𵨸�</p>
						<div class="model_txt_ct">
							<span class="model_txt">������ 100�� ����� �����, �ٽɰ�ġ, �ʿ俪���� �м��Ͽ� 15���� ������ ������</span>
						</div>
					</div>
					<div class="step_inner">
						<div class="ability_catalog">
							<span>����1<br>����2<br>����3<br>����4<br>����5<br>����6<br>����7<br>����8</span>
						</div>
						<div class="ability_catalog">
							<span>����9<br>����10<br>����11<br>����12<br>����13<br>����14<br>����15</span>
						</div>
					</div>
				</div>
				<div class="model_step step2">
					<div class="model_tit_box">
						<p class="model_tit">1�ܰ�</p>
						<div class="model_txt_ct">
							<span class="model_txt">15�� ���� �� ������ 100�� ������� ��� �󵵰� ���� ���� 5���� Ȱ��</span>
						</div>
					</div>
					<div class="step_inner">
						<div class="ability_catalog">
							<span>����2<br>����3<br>����9</span>
						</div>
						<div class="ability_catalog">
							<span>����11<br>����15</span>
						</div>
					</div>
				</div>
				<div class="model_step step3">
					<div class="model_tit_box">
						<p class="model_tit">2�ܰ�</p>
						<div class="model_txt_ct">
							<span class="model_txt">15�� ���� �� ������ �ʿ��� <br>���� 5���� �����Ͽ� Ȱ��</span>
						</div>
					</div>
					<div class="step_inner">
						<div class="ability_catalog">
							<span><em class="text-color-1">����1</em><br>����2<br>����3<br>����4<br>����5<br><em class="text-color-1">����6</em><br>����7<br><em class="text-color-1">����8</em></span>
						</div>
						<div class="ability_catalog">
							<span>����9<br>����10<br><em class="text-color-1">����11</em><br>����12<br>����13<br><em class="text-color-1">����14</em><br>����15</span>
						</div>
					</div>
				</div>
				<div class="model_step step4">
					<div class="model_tit_box">
						<p class="model_tit">3�ܰ�</p>
						<div class="model_txt_ct">
							<span class="model_txt">15�� ���� �� ������ �����ϱ� ���� ���, ����ô���� ������ �߰��� ����� Ȱ��</span>
						</div>
					</div>
					<div class="step_inner2">
						<p class="inner2_txt">������ ���� ����</p>
						<div class="inner2_imgBox">
							<p>43�� ����ô���� Ȱ��</p>
							<div class="personal_img">
								<img src="${img_url}/static/image/info/sub_main/assess/personal_img.png?${css_ver}" alt="����ô�� �̹���">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" class="check" onclick="$('#ability').hide(); $('body').removeClass('is-popupOpen');$('.ability_step').removeClass('on');jQuery('#packageSt_1').hide();">Ȯ��</button>
			</div>
		</div>
	</div>
</div>
`).show();
};

/* �츮 ����� ������ �˻� ã�� TIP  */
const viewCompanyTip=()=>{
let img_url = jQuery("#img_url").val();
let css_ver = jQuery("#css_ver").val();

jQuery("#packageSt_1").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="$('#findTip').hide(); $('body').removeClass('is-popupOpen');$('.findtip_step').removeClass('on');jQuery('#packageSt_1').hide();" class="layer_closeBtn"><span>�ݱ�</span></button>
	<div class="findtip_step findtip on">
		<div class="newLayer_header">
			<h3>�츮 ����� ������ �˻� ã�� TIP</h3>
			<p class="assessLayer-tit">
				���! ����Ʈ�� ����, ������ ������ �� ������ �� �ִ� ���縦 �� ���� �����ϰ� �ʹٸ鹮���ذ�°���(PSG)�� AI �μ��˻� (AI PnA)�� ���յ� <span class="text-color-1">��Ÿ�˻�</span>�� �̿��� ������.
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
								<li class="tab-link on" data-tab="tab-1">�����ذ���� (PSG)</li>
								<li class="tab-link" data-tab="tab-2">AI �μ��˻� (AI PnA)</li>
								<li class="tab-link" data-tab="tab-3">�ݻ������ൿ�˻� (CWB)</li>
								<li class="tab-link" data-tab="tab-4">�μ��˻� (PnA)</li>
								<li class="tab-link" data-tab="tab-5">�����˻� (GCA)</li>
							</ul>
						</div>

						<div id="tab-1" class="tab-content on">
							<div class="tab_cont_qnatest">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ���縦 �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">����Ʈ�� ����</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ������� �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">�¶���</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">�����ڿ��� � ������ �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">������ / ���ο�</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">�����ذ�°��� (PSG) ����</div>
						</div>
						<div id="tab-2" class="tab-content">
							<div class="tab_cont_qnatest">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ���縦 �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">����Ʈ�� ����</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ������� �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">�¶��� / ��������</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">�����ڿ��� � ������ �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">�ͼ���</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">�����˻� (GCA) ����</div>
						</div>
						<div id="tab-3" class="tab-content">
							<div class="tab_cont_qnatest">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ���縦 �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">������ ������ �� �����ϴ� ����</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ������� �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">�¶���</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">�����ڿ��� � ������ �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">������ ������ ������(Screen-out)</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">�ݻ������ൿ�˻� (CWB) ����</div>
						</div>
						<div id="tab-4" class="tab-content">
							<div class="tab_cont_qnatest long">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ���縦 �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">������ ������ �� �����ϴ� ����</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ������� �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">�¶���</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">�����ڿ��� � ������ �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">���� ������ ������(Select-in)</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">�����ڿ��� � ������ �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">YES (��� ������)</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">AI �μ��˻� (AI PnA) ����</div>
						</div>
						<div id="tab-5" class="tab-content">
							<div class="tab_cont_qnatest long">
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ���縦 �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">������ ������ �� �����ϴ� ����</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">� ������� �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">�¶��� / ��������</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">�����ڿ��� � ������ �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">���� ������ ������(Select-in)</span>
									</div>
								</div>
								<div class="findtip_box">
									<div>
										<span class="tip_box_q font-weight-normal">�����ڿ��� � ������ �����ϰ� �����Ű���?</span>
										<span class="tip_box_a font-weight-normal text-color-1">NO (ǥ����)</span>
									</div>
								</div>
							</div>
							<div class="layer-tabmenu-result">�μ��˻� (PnA) ����</div>
						</div>
					</div>
				</div>

				<!--
				<div class="findtip_line_wrap step1">
					<div class="findtip_box left">
						<div class="tip_box">
							<span class="tip_box_q font-weight-normal">� ���縦 �����ϰ� �����Ű���?</span>
							<span class="tip_box_a font-weight-normal text-color-1">����Ʈ�� ����</span>
						</div>
					</div>
					<div class="findtip_box right">
						<div class="tip_box">
							<span class="tip_box_q font-weight-normal">� ���縦 �����ϰ� �����Ű���?</span>
							<span class="tip_box_a font-weight-normal text-color-1">������ ������ �� �����ϴ� ����</span>
						</div>
					</div>
				</div>
				-->
			</div>

		</div>
	</div>
	<div class="packageSt_popup_btn flex">
		<button type="button" class="check" onclick="$('#findTip').hide(); $('body').removeClass('is-popupOpen');$('.findtip_step').removeClass('on');jQuery('#packageSt_1').hide();">Ȯ��</button>
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
		alert("��õ ��Ű�� �ַ���� �������ּ���.");
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
							<p class="result_tit">ä������ַ��</p>
							<span class="result_txt">
								ä��Ȩ������ ���ۺ��� ����, ������/�ĺ��� ����,<br>
								��������, �հ� ���� �� ä�� �� ���� ������ �ڵ�ȭ�Ͽ�<br>
								���� �� ȿ�������� �������ִ� �ַ���Դϴ�.
							</span>
							<button type="button" class="go_ats_crm layer_detail">�ڼ��� ����</button>
						</div>`;
		}

		if (uniqueChk.indexOf("2") >= 0){
			strHTML += `<div class="resultBox tp2">
							<p class="result_tit_e">ASSESS</p>
							<p class="result_tit">��������ַ��</p>
							<span class="result_txt">
								�ֽ��̷а� ����� ����� �μ��˻翡������ �����˻����<br>
								�����ϸ� AI����� ���� �� ��Ȯ�� �������� ������<br>
								�������� ä��������� �ַ�� �Դϴ�.
							</span>
							<button type="button" class="go_assess layer_detail">�ڼ��� ����</button>
						</div>`;
		}

		if (uniqueChk.indexOf("3") >= 0){
			strHTML += `<div class="resultBox tp5">
							<p class="result_tit_e">Interview</p>
							<p class="result_tit">�����ַ��</p>
							<span class="result_txt">
								����&amp;��� ���־��� �������� ��� �״�� �����Ͽ�<br>
								�¶��ο����� Ȯ���� ������ �����Ͽ� ����� ������ ���縦 <br>
								ã�� �� �ֵ��� ���� ���� ���� �ַ���Դϴ�.
							</span>
							<button type="button" class="go_interview layer_detail">�ڼ��� ����</button>
						</div>`;
		}

		if (uniqueChk.indexOf("4") >= 0){
			strHTML += `<div class="resultBox tp3">
							<p class="result_tit_e">Proctor</p>
							<p class="result_tit">���谨���ַ��</p>
							<span class="result_txt">
								�پ��� ������ �¶��� ����(IBT)�� �����ϰ� �����<br>
								�������� ������ ���ѽ��� ���� �� ������� �м��� �ִ�<br>
								�ַ�� �Դϴ�.
							</span>
							<button type="button" class="go_proctor layer_detail">�ڼ��� ����</button>
						</div>`;
		}

		if (uniqueChk.indexOf("5") >= 0){
			strHTML += `<div class="resultBox tp4">
							<p class="result_tit_e">Reference Check</p>
							<p class="result_tit">������ȸ�ַ��</p>
							<span class="result_txt">
								ü������ ���� ���� ��� �� ����� ������ ���� ����<br>
								������� ������/������� ����� �� ������ ���� ������ȸ��<br>
								Ȯ���� �� �ִ� �ַ���Դϴ�.
							</span>
							<button type="button" class="go_referencecheck layer_detail">�ڼ��� ����</button>
						</div>`;
		}
		return strHTML;
	};

jQuery("#packageSt").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>�ݱ�</span></button>
	<div class="packageSt_step num02 on">
		<div class="newLayer_header">
			<h3>��õ ��Ű�� �ַ�� ���</h3>
			<p class="packageLayer-tit">
				�������� �ذ��� �� �ִ� ����ȭ�� <span class="t-blue-point">��õ ��Ű�� �ַ�� ���</span> �Դϴ�.<br class="pc">
				<span class="t-blue-point">�ʿ��� �ַ�����θ� ������ ��Ű�� �ַ��</span>�� ���� ���� �� �����ϰ� ���������� ä�� ���� ������ ����������.
			</p>
		</div>
		<div class="packageLayer_content">
			<div class="packageNum2-inner scroll-shape">
				<div class="inner_contents">
					${addSolutionMenu(uniqueChk)}
				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" class="view_close" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');">�ݱ�</button>
				<button type="button" class="view_blue_btn" onclick="Solution_Pop_02('${uniqueChk}');">��Ű���ַ�� ��û</button>
			</div>
		</div>
	</div>
</div>
`);
};

/* ��Ű�� �ַ�� ��õ �ޱ� 2  */
const Solution_Pop_02=(uniqueChk)=>{

let solution_title = "";
console.log(uniqueChk);

if (uniqueChk.indexOf("1") >= 0){
	if (solution_title == ""){
		solution_title += `ATS&CRM ä������ַ��`;
	} else {
		solution_title += `,<br class="mobile"> ATS&CRM ä������ַ��`;
	}
}
if (uniqueChk.indexOf("2") >= 0){
	if (solution_title == ""){
		solution_title += `ASSESS ��������ַ��`;
	} else {
		solution_title += `,<br class="mobile"> ASSESS ��������ַ��`;
	}
}
if (uniqueChk.indexOf("3") >= 0){
	if (solution_title == ""){
		solution_title += `Interview �����ַ��`;
	} else {
		solution_title += `,<br class="mobile"> Interview �����ַ��`;
	}
}
if (uniqueChk.indexOf("4") >= 0){
	if (solution_title == ""){
		solution_title += `Proctor ���谨���ַ��`;
	} else {
		solution_title += `,<br class="mobile"> Proctor ���谨���ַ��`;
	}
}
if (uniqueChk.indexOf("5") >= 0){
	if (solution_title == ""){
		solution_title += `Reference Check ������ȸ�ַ��`;
	} else {
		solution_title += `,<br class="mobile"> Reference Check ������ȸ�ַ��`;
	}
}

jQuery("#packageSt").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>�ݱ�</span></button>
	<div class="packageSt_step num03 on">
		<div class="newLayer_header">
			<h3>��Ű�� �ַ�� ��û �� ����</h3>
			<p class="caution_txt">
				�� �ʿ��� �ַ�����θ� ������ ��õ ��Ű�� �ַ�� ��û &amp; ���� ȭ������, �ۼ� �� �亯�� ��Ű�� �ַ�� ���ؿ� ���� ����˴ϴ�.
			</p>
		</div>
		<div class="packageLayer_content">


			<div class="packageNum3-inner scroll-shape">
				<div class="inner_contents">

					<div class="proposal_ipt_wrap">
						<div class="pp_ipt_mb">
							<label for="exampleForControlInput" class="c-label">��û �ַ��<span class="t-star">*</span></label>
							<div id="request_solution_title" class="c-fakeinput">${solution_title}</div>
						</div>

						<div class="pp_ipt_mb2">
							<p class="c-label">��û����<span class="t-star">*</span></p>
							<div class="wish pp_ipt_flex">
								<div class="check__line">
									<input type="checkbox" id="consulting_3" name="consulting" value="03" checked>
									<label for="consulting_3">
										<span class="chk"></span>
										<span class="suggest_txt">����ü�� ��û</span>
									</label>
								</div>
								<div class="check__line">
									<input type="checkbox" id="consulting_1" name="consulting" value="01">
									<label for="consulting_1">
										<span class="chk"></span>
										<span class="suggest_txt">���Թ���</span>
									</label>
								</div>
								<div class="check__line">
									<input type="checkbox" id="consulting_2" name="consulting" value="02">
									<label for="consulting_2">
										<span class="chk"></span>
										<span class="suggest_txt">���񽺼Ұ��� ��û</span>
									</label>
								</div>
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">ȸ���<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="company_nm" id="company_nm" maxlength="50" placeholder="ȸ����� �Է��� �ּ���.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">�μ���<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="department" id="department" maxlength="25" placeholder="�μ����� �Է��� �ּ���.">
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">�̸�<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="mem_nm" id="mem_nm" maxlength="50" placeholder="�̸��� �Է��� �ּ���.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">����ó<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="contact" id="contact" maxlength="15" placeholder="����ó�� �Է��� �ּ���.">
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">�̸���<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="email" id="email" maxlength="50" placeholder="�̸����� �Է��� �ּ���.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">Ȩ������</label>
								<input type="text" class="c-ipt" value="" name="homepage" id="homepage" maxlength="100" placeholder="ȸ�� Ȩ������ �ּҸ� �Է��� �ּ���.">
							</div>
						</div>

						<div class="privacy_use_wrap">
							<p class="privacy_use">�������� ���� �� �̿� �ȳ�</p>
							<span class="privacy_cont">�����׸� : (�ʼ�)ȸ���, �μ���, �̸�, ����ó, �̸���, (����) Ȩ�������ּ�</span>
							<span class="privacy_cont">�������� : ��ũ��Ʈ���� ���� ��� ����, ���� ���� �߱ް� �ַ�� ������Ʈ �ҽ� �� �������� �߼�</span>
							<span class="privacy_cont">�̿�Ⱓ : �������� �̿� ���� �޼� �� ����</span>
							<span class="privacy_caution">���� �������� ������ �̿� ���Ǹ� �ź��Ͻ� �� ������, �ź� �� �� ���� �̿뿡 ������ ���� �� �ֽ��ϴ�.</span>
						</div>

						<div class="check__line mt-14">
							<input type="checkbox" id="agreement" name="agreement">
							<label for="agreement">
								<span class="chk"></span>
								<span class="suggest_txt">�������� ���� �� �̿뿡 �����մϴ�. (�ʼ�)</span>
							</label>
						</div>
						<div class="check__line mt-14">
							<input type="checkbox" id="agreement2" name="agreement2">
							<label for="agreement2">
								<span class="chk"></span>
								<span class="suggest_txt">�����û �� �ַ�� ������Ʈ�ҽ�, �������� ���ſ� �����մϴ�. (����)</span>
							</label>
						</div>
					</div>

				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" class="view_blue_btn" onclick="Svc_Reg('p');">��Ű���ַ�� ��û</button>
			</div>
		</div>
	</div>
</div>
`);
};

/* ��Ű�� �ַ�� ��õ �ޱ� 1  */
const Solution_Pop_01=()=>{
jQuery("#packageSt").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>�ݱ�</span></button>
	<div class="packageSt_step num01 on">
		<div class="newLayer_header">
			<h3>��õ ��Ű�� �ַ��</h3>
			<p class="packageLayer-tit">
				<span class="t-blue-point">��� �Ǵ� �ذ��ϰ� ���� ä�����</span>�� ��� �������ּ���.<br>
				������ ����� �ʿ��� ����ȭ�� <span class="t-blue-point">��Ű�� �ַ��</span>���� ��õ�� �帳�ϴ�. (�ּ� 1�� ���� �ʼ�)
			</p>
		</div>
		<div class="packageLayer_content">
			<div class="packageLayer-inner">
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest1" type="checkbox" value="1,2,3,5">
						<label for="suggest1">
							<span class="chk"></span>
							<span class="suggest_txt">ä�� �� ������ ������ �ַ���� ��õ���ּ���.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest2" type="checkbox" value="2,3,4">
						<label for="suggest2">
							<span class="chk"></span>
							<span class="suggest_txt">���� ȸ�翡 �´� ������ ����Ͽ� �����ڸ� ���ϰ� �;��.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest3" type="checkbox" value="1,2">
						<label for="suggest3">
							<span class="chk"></span>
							<span class="suggest_txt">ä�� ���� �� �����ڸ� ���� �� �ִ� �ַ���� �޾ƺ��� �;��.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest4" type="checkbox" value="1">
						<label for="suggest4">
							<span class="chk"></span>
							<span class="suggest_txt">���� ������ ���� �پ��� �ַ���� ��õ�� �ּ���.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest5" type="checkbox" value="1,2">
						<label for="suggest5">
							<span class="chk"></span>
							<span class="suggest_txt">�ݺ����� ä����� ���ַ� �����ϰ� �;��.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest6" type="checkbox" value="2,4">
						<label for="suggest6">
							<span class="chk"></span>
							<span class="suggest_txt">�¶��� ��/���� ���� �� ���������� Ȯ���� ����� �ʿ��ؿ�.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest7" type="checkbox" value="2,3">
						<label for="suggest7">
							<span class="chk"></span>
							<span class="suggest_txt">�����ڸ� �� ������ ������ ���� ����Ǿ����� ���ھ��.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest8" type="checkbox" value="4">
						<label for="suggest8">
							<span class="chk"></span>
							<span class="suggest_txt">ä�� �Ӹ� �ƴ϶� �λ� ���� ���� �� ����� ���� �ַ���� �ʿ��ؿ�.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest9" type="checkbox" value="4,5">
						<label for="suggest9">
							<span class="chk"></span>
							<span class="suggest_txt">AI ����� �� ä�� �ַ���� �޾ƺ��� �;��.</span>
						</label>
					</div>
				</div>
				<div class="package_chkBox">
					<div class="check__line">
						<input id="suggest10" type="checkbox" value="1,2">
						<label for="suggest10">
							<span class="chk"></span>
							<span class="suggest_txt">���� ���� ����ϰ� �ִ� ��Ű�� �ַ���� ��õ���ּ���.</span>
						</label>
					</div>
				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" id="solution_reset" class="reset">�ʱ�ȭ</button>
				<button type="button" class="view_blue_btn" onclick="Solution_Refult_View();">�������</button>
			</div>
		</div>
	</div>
</div>
`);
};

/* ���� ����  */
const Consulting_Pop=()=>{
jQuery("#packageSt").empty().append(`
<div class="newLayer_container">
	<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>�ݱ�</span></button>
	<div class="packageSt_step num04 on">
		<div class="newLayer_header">
			<h3>���Թ��� �� ���� ��û</h3>
		</div>
		<div class="packageLayer_content">
			<div class="packageNum3-inner scroll-shape">
				<div class="inner_contents">

					<div class="proposal_ipt_wrap">

						<div class="pp_ipt_mb2">
							<p class="c-label">��û����<span class="t-star">*</span></p>
							<div class="wish pp_ipt_flex">
								<div class="check__line">
									<input type="checkbox" id="consulting_3" name="consulting" value="03" checked>
									<label for="consulting_3">
										<span class="chk"></span>
										<span class="suggest_txt">����ü�� ��û</span>
									</label>
								</div>
								<div class="check__line">
									<input type="checkbox" id="consulting_1" name="consulting" value="01">
									<label for="consulting_1">
										<span class="chk"></span>
										<span class="suggest_txt">���Թ���</span>
									</label>
								</div>
								<div class="check__line">
									<input type="checkbox" id="consulting_2" name="consulting" value="02">
									<label for="consulting_2">
										<span class="chk"></span>
										<span class="suggest_txt">���񽺼Ұ��� ��û</span>
									</label>
								</div>
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">ȸ���<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="company_nm" id="company_nm" maxlength="50" placeholder="ȸ����� �Է��� �ּ���.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">�μ���<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="department" id="department" maxlength="25" placeholder="�μ����� �Է��� �ּ���.">
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">�̸�<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="mem_nm" id="mem_nm" maxlength="50" placeholder="�̸��� �Է��� �ּ���.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">����ó<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="contact" id="contact" maxlength="15" placeholder="����ó�� �Է��� �ּ���.">
							</div>
						</div>

						<div class="info pp_ipt_mb pp_ipt_flex">
							<div class="leftIpt">
								<label for="exampleForControlInput" class="c-label">�̸���<span class="t-star">*</span></label>
								<input type="text" class="c-ipt" value="" name="email" id="email" maxlength="50" placeholder="�̸����� �Է��� �ּ���.">
							</div>
							<div class="rightIpt">
								<label for="exampleForControlInput" class="c-label">Ȩ������</label>
								<input type="text" class="c-ipt" value="" name="homepage" id="homepage" maxlength="100" placeholder="ȸ�� Ȩ������ �ּҸ� �Է��� �ּ���.">
							</div>
						</div>

						<div class="privacy_use_wrap">
							<p class="privacy_use">�������� ���� �� �̿� �ȳ�</p>
							<span class="privacy_cont">�����׸� : (�ʼ�)ȸ���, �μ���, �̸�, ����ó, �̸���, (����) Ȩ�������ּ�</span>
							<span class="privacy_cont">�������� : ��ũ��Ʈ���� ���� ��� ����, ���� ���� �߱ް� �ַ�� ������Ʈ �ҽ� �� �������� �߼�</span>
							<span class="privacy_cont">�̿�Ⱓ : �������� �̿� ���� �޼� �� ����</span>
							<span class="privacy_caution">���� �������� ������ �̿� ���Ǹ� �ź��Ͻ� �� ������, �ź� �� �� ���� �̿뿡 ������ ���� �� �ֽ��ϴ�.</span>
						</div>

						<div class="check__line mt-14">
							<input type="checkbox" id="agreement" name="agreement">
							<label for="agreement">
								<span class="chk"></span>
								<span class="suggest_txt">�������� ���� �� �̿뿡 �����մϴ�. (�ʼ�)</span>
							</label>
						</div>
						<div class="check__line mt-14">
							<input type="checkbox" id="agreement2" name="agreement2">
							<label for="agreement2">
								<span class="chk"></span>
								<span class="suggest_txt">�����û �� �ַ�� ������Ʈ�ҽ�, �������� ���ſ� �����մϴ�. (����)</span>
							</label>
						</div>
					</div>

				</div>
			</div>

			<div class="packageSt_popup_btn flex">
				<button type="button" class="view_blue_btn" onclick="Svc_Reg('s');">���� �� ��û</button>
			</div>
		</div>
	</div>
</div>
`);
};

/* ��� ��� */
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

	// ��û�ϱ� Ŭ��
	gtag('event', 'consulting-apply-'+service_cd);

	let consulting="";

	if($consulting.filter(":checked").length===0){
		alert("��û������ �������ּ���.");
		return false;
	} else {
		jQuery("input:checkbox[name=consulting]").filter(":checked").each(function(){return consulting+=","+jQuery(this).val()});
	}

	if($company_nm.val().trim()==""){
		alert("ȸ����� �Է��� �ּ���.");
		$company_nm.focus();
		return false;
	}

	if($department.val().trim()==""){
		alert("�μ����� �Է��� �ּ���.");
		$department.focus();
		return false;
	}

	if($mem_nm.val().trim()==""){
		alert("�̸��� �Է��� �ּ���.");
		$mem_nm.focus();
		return false;
	}

	if($contact.val().trim()==""){
		alert("����ó�� �Է��� �ּ���.");
		$contact.focus();
		return false;
	}

	if($email.val().trim()==""||$email.val().trim().isEmail()==false){
		alert("�̸����� �Է��� �ּ���.");
		$email.focus();
		return false;
	}

	if($agreement.is(":checked")===false){
		alert("�������� ���� �� �̿뿡 ������ �ּ���.");
		return false;
	}

	send_url = "//"+serverset+"rasp4.incruit.com/admin/support/api_rasp_intro.asp";

	if (confirm('����ü���� ��û�Ͻðڽ��ϱ�?')){
		// ��û�ϱ� submit
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
				alert("�Է��Ͻ� �̸��� �ּҷ� ����ü�� ������ ���޵˴ϴ�.\n���� Ȯ�α��� �ټ� �ð��� �ҿ�� �� �ֽ��ϴ�.\n(������ ���� 2~3�� �ҿ�)");
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
				alert("�ٽ� ��û�� �ּ���.");
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

	// ��û�ϱ� Ŭ��
	gtag('event', 'consulting-apply-'+service_cd);

	let consulting="";

	if($mem_nm.val().trim()==""){
		alert("�̸��� �Է��� �ּ���.");
		$mem_nm.focus();
		return false;
	}

	if($contact.val().trim()==""){
		alert("����ó�� �Է��� �ּ���.");
		$contact.focus();
		return false;
	}

	if($agreement.is(":checked")===false){
		alert("�������� ���� �� �̿뿡 ������ �ּ���.");
		return false;
	}

	send_url = "//"+serverset+"rasp4.incruit.com/admin/support/api_rasp_intro.asp";

	if (confirm('����ü���� ��û�Ͻðڽ��ϱ�?')){
		// ��û�ϱ� submit
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
				alert("��û������ �Ϸ�Ǿ����ϴ�.");
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
				alert("�ٽ� ��û�� �ּ���.");
			}
			closeLayer();
		});
	}
};

function closeLayer(){
	jQuery("body").removeClass("is-popupOpen"); //overflow-hidden ����(��ũ�� ����)
	jQuery("#packageSt").empty();
	jQuery("#packageSt").hide(); //�˾� ����
}
function slider() {
	jQuery('.sub-slider').each(function (index) {
		var $this = jQuery(this);
		var swiper = undefined;
		var slideInx = 0;

		sliderAct();

		function sliderAct() {
			//�����̵� �ε��� Ŭ���� �߰�
			$this.addClass(`sub-slider${index}`);

			//�����̵� �ʱ�ȭ
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
						slideInx = this.realIndex; //���� �����̵� index ����
					}
				},
			});
		}
	});
}
/* ��� �� ��ũ�� �� ���� */
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

/* ��� �� ��ũ�� �� active */
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

/* ��� �� Ŭ�� �� ��ũ�� �̵� */
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

//assess ��� �������� - �����
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
		<button type="button" onclick="jQuery('#packageSt').hide(); jQuery('body').removeClass('is-popupOpen');jQuery('.packageSt_step').removeClass('on');" class="layer_closeBtn"><span>�ݱ�</span></button>
		<div class="packageSt_step num04 on">
			<div class="newLayer_header">
				<h3>�������û</h3>
			</div>
			<div class="packageLayer_content">
				<div class="packageNum3-inner scroll-shape">
					<div class="inner_contents">
						<div class="proposal_ipt_wrap">

							<input type="hidden" class="c-ipt" value="" name="company_nm" id="company_nm" maxlength="50" placeholder="ȸ����� �Է��� �ּ���.">
							<input type="hidden" class="c-ipt" value="" name="department" id="department" maxlength="25" placeholder="�μ����� �Է��� �ּ���.">
							<input type="hidden" class="c-ipt" value="" name="email" id="email" maxlength="50" placeholder="�̸����� �Է��� �ּ���.">
							<input type="hidden" class="c-ipt" value="" name="homepage" id="homepage" maxlength="100" placeholder="ȸ�� Ȩ������ �ּҸ� �Է��� �ּ���.">

							<div class="info pp_ipt_mb pp_ipt_flex">
								<div class="leftIpt">
									<label for="exampleForControlInput" class="c-label">�̸�<span class="t-star">*</span></label>
									<input type="text" class="c-ipt" value="" name="mem_nm" id="mem_nm" maxlength="50" placeholder="�̸��� �Է��� �ּ���.">
								</div>
								<div class="rightIpt">
									<label for="exampleForControlInput" class="c-label">����ó<span class="t-star">*</span></label>
									<input type="text" class="c-ipt" value="" name="contact" id="contact" maxlength="15" placeholder="����ó�� �Է��� �ּ���.">
								</div>
							</div>

							<div class="privacy_use_wrap">
								<p class="privacy_use">�������� ���� �� �̿� �ȳ�</p>
								<span class="privacy_cont">�����׸� : (�ʼ�)�̸�, ����ó</span>
								<span class="privacy_cont">�������� : ��ũ��Ʈ���� ���� ��� ����</span>
								<span class="privacy_cont">�̿�Ⱓ : �������� �̿� ���� �޼� �� ����</span>
								<span class="privacy_caution">���� �������� ������ �̿� ���Ǹ� �ź��Ͻ� �� ������, �ź� �� �� ���� �̿뿡 ������ ���� �� �ֽ��ϴ�.</span>
							</div>

							<div class="check__line mt-14">
								<input type="checkbox" id="agreement" name="agreement">
								<label for="agreement">
									<span class="chk"></span>
									<span class="suggest_txt">�������� ���� �� �̿뿡 �����մϴ�. (�ʼ�)</span>
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="packageSt_popup_btn flex">
					<button type="button" class="view_blue_btn" onclick="Svc_Event_Reg('s');">���� �� ��û</button>
				</div>
			</div>
		</div>
	</div>
	`);
	};


//���Թ��� �ڵ� ����.
function regPopOpen(){
	Consulting_Evnet_Pop();
	jQuery("body").addClass('is-popupOpen');
	jQuery("#packageSt").show();
}

function productInit(){
	/*const eCode=jQuery("#eCode").val();
	eCode.length==30?regPopOpen():null;*/
}