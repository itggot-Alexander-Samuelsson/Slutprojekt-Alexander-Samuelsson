/**
 * Created by alexander.samuelsso2 on 2016-05-09.
 */
$( document ).ready(function() {
    $("#create_issue_message").hide();
    $("input[name='category']").click(function () {
        $("#create_issue_message").show();
    })
});