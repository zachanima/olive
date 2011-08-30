jQuery ->
  $('ol#links').sortable
    scroll: true,
    axis: 'y',
    update: ->
      $('#notice').show()
      $('#notice').html('Saving ...')
      $.ajax
        type: 'post',
        data: $('ol#links').sortable('serialize'),
        url: '/links/sort'
        success: ->
          $('#notice').fadeOut('slow')
