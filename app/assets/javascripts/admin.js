function buildTag(e) {
    $(e).toggleClass('variant-selected');

    var res = "";

    $("#categories > .variant-selected").each(function() {
        res += $(this).attr('data-cat') + ',';
    });

    $("#post_category_ids").val(res);
}

$(document).ready(function() {
    var sl = $("#post_category_ids").val().slice(1,-1);
    var ar = sl.slice(',');

    $(".variant").each(function() {
        if($.inArray($(this).attr('data-cat'), ar) > -1) {
            buildTag(this);
        }

        $(this).click(function() {
            buildTag(this);
        });
    });
});