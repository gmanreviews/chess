/*
$("#category_auto_fill").autocomplete({
    source: function(request, response){
        $.ajax({
            url: "/postcategory/json_result",
            dataType: "jsonP",
            success: function (data){
                response (data.response)
            }
        })
    }
})
*/

var data = ["test", "more test", "no test"];
$("#category_auto_fill").autocomplete({
    source: data
});