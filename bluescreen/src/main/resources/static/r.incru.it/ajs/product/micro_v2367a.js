jQuery(window).scroll(function(){
	headControll();
});

/* 스크롤 헤더 */
jQuery('#header').mouseover(function(){
	$(this).addClass('header_Fixed');
});
jQuery('#header').mouseleave(function(){
	if(!jQuery(document).scrollTop() > 0){
		jQuery(this).removeClass('header_Fixed');
	}
});

function headControll(){
	var jbHeadDefY = jQuery(window).scrollTop();

	// 메뉴
	if(jbHeadDefY>0){
		jQuery("#header").addClass("header_Fixed");
	}
	else{
		jQuery("#header").removeClass("header_Fixed");
	}
}
function sitemapToggle(){
	jQuery('.btn-category').toggleClass('active');
	jQuery('#sitemap').toggleClass('open');
	//jQuery('#sitemap>ul>li>a').toggleClass('');
	//jQuery('.sec-header').toggleClass('stm-hd');
	jQuery('html').toggleClass('noflow');
}