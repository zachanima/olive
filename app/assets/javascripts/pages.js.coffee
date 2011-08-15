jQuery ->
  /* Find current page id. */
  page = $('[data-page]')
  page_id = page.attr('data-page')


  /* Hide notice */
  $('#notice').fadeIn()
  $('#notice').click -> $(this).fadeOut()

  /* Apply loading animation on edit link click. */
  $('a.edit').click -> $(this).html('Loading ...')


  /* Edit page. */
  $('div[data-page] a.edit').click ->
    $.ajax
      url: '/pages/' + page_id + '/edit'
      success: (data) -> page.html(data)
    false


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
