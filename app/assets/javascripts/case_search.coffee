ready = ->
  $('#cases-search-datatable').dataTable
    columnDefs: [
      {className: "text-center", "targets": "_all"}
    ],
    processing: true
    bInfo:false
    serverSide: true
    order: [[0, "desc"]]
    iDisplayLength: 100
    ajax: $('#cases-datatable').data('source')
    columns: [
      {data: 'number'}
      {data: 'first_name'}
      {data: 'last_name'}
      {data: 'caseworker'}
      {data: 'description'}
      {data: 'last_updated'}
    ]

$(document).ready(ready)
$(document).on('page:load', ready)