$(function () {
  var modal = $('.ui.modal');
  $('.tweets').find('.item').on('click', function () {
    modal.find('.left').html($(this).find('.name').html());
    modal.find('.right').html($(this).find('.description').html());
    modal.find('.created_at').html($(this).find('.actual_date').html());
    modal.find('.retweet_count span').html($(this).find('.retweet_count').html());
    modal.find('.favorite_count span').html($(this).find('.favorite_count').html());
    modal.modal('show');
  });
});