
$(document).ready(function() {
	$('.activity-created').on('click', function(event) {
		var id = $(event.target).data('activity-id');
		var activity = JSON.parse(decodeURIComponent($(event.target).data('activity-json')))
		$('#activity-viewport .activity-type').text(activity.case_activity_type)
		$('#activity-viewport .activity-owner').text(activity.first_name)
		$('#activity-viewport .activity-notes').text(activity.notes)
		$('#activity-viewport').removeClass('hide')
	})
})