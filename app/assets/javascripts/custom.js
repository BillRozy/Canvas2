$(document).on('turbolinks:load', function() {

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


    //replacing
    TabsReplace({tabs_name: '.tab_item',
        container_name: '.tabs_container',
        active_tab: 'active_tab',
        active_button: 'active_tab_button',
        button_name: '.tabs_button'});

    //fading
    TabsReplace({tabs_name: '.tab_item_fade',
        container_name: '.tabs_container_fade',
        active_tab: 'active_tab_fade',
        active_button: 'active_tab_button_fade',
        button_name: '.tabs_button_fade'});
});


window.onscroll = function() {detectScrolled()};

function detectScrolled() {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        document.getElementById("goToTopBtn").style.display = "block";
    } else {
        document.getElementById("goToTopBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function goToTop() {
    document.body.scrollTop = 0; // For Chrome, Safari and Opera
    document.documentElement.scrollTop = 0; // For IE and Firefox
}

function showMenu(buttonID, menuID) {
    var menu = $('#'+ menuID);
    var btn = $('#'+ buttonID);
    var isClicked = btn.attr('clicked');
    if(isClicked == "false")
    {
        menu.css({transition:'0.5s',left:"0",opacity: "1"});
        btn.attr("clicked", "true");
    }
    else
    {
        menu.css({transition:'0.5s',left:"420px",opacity: "0"});
        btn.attr("clicked", "false");
    }
}

function clearTextField(id) {
    $("#"+id).attr("value", "");
}

function moveBlock(btnId,btn2Id,idOfBlock,infoArray)
{

    var block = $('#' + idOfBlock);
    var btn = $('#'+btnId);
    var btn2 = $('#'+btn2Id);
    if (btn.attr('clicked') == 'false' && btn2.attr('clicked') == 'false')
    {
        block.show('fast');
        btn.attr("clicked", "true");
        btn.css({background:'rgb(216,216,216)'});
        refreshBlock(idOfBlock,infoArray);
    }
    else if(btn.attr('clicked') == 'false' && btn2.attr('clicked') == 'true')
    {
        btn.attr("clicked", "true");
        btn2.attr("clicked", "false");
        refreshBlock(idOfBlock,infoArray);
        btn.css({background:'rgb(216,216,216)'});
        btn2.css({background:'rgb(255,255,255)'});
    }
    else if(btn.attr('clicked') == 'true' && btn2.attr('clicked') == 'false')
    {
        block.hide('fast');
        btn.attr("clicked", "false");
        btn.css({background:'#BBFFBB'});
    }
}

function refreshBlock(idOfBlock, infoArray)
{
    var block = $('#' + idOfBlock);
    block.empty();
    for(var i = 0; i < infoArray.length;i++)
    {
        if(infoArray[i]) {
            var row = $("<div class='one-information-row'></div>");
            row.text(infoArray[i]);
            block.append(row);
        }
    }
}

function hideScrollBar(){
    $('body').css({
        'overflow-y': 'hidden',
    })
}

function showScrollBar(){
    $('body').css({
        'overflow-y': 'auto',
    })
}
