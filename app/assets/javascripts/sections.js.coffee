jQuery ->
  $('div#new_section a.edit').click ->
    $.ajax
      url: '/pages/' + page.attr('data-page') + '/sections/new',
      success: (data) -> $('#new_section').html(data)
    false

  $('div[data-section] a.edit').click ->
    section = $(this).parent()
    $.ajax
      url: '/pages/' + page.attr('data-page') + '/sections/' + section.attr('data-section') + '/edit'
      success: (data) -> section.html(data)
    false
