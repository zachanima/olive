jQuery ->
  $('div[data-page] a.edit').click ->
    $.ajax
      url: '/pages/' + page.attr('data-page') + '/edit'
      success: (data) -> page.html(data)
    false
