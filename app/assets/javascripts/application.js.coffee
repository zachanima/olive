jQuery ->
  /* Show notice if text is supplied; else fade out. */
  window.notice = (text) ->
    if text
      $('#notice').html(text).show()
    else
      $('#notice').fadeOut('slow')

  /* Bind conventional ajax to element on click event */
  window.bindAJAX = (selector, url) ->
    $(selector).click ->
      $.ajax
        dataType: 'script'
        url: url
        beforeSend: -> notice('Loading ...')
        complete: -> notice()
      false

  /* Bind progress notice to an element's ajax events */
  window.bindNotice = (selector, text) ->
    $(selector).bind('ajax:beforeSend', -> notice(text))
    $(selector).bind('ajax:complete', -> notice())

  window.page_id = $('[data-page]').attr('data-page')

  $('#notice').click -> notice()
  setTimeout ->
    notice()
  , 3000

  /* TODO: you know what to do. */
  $('#countdown').html(parseInt(((new Date()).setFullYear(2012,0,28) - Date.now()) / 86400000) + ' days left')
