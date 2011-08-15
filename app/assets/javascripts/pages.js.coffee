jQuery ->
  $('#new_section a').click ->
    $(this).html('Loading ...')
    $.ajax
      url: '/pages/' + $('#new_section').attr('data-page') + '/sections/new',
      success: (data) -> $('#new_section').html(data)
    false
