$(function() {
    $("a").on( "click" , function() {
        var href = $(this).attr("href");
        $.get(href, function(data) {
            $("#maincontainer").html(data);
        });
        event.preventDefault();
    });
});
