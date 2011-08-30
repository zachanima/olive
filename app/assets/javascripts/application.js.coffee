jQuery ->
  $('#notice').click -> $(this).fadeOut('slow')
  setTimeout ->
    $('#notice').fadeOut('slow')
  , 3000

  /* TODO: you know what to do. */
  $('#countdown').html(parseInt(((new Date()).setFullYear(2012,0,28) - Date.now()) / 86400000) + ' days left')

  /* TODO: remove noclick class. */
  $('a.edit').click ->
    unless $(this).hasClass('noclick')
      $('#notice').show()
      $('#notice').html('Loading ...')

  window.page = $('div[data-page]')

