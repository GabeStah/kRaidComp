jQuery ->
  # Create spells datatable
  $('#spells-table').dataTable
    ajax: $('#spells-table').data('source')
    lengthMenu: [ [25, 50, 9223372036854775807], [25, 50, "All"] ]
    pagingType: 'full_numbers'
    processing: true
    serverSide: true