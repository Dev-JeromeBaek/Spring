/**
 * 
 */
// [Yeob's].js module

// #.01 [평소엔 선명도 0.5 // 마우스 올렸을 때 선명도 1.0]
//		=> opacity : 선명도


	<script type="text/javascript">
// 		$(".thumbs a") => class="thumbs"의 내부에 있는 a태그
		$(".thumbs a").hover(
			function() {
				$(this).find("img").css("opacity","1");
				var thisSrc = $(this).attr("href");
				$("#largeImg").attr("src", thisSrc);
			},
			function() {
				$(this).find("img").css("opacity", "0.5");
			}
		);
	
	</script>
	
	
//	#.02 [hover : 마우스 올려짐 상태]
	
	