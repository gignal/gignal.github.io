function alignCurtain (elem, container, num) {
	var containerOffset = $(container).offset().left;
	var newOffset = containerOffset + num;
	$(elem).offset({
		left: newOffset
	});
}

function resize () {
	alignCurtain('.stream-img', '.td', 163.5);
	alignCurtain('.curtain-img', '.laptop', 140.5);
}


Zepto(function ($) {
	// show bg
	$('.curtain-img').show();
	// position bg
	resize();
	$(window).resize(resize);
});
