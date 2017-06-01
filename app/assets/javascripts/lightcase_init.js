var ready = function() {
    $('a[data-rel="lightcase:myCollection:slideshow"]').lightcase({showSequenceInfo: false, transition: 'scrollHorizontal'});
    $('a[data-rel="lightcase"]').lightcase();
};


$(document).on('turbolinks:load', ready);