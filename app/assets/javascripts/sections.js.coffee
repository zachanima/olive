jQuery ->
  $('[data-section]').each ->
    section_id = $(this).attr('data-section')
    bindAJAX '#section_' + section_id + ' a.edit',
      '/pages/' + page_id + '/sections/' + section_id + '/edit'

  bindAJAX '#new_section a.new', '/pages/' + page_id + '/sections/new'
  bindSortable '#sections', '/pages/' + page_id + '/sections/sort'
