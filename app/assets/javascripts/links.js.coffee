jQuery ->
  $('ol#links').sortable
    scroll: true,
    axis: 'y',
    update: ->
      $.ajax
        type: 'post',
        data: $('ol#links').sortable('serialize'),
        url: '/links/sort'
        beforeSave: -> notice('Saving ...')
        complete: -> notice()
