ready = ->
  $('#cases-search-datatable').dataTable
    columnDefs: [
      {className: "text-center", "targets": "_all"}
    ],
    processing: true
    bInfo: true
    serverSide: true
    order: [[0, "desc"]]
    iDisplayLength: 100
    ajax: $('#cases-search-datatable').data('source')
    columns: [
      {data: 'number'}
      {data: 'first_name'}
      {data: 'last_name'}
      {data: 'caseworker'}
      {data: 'last_updated'}
      {data: 'description'}
    ]

$(document).ready(ready)
$(document).on('page:load', ready)