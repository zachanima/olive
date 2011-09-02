jQuery ->
  $('[data-section]').each -> bindAJAX '#' + $(this).attr('id') + ' a.edit'

  bindAJAX '#new_section a.new', '/pages/' + page_id + '/sections/new'
  bindSortable '#sections', '/pages/' + page_id + '/sections/sort'
