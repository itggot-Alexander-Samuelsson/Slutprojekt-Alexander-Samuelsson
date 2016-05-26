/**
 * Created by alexander.samuelsso2 on 2016-05-09.
 */
$( document ).ready(function() {
    $("#create_issue_message").hide();
    $("input[name='category']").click(function () {
        $("#create_issue_message").show();
    })

    $("#issue_created").delay(3000).fadeOut("slow");
    $("#issue_updated").delay(3000).fadeOut("slow");
    $("#issue_removed").delay(3000).fadeOut("slow");

    $("#login_header").hide();
    $("#login_footer").hide();
    $("#login_header").delay(1000).fadeIn("slow");
    $("#login_footer").delay(3000).fadeIn("slow");
});