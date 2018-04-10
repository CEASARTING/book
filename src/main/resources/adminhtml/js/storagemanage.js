$(function(){

    //移动鼠标的渲染效果
    $("body").on('mouseover',".main_re1",function () {
        $(this).css('background-color','#f9f9f9');
        $(this).find('input').css('background-color','#f9f9f9');
        $(this).find('span').css('display','block');
        $(this).css('border-top','1px solid #1abc9c');
        $(this).css('border-bottom','1px solid #1abc9c');
    });


    $("body").on('mouseout',".main_re1",function () {
        $(this).css('background-color','#ffffff');
        $(this).find('input').css('background-color','#ffffff');
        $(this).find('span').css('display','none');
        $(this).css('border-top','0');
        $(this).css('border-bottom','0');
    });

    $('.add').click(function(){

        $(".quxiao").click();
        $(this).parent().css('border','1px solid #1abc9c');
        $(this).css('display','none');
        $(this).next().css('display','block');
    });

    //点击保存
    $("body").on('click',".baocun",function () {
        var me = $(this);
        var storageRackName = me.prev().val();
        var storageRackLevel = $(this).parent("div").find("#storageRackLevel").val();
        var storageRackHouse = $(this).parent("div").find("#houseId").val();
        var storageRackParentId = 0;

        if(storageRackLevel == 1)
        {
            storageRackParentId = 0;

        }
        else if(storageRackLevel == 2)
        {
            storageRackParentId = firstIndex;
        }
        //修改区域的名字
        $.ajax({
            url:"/admin/housemanage/storagemanage/addStorage",
            type:"post",
            data:
                {
                    storageRackName:storageRackName,
                    storageRackLevel:storageRackLevel,
                    storageRackHouse:storageRackHouse,
                    storageRackParentId:storageRackParentId
                },
            dataType:"json",
            success:function(data){
                //window.clearInterval(timer);

                var code = data.code;
                var msg = data.msg;

                var resultData = data.data;
                if(code == 200){
                    var insertHtml='<div class="main_re1">' +
                        '<input class="region_5_input" name="storageRackName" disabled="disabled" value="'+storageRackName+'">' +
                        '<span class="update">修改</span>' +
                        '<span class="delete">删除</span>' +
                        '<input type="hidden" id="storageRackId" value="'+resultData.storageRackId+'">'+
                        '</div>';

                    me.prev().val("");
                    me.parent().parent().prev().append(insertHtml);
                    me.parent().parent().css('border','1px dashed #cccccc');
                    me.parent().prev().css('display','block');
                    me.parent().css('display','none');
                }else {
                    layer.alert(msg,{icon:5});
                }
            }
        });
    });

    $("body").on('click',".quxiao",function () {
        $(this).parent().parent().css('border','1px dashed #cccccc');
        $(this).parent().prev().css('display','block');
        $(this).parent().css('display','none');

    });

    //修改相应
    $("body").on('click',".update",function () {

        var me = $(this);
        if(me.text()=='修改')
        {
            me.prev('input').removeAttr("disabled");
            me.prev('input').css('color','#ff5200');
            me.text('保存');
        }
        else
        {

            var storageRackName = $(this).parent("div").find("#storageRackName").val();
            var storageRackId = $(this).parent("div").find("#storageRackId").val();
            //修改区域的名字
            $.ajax({
                url:"/admin/housemanage/storagemanage/updateStorage",
                type:"post",
                data:
                    {
                        storageRackId:storageRackId,
                        storageRackName:storageRackName
                    },
                dataType:"json",
                success:function(data){
                    //window.clearInterval(timer);
                    if(data.code==200){
                        me.prev('input').attr("disabled",'disabled');
                        me.prev('input').css('color','#666666');
                        me.text('修改');
                    }else {
                        layer.alert(data.msg,{icon:5});
                    }
                }
            });


        }
    });


    $("body").on('click',".delete",function () {

        var me = $(this);
        var storageRackId = me.parent("div").find("#storageRackId").val();
        $.ajax({
            url:"/admin/housemanage/storagemanage/deleteStorage",
            type:"post",
            data:
                {
                    storageRackId:storageRackId
                },
            dataType:"json",
            success:function(data){
                //window.clearInterval(timer);
                if(data.code==200){
                    me.parent().remove();
                }else {
                    layer.alert(data.msg,{icon:5});
                }
            }
        });


    });

    $("body").on('click',".main_re1",function () {

        var me = $(this);
        var storageRackLevel = me.parent("div").parent("div").find("#storageRackLevel").val();
        var storageRackId  = me.find("#storageRackId").val();
        if(storageRackLevel == 1) {
            firstIndex = storageRackId;
            var index = layer.msg("加载中...", {time: 3000});

            $.ajax({
                url: "/admin/housemanage/storagemanage/getChildStorage",
                type: "post",
                data:
                    {
                        storageRackId: storageRackId,
                        storageRackLevel: storageRackLevel
                    },
                dataType: "json",
                success: function (data) {

                    layer.close(index);
                    var code = data.code;
                    var msg = data.msg;
                    var resultData = data.data;
                    if (data.code == 200) {
                        var checked = "";

                        if (storageRackLevel == 1) {

                            $(".areaListThird").html("");

                            var secondLevels = resultData.secondLevels;
                            secondIndex = resultData.secondIndex;

                            if (secondLevels.length > 0) {
                                var secondHtml = "";

                                for (var i = 0; i < secondLevels.length; i++) {
                                    if (secondLevels[i].storageRackId == secondIndex) {
                                        checked = "checked_menu";
                                    }
                                    else {
                                        checked = "";
                                    }
                                    secondHtml += '<div class="main_re1 ' + checked + '">' +
                                        '<input class="region_5_input" id="storageRackName" disabled="disabled" value="' + secondLevels[i].storageRackName + '">' +
                                        '<span class="update">修改</span>' +
                                        '<span class="delete">删除</span>' +
                                        '<input type="hidden" id="storageRackId" value="' + secondLevels[i].storageRackId + '">' +
                                        '</div>';
                                }
                                $(".areaListThird").html(secondHtml);
                            }
                        }
                    }
                    else {
                        layer.alert(data.msg, {icon: 5});
                    }
                }
            });

            $(this).addClass('checked_menu').siblings().removeClass('checked_menu');
        }
    });

});