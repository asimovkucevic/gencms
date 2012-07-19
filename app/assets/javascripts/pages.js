
$(document).ready(function(){
	var location = window.location.toString();
//	alert('test');


	$("#formRoles").unbind("submit");
	$("#formRoles").submit(function(e){	

		e.preventDefault();
		$(this).ajaxSubmit({

			beforeSubmit : function (data) {
				alert('test4');
			},
			success : function (data) {				
				alert('test2');
			},
			error : function (evt, xhr, status) {
			}
		});
	});
	

});