

$(function() { 
  $('.sidebar-nav').affix({
    offset: { top: 80 }
  })

  $('.sidebar-nav a').on('click', function() {
    scroll_to_name($(this).attr('href'))
  })

  if (window.location.hash) {
    scroll_to_name(window.location.hash)
  } else {
    $('.navbar-fixed-top li:first a').tab('show');
  }

})


function scroll_to_name(name)
{
    var name = name.replace(/^#/,'');
    var $target = $('div[name="'+name+'"]');
    var $link = $('a[href="#'+name+'"]');
    var $parent = $link.parent();
    $parent.siblings().removeClass('active')
    $parent.addClass('active')

    var $pane = $target.parents('.tab-pane')
    $('.navbar-fixed-top a[href="#'+$pane[0].id+'"]').tab('show');

    $('html, body').animate({
      scrollTop: $target.offset().top-50
    }, 500)

}
