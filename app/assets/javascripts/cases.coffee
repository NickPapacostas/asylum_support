ready = ->
  console.log("running!")
  $('#cases-datatable').dataTable
    columnDefs: [
      {className: "text-center", "targets": "_all"}
    ],
    processing: true
    bLengthChange: false
    bInfo:false
    serverSide: true
    order: [[1, "asc"]]
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