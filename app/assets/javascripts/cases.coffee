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
    ajax: $('#cases-datatable').data('source')
    columns: [
      {data: 'number'}
      {data: 'member_name'}
      {data: 'caseworker'}
      {data: 'last_updated'}
    ]

$(document).ready(ready)
$(document).on('page:load', ready)