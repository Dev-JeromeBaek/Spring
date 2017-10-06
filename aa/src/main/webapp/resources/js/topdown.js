$(function(){ //{{{
    _loadCommon();
});//}}}

function _loadCommon()
{
    $('.page_top_down a.top').click(function(){$('html, body').scrollTop(0);});
    $('.page_top_down a.down').click(function(){
        var scroll_down_height = getDocHeight();
        $('html, body').scrollTop(scroll_down_height);
    });
    $(window).bind('scroll', function() {
        if($(window).scrollTop() > 0)
            $('.page_top_down').fadeIn(500);
        else if($(window).scrollTop() == 0)
            $('.page_top_down').fadeOut(500);
    });
    $(window).bind('resize', function() {
        if ($(window).width() <= 990)
            $('.page_top_down').addClass('min_fixed');
        else
            $('.page_top_down').removeClass('min_fixed');
    });

    if ($(window).width() <= 990)
        $('.page_top_down').addClass('min_fixed');
}