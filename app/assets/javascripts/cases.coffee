ready = ->
  console.log("running!")
  if (window.location.pathname != null) && (window.location.pathname.match("dashboard"))
    display_length = 10
  else
    display_length = 100

  $('#cases-datatable').dataTable
    columnDefs: [
      {className: "text-center", "targets": "_all"}
    ],
    processing: true
    bInfo:false
    serverSide: true
    order: [[0, "desc"]]
    iDisplayLength: display_length
    ajax: $('#cases-datatable').data('source')
    columns: [
      {data: 'number'}
      {data: 'member_name'}
      {data: 'member_dob'}
      {data: 'member_nationality'}
      {data: 'member_case_number'}
      {data: 'caseworker'}
      {data: 'last_updated'}
    ]

$(document).ready(ready)
$(document).on('page:load', ready)