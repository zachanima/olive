jQuery ->
  bindAJAX '#links a.edit'
  bindSortable 'body.manage #links', '/links/sort'
