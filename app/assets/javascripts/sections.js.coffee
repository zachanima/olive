jQuery ->
  /* TODO: remove noclick class */
  $('div#sections').sortable
    scroll: true,
    axis: 'y',
    update: ->
      $.ajax
        type: 'post',
        data: $('div#sections').sortable('serialize')
        url: '/pages/' + page.attr('data-page') + '/sections/sort'
        beforeSend: -> notice('Saving ...')
        complete: -> notice()

  $('[data-section]').each ->
    section_id = $(this).attr('data-section')
    bindEdit '#section_' + section_id + ' a.edit',
      '/pages/' + page.attr('data-page') + '/sections/' + section_id + '/edit'

  bindEdit '#new_section a.new',
    '/pages/' + page.attr('data-page') + '/sections/new'
