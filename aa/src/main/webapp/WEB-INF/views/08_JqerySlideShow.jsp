<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

	
	
	<style type="text/css">
    #slideshow {
  
    position:relative;
    height:300px;
	
		}
		
		#slideshow IMG {
 		    position:absolute; 
		    top:0;
		    left:0;
		    z-index:1;
		}
		
		#slideshow IMG.active {
		    z-index:3;
		}
		
		#slideshow IMG.last-active {
		    z-index:2;
		}
	</style>
	
</head>
<body>
	
	
<div id="slideshow">
    <img src="/JqueryForProject/myImg/사진1.jpg" alt="미안요" class="active" />
    <img src="/JqueryForProject/myImg/사진3.jpg" alt="미안요" />
    <img src="/JqueryForProject/myImg/사진4.jpg" alt="미안요" />
</div>


	


	<script>

	function slideSwitch() {
	    var active = $('#slideshow IMG.active');

	    if ( active.length == 0 ) active = $('#slideshow IMG:last');

	    var next =  active.next().length ? active.next()
	        : $('#slideshow IMG:first');

	    active.addClass('last-active');
	        
	    next.css({opacity: 0.0})
	        .addClass('active')
	        .animate({opacity: 1.0}, 1000, function() {
	            active.removeClass('active last-active');
	        });
	}

	$(function() {
	    setInterval( "slideSwitch()", 1000 );
	});
	
</script>
	
</body>
</html>