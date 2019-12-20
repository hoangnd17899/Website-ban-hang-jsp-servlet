/**
 * 
 */
function GetURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++){
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}

$(document).ready(function(){
	var cate=GetURLParameter('category');
	var currentpage=GetURLParameter('page');
	if(cate!=null){
		$('#'+cate).addClass('bg-secondary');
		$('#'+cate).css('color','white');
	}
	else{
		$('#all').addClass('bg-secondary');
		$('#all').css('color','white');
	}
	if(currentpage!=null){
		$('a[page='+currentpage+']').css('background-color','#c5c5c5');
	}
	else{
		$('a[page="1"]').css('background-color','#c5c5c5');
	}
})