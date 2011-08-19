jQuery ->
  $('ol#pages').sortable
    scroll: true,
    axis: 'y',
    update: ->
      $.ajax
        type: 'post',
        data: $('ol#pages').sortable('serialize'),
        url: '/pages/sort'

  $('div[data-page] a.edit').click ->
    $.ajax
      url: '/pages/' + page.attr('data-page') + '/edit'
      success: (data) -> page.html(data)
    false
