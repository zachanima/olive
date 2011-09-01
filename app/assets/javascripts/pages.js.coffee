jQuery ->
  $('ol#pages').sortable
    scroll: true,
    axis: 'y',
    update: ->
      $.ajax
        type: 'post',
        data: $('ol#pages').sortable('serialize'),
        url: '/pages/sort'
        beforeSend: -> notice('Saving ...')
        complete: -> notice()

  bindAJAX('[data-page] a.edit', '/pages/' + page_id + '/edit')
