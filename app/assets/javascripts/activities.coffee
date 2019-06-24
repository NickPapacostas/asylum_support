ready = ->
  $('#activities-datatable').dataTable
    columnDefs: [
      {className: "text-center", "targets": "_all"}
    ],
    processing: true
    serverSide: true
    ajax: $('#activities-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'case_number'}
      {data: 'created_at'}
      {data: 'activity_type'}
      {data: 'notes'}
    ]

$(document).ready(ready)
$(document).on('page:load', ready)