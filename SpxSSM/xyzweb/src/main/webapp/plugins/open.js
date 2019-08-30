function open  (pa,i) {

    var asd= $(".sunaSD");
    var arrayObj = new Array()

    asd.each(function () {
        if ($(this).is(':checked')) {

            arrayObj.push( $(this).attr("value"))

            console.log($(this).attr("value"))
        }
    })

    console.log(arrayObj)
    $.ajax({
        url:pa+'/open/'+i+'open.do',
        headers: {
            'Accept': 'application/jsona',
            'Content-Type': 'application/json'
        },
        data:JSON.stringify({"id":arrayObj}),
        async: false,
        dataType:"json",
        type:"post",
        success:function(){
            window.location.reload()
        },   error: function (jqXHR) {
            /*弹出jqXHR对象的信息*/


            if(jqXHR.status==200){
                window.location.reload()
            }else {
                alert(jqXHR.status+"权限不足");
            }

        }
    })
}