function editName() {
    $("#changeNameIcon").removeClass();
    $("#changeNameIcon").addClass("icon-ok");
    $("#userName").removeAttr("disabled");


    $("#changeName").unbind("click").click(saveName);
}

function saveName() {
    $("#changeNameIcon").removeClass();
    $("#changeNameIcon").addClass("icon-time");

    $("#userName,#changeName").prop({disabled: true})

    $.getJSON("/users/setName", { name : $("#userName").val() }, function(json) {
        if(json.status == "Ok") {
            $("#notification_message").text("Name changed successfully");
            $("#notification").show();
            $("#notification").fadeOut(1200);
        }
        else {
            $("#notification_message").text("This name isn't available");
            $("#notification").show();
            $("#notification").fadeOut(1200);
            $("#userName").val(json.userName);
        }

        $("#changeNameIcon").removeClass();
        $("#changeNameIcon").addClass("icon-cog");

        $("#changeName").unbind("click").click(editName);
        $("#changeName").removeAttr("disabled");
    });
}

$(document).ready(function() {
    $("#changeName").click(editName);
});

function uLoginAuth(utoken) {
    $.getJSON("/users/ulogin", { token: utoken }, function(json) {
        if(json.status == "Ok") {
            $("#userName").val(json.userName);
            $("#warning").fadeOut(400, function() {
                $("#editor").toggleClass("comment-hidden");
            });
        }
    });
}