<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	var currentIndex = 0;
	var _offset = 10;
	
	var $menuLi = $("#menu-list li");
	var $line = $("#menu-line");
	
	$menuLi.on("click", function(){
		
		var _$this = $(this);
						
		TweenMax.killTweensOf($line);
		
		if( _$this.index() > currentIndex ){
			
			TweenMax.to($line, 0.5, {css: {width:  (_$this.position().left + _$this.outerWidth()) - $line.position().left + _offset/2 }, onComplete:function(){
				currentIndex = _$this.index();
				TweenMax.to($line, 0.5, { css:{ left : _$this.position().left - _offset/2, width: _$this.outerWidth() + _offset } })
			} });
			
		} else {
			
			TweenMax.to($line, 0.5, {css: { left: _$this.position().left - _offset/2, width:  ($line.position().left + $line.outerWidth()) - _$this.position().left + _offset/2 }, onComplete:function(){
				currentIndex = _$this.index();
				TweenMax.to($line, 0.5, { css:{ width: _$this.outerWidth() + _offset } })
			} });
			
		}
						
	});	
				
});

</script>
<style type="text/css">
html, body, div {
		margin: 0;
		padding: 0;
		font-family: "Helvetica Neue", Helvetica, sans-serif;
}
		
#menu{
  
	  position: relative;
    text-align: center;
		margin: 100px;
}
		
#menu-line{
		display: block;
		position: absolute;
    left: 50%;
    top: 25px;
		width: 0;
		height: 5px;
		background-color: black;
}
		
ul{
		z-index: 100;
}
		
ul li {
		display: inline-block;
		margin-right: 30px;
}
		
ul li a{
		display: block;
		font-size: 20px;
		text-transform: uppercase;
    text-decoration: none;
		color: black;	
}	
</style>
</head>
<body>
<div id="menu">
  <ul id="menu-list">
      <li> <a href="#">Home</a></li>
  	  <li> <a href="#">Gallery</a></li>
  	  <li> <a href="#">Contacts</a></li>
  	  <li> <a href="#">Blog</a></li>
   </ul>
   <div id="menu-line"></div>
</div>	
</body>
</html>

