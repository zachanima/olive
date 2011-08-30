jQuery ->
  $('ol#pages').sortable
    scroll: true,
    axis: 'y',
    update: ->
      $('#notice').show()
      $('#notice').html('Saving ...')
      $.ajax
        type: 'post',
        data: $('ol#pages').sortable('serialize'),
        url: '/pages/sort'
        success: ->
          $('#notice').fadeOut('slow')

  /* TODO: Use js (or possibly json) format. */
  $('div[data-page] a.edit').click ->
    $.ajax
      url: '/pages/' + page.attr('data-page') + '/edit'
      success: (data) ->
        page.html(data)
        $('#notice').fadeOut('slow')
    false
