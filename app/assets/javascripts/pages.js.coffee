jQuery ->
  page_id = $('[data-page]').attr('data-page')

  $('a.edit').click -> $(this).html('Loading ...')

  $('#new_section a.edit').click ->
    $.ajax
      url: '/pages/' + page_id + '/sections/new',
      success: (data) -> $('#new_section').html(data)
    false

  $('div[data-section] a.edit').click ->
    section = $(this).parent()
    section_id = section.attr('data-section')

    $.ajax
      url: '/pages/' + page_id + '/sections/' + section_id + '/edit'
      success: (data) -> section.html(data)
    false
