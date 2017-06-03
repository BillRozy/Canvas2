var ready = function () {
    $('a[data-rel="lightcase:myCollection:slideshow"]').lightcase({
        showSequenceInfo: false,
        transition: 'scrollHorizontal',
        onFinish: {
            baz: function () {
                hideScrollBar();
            }
        },
        onClose: {
            caz: function () {
                showScrollBar();
            }
        }
    });
    $('a[data-rel="lightcase"]').lightcase({
        onFinish: {
            baz: function () {
                hideScrollBar();
            }
        },
        onClose: {
            caz: function () {
                showScrollBar();
            }
        }
    });
};


$(document).on('turbolinks:load', ready);