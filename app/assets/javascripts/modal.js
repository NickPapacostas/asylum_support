$('.member-modal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})

function postCallback(data){
	// $('.modal').modal('hide');
	window.location.reload();
}

function initMemberModal(){
	$('.member-modal-save').on('click', function() {
		// var split_pathname = window.location.pathname.split("/")
		// var last_path_element = split_pathname[split_pathname.length - 1]
		// var new_record;

		// var post_url = '/cases/';
		// var case_form = $('.new_case');
		// if (!!parseInt(last_path_element)) {
		// 	// case already persisted
		// 	post_url = post_url + last_path_element
		// 	case_form = $('.edit_case')
		// 	$.ajax({
		// 	  type: "POST",
		// 	  url: post_url,
		// 	  data: case_form.serialize(),
		// 	  success: function(data) {
		// 			postCallback(data)
		// 	  },
		// 	  error: function(data) {
		// 	  	postCallback(data)
		// 	  }
		// 	});
		// } else {
		// }
		$('#case-save').click()

	})

}

$(document).ready(function(){
	initMemberModal();
})

$(document).on("fields_added.nested_form_fields", function(){
	initMemberModal();
})
