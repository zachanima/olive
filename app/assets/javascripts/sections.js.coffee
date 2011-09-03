jQuery ->
  bindAJAX '[data-section] a.edit'
  bindAJAX '#new_section a.new'
  bindSortable '#sections', '/pages/' + page_id + '/sections/sort'
