jQuery ->
  /* Show notice if text is supplied; else fade out. */
  window.notice = (text) ->
    if text
      $('#notice').html(text).show()
    else
      $('#notice').fadeOut('slow')

  /* Bind conventional ajax to element on click event. */
  window.bindAJAX = (selector, url) ->
    $(selector).click ->
      $.ajax url,
        dataType: 'script'
        beforeSend: -> notice('Loading ...')
        complete: -> notice()
      false

  /* Bind sortable ajax to element. */
  window.bindSortable = (selector, url) ->
    $(selector).sortable
      scroll: true
      axis: 'y'
      helper: 'clone'
      update: ->
        $.ajax url,
          type: 'post'
          dataType: 'script'
          data: $(selector).sortable('serialize')
          beforeSend: -> notice('Saving ...')
          complete: -> notice()

  /* Bind progress notice to an element's ajax events. */
  window.bindNotice = (selector, text) ->
    $(selector).bind('ajax:beforeSend', -> notice(text))
    $(selector).bind('ajax:complete', -> notice())

  window.page_id = $('[data-page]').attr('data-page')

  /* Hide notice on click. */
  $('#notice').click -> notice()

  /* TODO: you know what to do. */
  $('#countdown').html(parseInt(((new Date()).setFullYear(2012,0,28) - Date.now()) / 86400000) + ' days left')
