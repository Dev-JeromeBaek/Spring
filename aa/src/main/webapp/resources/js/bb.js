
$('.pgwMenu').pgwMenu();
$('a[data-goto]').click(function() {
	pgwjs.goTo($(this).attr('data-goto'));
});
var pgwSlider = $('.pgwSlider').pgwSlider();
function reloadSlider() {
	var newConfig = {};
	var listPosition = $('input[name=\"listPosition\"]:checked').val();
	if (listPosition == 'none') {
		newConfig.displayList = false;
	} else {
		newConfig.listPosition = listPosition;
	}
	newConfig.selectionMode = $('input[name=\"selectionMode\"]:checked').val();
	newConfig.transitionEffect = $('input[name=\"transitionEffect\"]:checked').val();
	if ($('#displayControls:checked').val() == 'true') {
		newConfig.displayControls = true;
	}
	if ($('#verticalCentering:checked').val() == 'true') {
		newConfig.verticalCentering = true;
	}
	if ($('#adaptiveHeight:checked').val() == 'true') {
		newConfig.adaptiveHeight = true;
	}
	if ($('#maxHeight:checked').val() == 'true') {
		newConfig.maxHeight = 300;
	}
	pgwSlider.reload(newConfig);
}
$('.sliderConfig input').bind('change', function() {
	reloadSlider()
});(function(i, s, o, g, r, a, m) {
	i['GoogleAnalyticsObject'] = r;i[r] = i[r] || function() {
		(i[r].q = i[r].q || []).push(arguments)
	}, i[r].l = 1 * new Date();a = s.createElement(o), m = s.getElementsByTagName(o)[0];
	a.async = 1;
	a.src = g;m.parentNode.insertBefore(a, m)
})(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');ga('create', 'UA-59412371-1', 'auto');ga('send', 'pageview');