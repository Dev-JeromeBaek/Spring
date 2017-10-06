/**
 * 
 */
$(function() {
	dealNullTable();
	dealApproveTable();
	dealCancelTable();
//	memListTable();
//	memOxListTable();
});

function dealNullTable() {
	$('.hideMoreNullView').hide();
	$(document.getElementById("nullDeal").getElementsByTagName("span").item(1)).hide();
	$("#nullDeal").click(
		function() {
			$(".hideMoreNullView").slideToggle();
				
			var lll = document.getElementById("nullDeal").getElementsByTagName("span");
			$(lll.item(0)).slideToggle(
//					function() {
//						$(".showTopTop1_sub_sub").attr("height", "450px;")
//					}
			);
			$(lll.item(1)).slideToggle(
//					function() {
//						$(".showTopTop1_sub_sub").attr("height", "350px;")
//					}
			);
		}
	);
}

function dealApproveTable() {
	$('.hideMoreApproveView').hide();
	$(document.getElementById("approveDeal").getElementsByTagName("span").item(1)).hide();
	$("#approveDeal").click(
		function() {
			$(".hideMoreApproveView").toggle();				
			var lll = document.getElementById("approveDeal").getElementsByTagName("span");
			$(lll.item(0)).toggle();
			$(lll.item(1)).toggle();
		}
	);
}

function dealCancelTable() {
	$('.hideMoreCancelView').hide();
	$(document.getElementById("cancelDeal").getElementsByTagName("span").item(1)).hide();
	$("#cancelDeal").click(
		function() {
			$(".hideMoreCancelView").slideToggle();
				
			var lll = document.getElementById("cancelDeal").getElementsByTagName("span");
			$(lll.item(0)).slideToggle();
			$(lll.item(1)).slideToggle();
		}
	);
}

function memListTable() {
	$('.hideMoreMemListView').hide();
	$(document.getElementById("moreMemList").getElementsByTagName("span").item(1)).hide();
	$("#moreMemList").click(
		function() {
			$(".hideMoreMemListView").slideToggle();
			
			var lll = document.getElementById("moreMemList").getElementsByTagName("span");
			$(lll.item(0)).slideToggle();
			$(lll.item(1)).slideToggle();
		}
	);
}

function memOxListTable() {
	$('.hideMoreOxListView').hide();
	$(document.getElementById("moreOxList").getElementsByTagName("span").item(1)).hide();
	$("#moreOxList").click(
		function() {
			$(".hideMoreOxListView").slideToggle();				
			var lll = document.getElementById("moreOxList").getElementsByTagName("span");
			$(lll.item(0)).slideToggle();
			$(lll.item(1)).slideToggle();
		}
	);
}

