/**
 * 
 */

$(function() {
	memListTable();
	memOxListTable();
});

function memListTable() {
	$('.hideMoreMemListView').hide();
	$(document.getElementById("moreMemList").getElementsByTagName("span").item(1)).hide();
	$("#moreMemList").click(
		function() {
			alert("안녕 나야..");
			$(".hideMoreMemListView").slideToggle();
			
			var lll = document.getElementById("moreMemList").getElementsByTagName("span");
			$(lll.item(0)).slideToggle();
			$(lll.item(1)).slideToggle();
			alert("들어간다");
		}
	);
}

function memOxListTable() {
	$('.hideMoreOxListView').hide();
	$(document.getElementById("moreOxList").getElementsByTagName("span").item(1)).hide();
	$("#moreOxList").click(
		function() {
			alert("안녕 나야..");
			$(".hideMoreOxListView").slideToggle();				
			var lll = document.getElementById("moreOxList").getElementsByTagName("span");
			$(lll.item(0)).slideToggle();
			$(lll.item(1)).slideToggle();
			alert("들어간다");
		}
	);
}

