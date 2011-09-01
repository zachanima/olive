jQuery ->
  /* TODO: remove noclick class */
  $('div#sections').sortable
    scroll: true,
    axis: 'y',
    update: ->
      notice('Saving ...')
      $.ajax
        type: 'post',
        data: $('div#sections').sortable('serialize')
        url: '/pages/' + page.attr('data-page') + '/sections/sort'
        complete: -> notice()

  $('[data-section] a.edit').click ->
    section = $(this).parent()
    $.ajax
      dataType: 'script'
      url: '/pages/' + page.attr('data-page') + '/sections/' + section.attr('data-section') + '/edit'
      beforeSend: -> notice('Loading ...')
      complete: -> notice()
    false

  $('div#new_section a.new').click ->
    $.ajax
      url: '/pages/' + page.attr('data-page') + '/sections/new',
      success: (data) ->
        $('#new_section').html(data)
        notice()
    false

