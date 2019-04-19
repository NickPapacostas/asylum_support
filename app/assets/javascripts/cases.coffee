ready = ->
  console.log("running!")
  $('#cases-datatable').dataTable
    columnDefs: [
      {className: "text-center", "targets": "_all"}
    ],
    processing: true
    serverSide: true
    ajax: $('#cases-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'number'}
      {data: 'first_name'}
      {data: 'last_name'}
      {data: 'caseworker'}
      {data: 'last_updated'}
    ]

$(document).ready(ready)
$(document).on('page:load', ready)