jQuery ->
  $('div#notice').fadeIn()
  $('div#notice').click -> $(this).fadeOut()

  $('a.edit').click ->
    unless $(this).hasClass('noclick')
      $(this).html('Loading ...')

  window.page = $('div[data-page]')
