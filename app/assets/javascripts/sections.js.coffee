jQuery ->
  /* TODO: remove noclick class */
  $('div[data-section] a.edit').click ->
    unless $(this).hasClass('noclick')
      section = $(this).parent()
      $.ajax
        url: '/pages/' + page.attr('data-page') + '/sections/' + section.attr('data-section') + '/edit'
        success: (data) ->
          section.html(data)
          $('#notice').fadeOut('slow')
    false

  $('div#new_section a.new').click ->
    $.ajax
      url: '/pages/' + page.attr('data-page') + '/sections/new',
      success: (data) ->
        $('#new_section').html(data)
        $('#notice').fadeOut('slow')
    false

  /* TODO: remove noclick class */
  $('div#sections').sortable
    scroll: true,
    axis: 'y',
    stop: (event, ui) ->
      ui.item.children('a.edit').addClass('noclick')
      setTimeout -> ui.item.children('a.edit').removeClass('noclick')
    update: ->
      $('#notice').show()
      $('#notice').html('Saving ...')
      $.ajax
        type: 'post',
        data: $('div#sections').sortable('serialize'),
        url: '/pages/' + page.attr('data-page') + '/sections/sort'
        success: ->
          $('#notice').fadeOut('slow')
