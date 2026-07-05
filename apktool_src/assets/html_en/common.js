function goBack() {
	//解决Safari中后退功能的兼容问题  
	if (navigator.userAgent && /(iPhone|iPad|iPod|Safari)/i.test(navigator.userAgent)) {
		window.location.href = window.document.referrer;
	} else {
		window.history.back(-1); //根据需要可使用history.go(-1);  
	}
}
