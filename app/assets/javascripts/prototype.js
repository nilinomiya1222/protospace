$(window).on('load', function() {
  $('li.plus').on('click', function() {
    $('li.hidden_form').removeClass('hidden_form');
    $(this).addClass('hidden_form');
  });
});

