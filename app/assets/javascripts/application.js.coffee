jQuery ->
  $('div#notice').fadeIn()
  $('div#notice').click -> $(this).fadeOut()

  $('a.edit').click -> $(this).html('Loading ...')

  window.page = $('div[data-page]')
