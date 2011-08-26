jQuery ->
  $('div#notice').fadeIn()
  $('div#notice').click -> $(this).fadeOut()

  /* TODO: remove noclick class */
  $('a.edit').click ->
    unless $(this).hasClass('noclick')
      $(this).html('Loading ...')

  window.page = $('div[data-page]')
