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

  $('[data-section]').each ->
    section_id = $(this).attr('data-section')
    bindEdit '#section_' + section_id + ' a.edit',
      '/pages/' + page.attr('data-page') + '/sections/' + section_id + '/edit'

  $('div#new_section a.new').click ->
    $.ajax
      url: '/pages/' + page.attr('data-page') + '/sections/new',
      success: (data) ->
        $('#new_section').html(data)
        notice()
    false

