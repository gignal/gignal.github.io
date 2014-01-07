$(function()
{
	$(".curtain-img").fadeIn(1000);

	var lastScrollTop = 0, delta = 12;
	$(window).scroll(function()
	{
		var st = $(this).scrollTop();
		if (st > lastScrollTop)
		{
			$('.stream-img').stop(true).animate(
			{
				top : "+=" + delta
			}, 400);
		}
		else
		{
			$('.stream-img').stop(true).animate(
			{
				top : "-=" + delta
			}, 400);
		}

		lastScrollTop = st;
	});

	alignCurtain(".stream-img", ".td", 163.5);
	alignCurtain(".curtain-img", ".laptop", 140.5);

	$(window).resize(function()
	{
		alignCurtain(".stream-img", ".td", 163.5);
		alignCurtain(".curtain-img", ".laptop", 140.5);
	});
});

function alignCurtain(elem, container, num)
{
	var containerOffset, newOffset;
	containerOffset = $(container).offset().left;
	newOffset = containerOffset + num;
	$(elem).offset(
	{
		left : newOffset
	});
}