$(window).scroll(function () {
	var pageFooter = $('.pageFooter');
	if ($(window).scrollTop() + $(window).height() === $(document).height()) {
		pageFooter[0].style.marginTop = "-50px";
		pageFooter[0].style.height = "50px";
		pageFooter[0].style.opacity = "0.9";
	}
	if ($(window).scrollTop() + $(window).height() !== $(document).height()) {
		if (pageFooter[0].style.marginTop === "-50px") {
			pageFooter[0].style.cssText = "";
		}
	}
});