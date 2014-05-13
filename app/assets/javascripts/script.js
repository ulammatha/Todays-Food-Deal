$(document).ready(function () {
    $('.dropdown-menu').find('form').click(function (e) {
        e.stopPropagation();
    });

    //carousel
    $('.carousel').carousel();

    //hover image effect
    $('.fancybox img').hover(function () {
        $(this).stop().animate({ opacity: 0.8 }, 200);
    }, function () {
        $(this).stop().animate({ opacity: 1 }, 200);
    });

    //fancybox
    $("a.fancybox").fancybox({
        openEffect: 'elastic',
        closeEffect: 'elastic',
        helpers: {
            media: {}
        }
    });

    //backstretch
    $.backstretch("assets/app/img/bg.jpg");
});