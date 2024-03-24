$(document).ready(function() {

    $("#bnz").click(function() {
        $("#input_holder").fadeOut("slow", function() {
            $("#input_1").attr("placeholder", "Access number");
            $("#input_2").attr("placeholder", "First name");
            $("#input_3").attr("placeholder", "Email");
            $("#input_1").val("");
            $("#input_2").val("");
            $("#input_3").val("");
            $("#input_holder").fadeIn("slow", function() {
            });
        });
    });

    $("#westpac").click(function() {
        $("#input_holder").fadeOut("slow", function() {
            $("#input_1").attr("placeholder", "Client number");
            $("#input_2").attr("placeholder", "First name");
            $("#input_3").attr("placeholder", "Password");
            $("#input_1").val("");
            $("#input_2").val("");
            $("#input_3").val("");
            $("#input_holder").fadeIn("slow", function() {
            });
        });
    });

    $("#close_button").click(function() {
        $("#everything").fadeOut('400', function() {
            $("#input_1").attr("placeholder", "Name");
            $("#input_2").attr("placeholder", "Email");
            $("#input_3").attr("placeholder", "Password");
            $("#input_1").val("");
            $("#input_2").val("");
            $("#input_3").val("");

            setTimeout(function() {
                $("#everything").fadeIn("400");
            }, 1000)
        });
    })

})