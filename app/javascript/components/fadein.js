const fadein = () => {
  // $(function(){  // $(document).ready shorthand
  //   $('.first_elements').animate({'opacity':'1'},1500);
  // });

  const renderCard = () => {
    $('.hideme').each( function(item){
        var top_of_object = $(this)[0].getBoundingClientRect().top;

        /* If the object is visible for 50px in the window, fade it it */
        if( $(window).height() - 50 > top_of_object ){
          $(this).animate({'opacity':'1'},1500);
        }

    });
  }

  $(document).ready(function() {
    renderCard();
      /* Every time the window is scrolled ... */
      $(window).scroll(renderCard);
  });
};

export { fadein };

