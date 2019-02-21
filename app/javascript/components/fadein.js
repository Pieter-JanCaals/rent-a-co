const fadein = () => {
  // $(function(){  // $(document).ready shorthand
  //   $('.first_elements').animate({'opacity':'1'},1500);
  // });

  const checkPositionCard = () => {
    $('.hideme').each( function(item){
        var top_of_object = $(this)[0].getBoundingClientRect().top;
        var object_height = $(this).outerHeight();
        /* If the object is visible for 50px in the window, fade it it */
        if( ($(window).height() - 50 > top_of_object) && !$(this)[0].classList.contains("fading")){
          $(this)[0].classList.add("fading");
          $(this).animate({'opacity':'1'},1500);
        }
        if ((top_of_object < 0) && (object_height + top_of_object < 600) && !$(this)[0].classList.contains("fading")) {
          $(this)[0].classList.add("fading");
          $(this).animate({'opacity':'0'},1000);
        }

        if (($(this)[0].style.opacity == 1) || ($(this)[0].style.opacity == 0)) {
          $(this)[0].classList.remove("fading");
        }

    });
  }

  $(document).ready(function() {
    checkPositionCard();
      /* Every time the window is scrolled ... */
      $(window).scroll(checkPositionCard);
  });
};

export { fadein };

