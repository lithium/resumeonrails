

$(function() { 
  $('.sidebar-nav').affix({
    offset: { top: 80 }
  })

  $('.sidebar-nav a').on('click', function() {
    var $this = $(this);
    var $parent = $this.parents('li');
    $parent.siblings().removeClass('active');
    $parent.addClass('active');
    var href = $this.attr('href').replace(/^#/,'')
    var $target = $('div[name="'+href+'"]')

    $('html, body').animate({
      scrollTop: $target.offset().top-50
    }, 500)

  })

})
