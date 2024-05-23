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


function initEditFilename() {
	$('.modal .edit-filename-close').on('click', function() {
		$('.modal').removeClass('active')
	});

	$('.close-modal').on('click', function () {
		$('.modal').removeClass('active')
	});

	$(".open-edit-filename-modal").on("click", function(event)
	{
		modal_id = ".edit-filename-modal-" + $(event.target).data('file-id')
		$(modal_id).removeClass('d-hide')
		$(modal_id).addClass('active')
	})


}

$(document).ready(function(){
	initMemberModal();
	initEditFilename();
})

$(document).on("fields_added.nested_form_fields", function(){
	initMemberModal();
})
