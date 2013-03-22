if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function deleteDomain(urlController, domainId) {
	var dados = {id: domainId};
	$.ajax({
		type: 'POST', 
		url: urlController, 
		data: dados
	}).done(function(data){ 
		if (data.status == 'ok') {
			document.location.reload();
		} else {
			alert(data.message);
		}
	});
}