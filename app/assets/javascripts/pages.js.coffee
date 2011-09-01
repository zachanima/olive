jQuery ->
  bindAJAX '[data-page] a.edit', '/pages/' + page_id + '/edit'
  bindSortable '#pages', '/pages/sort'
