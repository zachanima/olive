jQuery ->
  $('ol#pages').sortable
    scroll: true,
    axis: 'y',
    update: ->
      $('#notice').html('Saving ...').show()
      $.ajax
        type: 'post',
        data: $('ol#pages').sortable('serialize'),
        url: '/pages/sort'
        complete: -> $('#notice').fadeOut('slow')

  $('[data-page] a.edit').click ->
    $.ajax
      dataType: 'script'
      url: '/pages/' + page.attr('data-page') + '/edit'
      complete: -> $('#notice').fadeOut('slow')
    false

