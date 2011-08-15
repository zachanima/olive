jQuery ->
  /* Hide notice */
  $('#notice').fadeIn()
  $('#notice').click -> $(this).fadeOut()

  /* Find current page id. */
  page_id = $('[data-page]').attr('data-page')

  /* Apply loading animation on edit link click. */
  $('a.edit').click -> $(this).html('Loading ...')

  /* New section. */
  $('div#new_section a.edit').click ->
    $.ajax
      url: '/pages/' + page_id + '/sections/new',
      success: (data) -> $('#new_section').html(data)
    false

  /* Edit section. */
  $('div[data-section] a.edit').click ->
    section = $(this).parent()
    section_id = section.attr('data-section')

    $.ajax
      url: '/pages/' + page_id + '/sections/' + section_id + '/edit'
      success: (data) -> section.html(data)
    false
