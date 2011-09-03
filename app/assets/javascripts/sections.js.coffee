jQuery ->
  bindAJAX '#new_section a.new'
  bindAJAX '[data-section] a.edit'
  bindAJAX '[data-section] a.delete'
  bindSortable '#sections', '/pages/' + page_id + '/sections/sort'
