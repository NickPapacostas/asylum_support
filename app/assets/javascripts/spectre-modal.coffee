initMemberModal = ->
	$('.member-modal-save').on('click', ->
		$('#case-save').click())

	$('.modal .member-close').on('click', ->
		$('.modal').removeClass('active'))

	$('.close-modal').on('click', ->
		$('.modal').removeClass('active'))

	$('.open-member-modal').on('click', (event) ->
		console.log('opening', $(event.target).data('target'))
		modal_id = $(event.target).data('target')
		$(modal_id).addClass('active'))

$ ->
	initMemberModal()

$(document).on "fields_added.nested_form_fields", (event, param) ->
  initMemberModal()