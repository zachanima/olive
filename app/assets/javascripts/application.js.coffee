window.notice = (text) ->
  e = $('#notice')
  if text
    e.html(text).show()
  else
    e.fadeOut('slow')

jQuery ->
  $('#notice').click -> notice()
  setTimeout ->
    notice()
  , 3000

  /* TODO: you know what to do. */
  $('#countdown').html(parseInt(((new Date()).setFullYear(2012,0,28) - Date.now()) / 86400000) + ' days left')

  /* TODO: remove noclick class. */
  $('a.edit').click ->
    unless $(this).hasClass('noclick')
      notice('Loading ...')

  window.page = $('div[data-page]')
