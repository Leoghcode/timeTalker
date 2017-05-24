$(document).ready(function(){
	//tasklistload
	
	$(".planheader").click(function(){
		var divid=$(this).parent().parent().parent().parent();
		divid.find(".slidedown").slideToggle();
	});
	
	
}
);