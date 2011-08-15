jQuery ->
  page_id = $('[data-page]').attr('data-page')

  $('#new_section a.edit').click ->
    $(this).html('Loading ...')
    $.ajax
      url: '/pages/' + page_id + '/sections/new',
      success: (data) -> $('#new_section').html(data)
    false

  $('div[data-section] a.edit').click ->
    $(this).html('Loading ...')
    section = $(this).parent()
    section_id = section.attr('data-section')

    $.ajax
      url: '/pages/' + page_id + '/sections/' + section_id + '/edit'
      success: (data) -> section.html(data)
    false
