$('.member-modal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})

function postCallback(data){
	// $('.modal').modal('hide');
	window.location.reload();
}

function initMemberModal(){
	$('.member-modal-save').on('click', function() {
		$('#case-save').click()
	})
}

$(document).ready(function(){
	initMemberModal();
})

$(document).on("fields_added.nested_form_fields", function(){
	initMemberModal();
})
