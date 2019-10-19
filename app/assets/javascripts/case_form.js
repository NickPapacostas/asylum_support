$(document).ready(function() {
	$('.delete-caseworker').on("click", function() {
		console.log("DELETEING")
		caseCaseworkerID = $(this).data("caseworker_id");
		params = {
			type: "POST",
			url: "/case_caseworkers/" + caseCaseworkerID,
			dataType: "json",
			data: {"_method":"delete"},
			complete: function(){
				$('*[data-caseworker_id="' + caseCaseworkerID + '"]').parent().remove();
				$('.flashes').append("<div class='flash success'>Caseworker removed from case</div>")
			}
		}
		$.ajax(params)
	})

	$('#google-drive-edit').click(function(event) {
		event.preventDefault();

		$('#edit-drive-link').removeClass("d-hide");
	})
})