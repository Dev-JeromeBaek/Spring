(function () {
	var current = 0; //현재 위치
	var max = 0;
	
	var yeobContainer;
	
	function init() {
		yeobContainer = jQuery(".slide ul");
		max = yeobContainer.children().length; // ul안에있는 li들을 의미함(배열형태)
		
		
		console.log( "init" );
		
		events();
	}
	function events() {
		jQuery("button.prev").on("click", prev);
		jQuery("button.next").on("click", next);
		
//		on, bind, delegate
		
	}
	
	function prev( e ) {
		current--;
		if( current < 0 ) current = max-1;
		animate();
	}
	function next( e ) {
		current++;
		if( current > max-1 ) current = 0;
		animate();
		
	}
	function animation() {
		var moveX = current * 480;
		TweenMax.to( yeobContainer, 0.8, { marginLeft:-moveX, ease:Expo.easeOut } );
//		delay from yoyo...
	}
	jQuery( document ).ready( init );
})();