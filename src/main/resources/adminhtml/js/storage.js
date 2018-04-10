$(function(){


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



    //修改货架
    $("body").on('click',".updatesecond",function () {

    	   var me = $(this);
               var secondStorageRackId  = me.parent("div").find("#secondStorageRackId").val();

               layer.open({
                   type: 2,
                   shadeClose: true, //开启遮罩关闭
                   area: ['650px', '550px'],
                   scrollbar: false,
                   content:"/admin/housemanage/storagemanage/alertupdatesecond?storageRackId="+secondStorageRackId,
                   title:'更新货架'
               });
    });

    //修改货位
    $("body").on('click',".updatethird",function () {

        var me = $(this);
        var thirdStorageRackId  = me.parent("div").find("#thirdStorageRackId").val();

        layer.open({
            type: 2,
            shadeClose: true, //开启遮罩关闭
            area: ['650px', '550px'],
            scrollbar: false,
            content:"/admin/housemanage/storagemanage/alertupdatethird?storageRackId="+thirdStorageRackId,
            title:'更新货架'
        });
    });


    $("body").on('click',".deletesecond",function () {
        var me = $(this);
        layer.confirm('当前货架可能含有货位，还要删除该货架么？', {
            btn: ['确认','取消']
        }, function(index){
            var secondStorageRackId = me.parent("div").find("#secondStorageRackId").val();
            console.log("secondStorageRackId:"+secondStorageRackId);
            $.ajax({
                url:"/admin/housemanage/storagemanage/deletesecond",
                type:"post",
                data:
                    {
                        secondStorageRackId:secondStorageRackId
                    },
                dataType:"json",
                success:function(data){
                    //window.clearInterval(timer);
                    if(data.code=="1"){
                        layer.alert("删除成功",{icon:6,shade:false} ,function (index) {
                            me.parent().remove();
                            layer.close(index);
                        });
                        return false;
                    }else {
                        layer.alert(data.msg,{icon:5,shade:false});
                        return false;
                    }
                }
            });
        }, function(){

        });
    });

    $("body").on('click',".deletethird",function () {
            var me = $(this);
            var thirdStorageRackId = me.parent("div").find("#thirdStorageRackId").val();
            var fatStorageRackId = me.parent("div").find("#fatStorageRackId").val();
            console.log("thirdStorageRackId:"+thirdStorageRackId);
            console.log("fatStorageRackId:"+fatStorageRackId);
            $.ajax({
                url:"/admin/housemanage/storagemanage/deletethird",
                type:"post",
                data:
                    {
                        thirdStorageRackId:thirdStorageRackId,
                        fatStorageRackId:fatStorageRackId
                    },
                dataType:"json",
                success:function(data){
                    //window.clearInterval(timer);
                    if(data.code=="1"){
                        layer.alert("删除成功",{icon:6,shade:false} ,function (index) {
                            me.parent().remove();
                            layer.close(index);
                        });
                        return false;
                    }else {
                        layer.alert(data.msg,{icon:5,shade:false});
                        return false;
                    }
                }
            });
	});


    //选中仓库，自动更新其货架和货位
    $("body").on('click',".main_re11",function () {
        var me = $(this);
        //var level = me.parent("div").parent("div").find("#level").val();
        var houseId = me.find("#houseId").val();
        firstIndex = houseId;
        console.log("firstIndex:"+firstIndex);

        $.ajax({
            url: "/admin/housemanage/storagemanage/getsecondstorage",
            type: "post",
            data:
                {
                    houseId: houseId
                },
            dataType: "json",
            success: function (data) {
                var code = data.code;
                var msg = data.msg;
                var resultData = data.data;
                if (data.code == 200) {
                    var checked = "";

                        //将子级权限清空
                        $(".permissionListSecond").html("");
                        $(".permissionListThird").html("");

                        var secondStorageRackList = resultData.secondStorageRackList;
                        secondIndex = resultData.secondIndex;
                    console.log("secondIndex:"+secondIndex);
                        var thirdStorageRackList = resultData.thirdStorageRackList;
                        thirdIndex = resultData.thirdIndex;
                    console.log("thirdIndex:"+thirdIndex);

                        //渲染二级权限
                        if (secondStorageRackList.length > 0) {
                            var secondHtml = "";

                            for (var i = 0; i < secondStorageRackList.length; i++) {

                                if (secondStorageRackList[i].storageRackId == secondIndex) {
                                    checked = "checked_menu";
                                }
                                else {
                                    checked = "";
                                }
                                secondHtml += '<div class="main_re1  ' + checked + ' main_re12">' +
                                    '<input class="region_5_input" id="storageRackName" disabled="disabled" value="' + secondStorageRackList[i].storageRackName + '">' +
                                    '<span class="update updatesecond">修改</span>' +
                                    '<span class="delete deletesecond">删除</span>' +
                                    '<input type="hidden" id="secondStorageRackId" value="' + secondStorageRackList[i].storageRackId + '">' +
                                    '</div>';
                            }
                            $(".permissionListSecond").html(secondHtml);
                        }

                        //渲染三级权限
                        if (thirdStorageRackList.length > 0) {

                            var thirdHtml = "";
                            for (var i = 0; i < thirdStorageRackList.length; i++) {

                                if (thirdStorageRackList[i].storageRackId == thirdIndex) {
                                    checked = "checked_menu";
                                }
                                else {
                                    checked = "";
                                }

                                thirdHtml += '<div class="main_re1 main_re13 ' + checked + '">' +
                                    '<input class="region_5_input" id="storageRackName" disabled="disabled" value="' + thirdStorageRackList[i].storageRackNum+"  " + thirdStorageRackList[i].fatVolume + "斤  " + thirdStorageRackList[i].fatMostNum+"桶"+'">' +
                                    '<span class="update updatethird">修改</span>' +
                                    '<span class="delete deletethird">删除</span>' +
                                    '<input type="hidden" id="thirdStorageRackId" value="' + thirdStorageRackList[i].storageRackId + '">' +
                                    '<input type="hidden" id="fatStorageRackId" value="' + thirdStorageRackList[i].fatStorageRackId + '">' +
                                    '</div>';
                            }
                            $(".permissionListThird").html(thirdHtml);
                        }
                }
            }
        });
    });

        //选中货架获得货位
    $("body").on('click',".main_re12",function () {
        var me = $(this);
        //var level = me.parent("div").parent("div").find("#level").val();
        var secondStorageRackId = me.find("#secondStorageRackId").val();
        secondIndex = secondStorageRackId;
        console.log("secondIndex:"+secondIndex);

        $.ajax({
            url: "/admin/housemanage/storagemanage/getthirdstorage",
            type: "post",
            data:
                {
                    secondStorageRackId: secondStorageRackId
                },
            dataType: "json",
            success: function (data) {
                var code = data.code;
                var msg = data.msg;
                var resultData = data.data;
                if (data.code == 200) {
                    var checked = "";

                    //将货位清空
                    //$(".permissionListSecond").html("");
                    $(".permissionListThird").html("");


                    var thirdStorageRackList = resultData.thirdStorageRackList;
                    thirdIndex = resultData.thirdIndex;
                    console.log("thirdStorageRackList:"+thirdStorageRackList);

                    //渲染货位
                    if (thirdStorageRackList.length > 0) {

                        var thirdHtml = "";
                        for (var i = 0; i < thirdStorageRackList.length; i++) {

                            if (thirdStorageRackList[i].storageRackId == thirdIndex) {
                                checked = "checked_menu";
                            }
                            else {
                                checked = "";
                            }

                            thirdHtml += '<div class="main_re1 main_re13 ' + checked + '">' +
                                '<input class="region_5_input" id="storageRackName" disabled="disabled" value="' + thirdStorageRackList[i].storageRackNum+"  " + thirdStorageRackList[i].fatVolume + "斤  " + thirdStorageRackList[i].fatMostNum+"桶"+'">' +
                                '<span class="update updatethird">修改</span>' +
                                '<span class="delete deletethird">删除</span>' +
                                '<input type="hidden" id="thirdStorageRackId" value="' + thirdStorageRackList[i].storageRackId + '">' +
                                '<input type="hidden" id="fatStorageRackId" value="' + thirdStorageRackList[i].fatStorageRackId + '">' +
                                '</div>';
                        }
                        $(".permissionListThird").html(thirdHtml);
                    }
                }
            }
        });
    });


    //点击添加之后的效果（添加货架）
    $('.addSecond').click(function(){
        $(this).parent().css('border','1px solid #1abc9c');

        var houseId = firstIndex;

        console.log("firstIndex:"+firstIndex);

        layer.open({
            type: 2,
            shadeClose: true, //开启遮罩关闭
            area: ['650px', '550px'],
            scrollbar: false,
            content:"/admin/housemanage/storagemanage/addalertsecond?houseId="+houseId,
            title:'添加货架'
        });
    });

    //点击添加之后的效果(添加货位)
    $('.addThird').click(function(){
        $(this).parent().css('border','1px solid #1abc9c');

        var houseId = firstIndex;
        var storageRackId = secondIndex;

        console.log("houseId:"+houseId);
        console.log("storageRackId:"+storageRackId);

        layer.open({
            type: 2,
            shadeClose: true, //开启遮罩关闭
            area: ['650px', '550px'],
            scrollbar: false,
            content:"/admin/housemanage/storagemanage/addalertthird?houseId="+houseId+"&storageRackId="+storageRackId,
            title:'添加货位'
        });
    });

    });








