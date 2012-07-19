//= require active_admin/base
//= require jquery.form.js
$(document).ready(function(){
	var location = window.location.toString();
//	alert('test');


//	$("#formRoles").unbind("submit");
	$("#formRoles").submit(function(e){	

		$(this).ajaxSubmit({

			beforeSubmit : function () {
				alert('test4');
                        return true;				
			},
			success : function (data) {				
				alert('test2');
			},
			error : function (evt, xhr, status) {
			}
		});
		e.preventDefault();		
	});
	

});