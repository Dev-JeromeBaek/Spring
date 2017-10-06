/**
 * 
 */
function timedCount() {
//	postMessage('text');
	alert('DDD');
	setTimeout("timedCount()", 3000);
	alert('FFFFF');
}
//
timedCount();