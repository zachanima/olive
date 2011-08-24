jQuery ->
  $('div[data-section] a.edit').click ->
    unless $(this).hasClass('noclick')
      section = $(this).parent()
      $.ajax
        url: '/pages/' + page.attr('data-page') + '/sections/' + section.attr('data-section') + '/edit'
        success: (data) -> section.html(data)
    false

  $('div#new_section a.edit').click ->
    unless $(this).hasClass('noclick')
      $.ajax
        url: '/pages/' + page.attr('data-page') + '/sections/new',
        success: (data) -> $('#new_section').html(data)
    false

  $('div#sections').sortable
    scroll: true,
    axis: 'y',
    stop: (event, ui) ->
      ui.item.children('a.edit').addClass('noclick')
      setTimeout -> ui.item.children('a.edit').removeClass('noclick')
    update: ->
      $.ajax
        type: 'post',
        data: $('div#sections').sortable('serialize'),
        url: '/pages/' + page.attr('data-page') + '/sections/sort'
