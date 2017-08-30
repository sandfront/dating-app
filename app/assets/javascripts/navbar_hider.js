(function($){
  $(function(){
    var scroll = $(document).scrollTop();
    var headerHeight = $('.navbar-meteor').outerHeight();

    $(window).scroll(function() {
      var scrolled = $(document).scrollTop();
      if (scrolled > headerHeight){
        $('.navbar-meteor').addClass('off-canvas');
      } else {
        $('.navbar-meteor').removeClass('off-canvas');
      }

        if (scrolled > scroll){
         $('.navbar-meteor').removeClass('fixed');
        } else {
        $('.navbar-meteor').addClass('fixed');
        }
      scroll = $(document).scrollTop();
     });

   });
})(jQuery);
