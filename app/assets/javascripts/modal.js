$('.member-modal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})

function postCallback(){
	$('.modal').modal('hide');
}

function initMemberModal(){
	$('.member-modal-save').on('click', function() {
		var split_pathname = window.location.pathname.split("/")
		var last_path_element = split_pathname[split_pathname.length - 1]
		var new_record;

		var post_url = '/cases/';

		if (!!parseInt(last_path_element)) {
			post_url = post_url + last_path_element
		}

		$.ajax({
		  type: "POST",
		  url: post_url,
		  data: $('.edit_case').serialize(),
		  success: function(data) {
				console.log($('.modal'))
				console.log("hello")
				$('.modal').modal('hide');
		  },
		  error: function(data) {
		  	$('.modal').modal('hide');
		  }
		});
	})

}

$(document).ready(function(){
	initMemberModal();
})

$(document).on("fields_added.nested_form_fields", function(){
	initMemberModal();
})
