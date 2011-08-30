jQuery ->
  $('#notice').click -> $(this).fadeOut('slow')
  setTimeout ->
    $('#notice').fadeOut('slow')
  , 3000

  /* TODO: remove noclick class */
  $('a.edit').click ->
    unless $(this).hasClass('noclick')
      $('#notice').show()
      $('#notice').html('Loading ...')

  window.page = $('div[data-page]')
