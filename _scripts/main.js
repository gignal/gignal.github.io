function handlerIn () {
	$(this).find('.subnav').stop(true , true).slideDown();
}

function handlerOut () {
	$(this).find('.subnav').stop(true , true).slideUp();
}

$(function(){
	$('.topbar li').hover(handlerIn, handlerOut);
});
