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



    //修改相应
    $("body").on('click',".update",function () {

    	   var me = $(this);
		   if(me.text()=='修改')
		   {
               var level = me.parent("div").parent("div").find("#level").val();
               var permissionId  = me.parent("div").find("#permissionId").val();

               layer.open({
                   type: 2,
                   shadeClose: true, //开启遮罩关闭
                   area: ['650px', '550px'],
                   scrollbar: false,
                   content:"/admin/baseConfig/authority/permission/update/page?permissionId="+permissionId,
                   title:'更新权限'
               });
           }


    });



    $("body").on('click',".delete",function () {



            var me = $(this);
            var permissionId = me.parent("div").find("#permissionId").val();
            console.log(permissionId);
            $.ajax({
                url:"/admin/baseConfig/authority/permission/del",
                type:"post",
                data:
                    {
                        permissionId:permissionId
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


    //选中一级权限，自动更新其子权限
    $("body").on('click',".main_re1",function () {
        var me = $(this);
        var level = me.parent("div").parent("div").find("#level").val();
        var permissionId = me.find("#permissionId").val();
        if (level == 1) {
            firstIndex = permissionId;
        }
        else if (level == 2) {
            secondIndex = permissionId;

        }else {
            thirdIndex = permissionId;
            return false;
        }

        $.ajax({
            url: "/admin/baseConfig/authority/getChildPermission",
            type: "post",
            data:
                {
                    permissionId: permissionId,
                    level: level
                },
            dataType: "json",
            success: function (data) {
                var code = data.code;
                var msg = data.msg;
                var resultData = data.data;
                if (data.code == 200) {
                    var checked = "";

                    if (level == 1) {

                        //将子级权限清空
                        $(".permissionListSecond").html("");
                        $(".permissionListThird").html("");

                        var secondPermissions = resultData.secondPermissions;
                        secondIndex = resultData.secondIndex;

                        var thirdPermissions = resultData.thirdPermissions;
                        thirdIndex = resultData.thirdIndex;

                        //渲染二级权限
                        if (secondPermissions.length > 0) {
                            var secondHtml = "";

                            for (var i = 0; i < secondPermissions.length; i++) {
                                if (secondPermissions[i].permissionId == secondIndex) {
                                    checked = "checked_menu";
                                }
                                else {
                                    checked = "";
                                }
                                secondHtml += '<div class="main_re1 ' + checked + '">' +
                                    '<input class="region_5_input" id="permissionName" disabled="disabled" value="' + secondPermissions[i].permissionName + '">' +
                                    '<span class="update">修改</span>' +
                                    '<span class="delete">删除</span>' +
                                    '<input type="hidden" id="permissionId" value="' + secondPermissions[i].permissionId + '">' +
                                    '</div>';
                            }
                            $(".permissionListSecond").html(secondHtml);
                        }

                        //渲染三级权限
                        if (thirdPermissions.length > 0) {

                            var thirdHtml = "";
                            for (var i = 0; i < thirdPermissions.length; i++) {

                                if (thirdPermissions[i].permissionId == thirdIndex) {
                                    checked = "checked_menu";
                                }
                                else {
                                    checked = "";
                                }

                                thirdHtml += '<div class="main_re1 ' + checked + '">' +
                                    '<input class="region_5_input" id="permissionName" disabled="disabled" value="' + thirdPermissions[i].permissionName + '">' +
                                    '<span class="update">修改</span>' +
                                    '<span class="delete">删除</span>' +
                                    '<input type="hidden" id="permissionId" value="' + thirdPermissions[i].permissionId + '">' +
                                    '</div>';
                            }
                            $(".permissionListThird").html(thirdHtml);
                        }

                    }
                    else if (level == 2) {
                        $(".permissionListThird").html("");

                        var thirdPermissions = resultData.thirdPermissions;
                        thirdIndex = resultData.thirdIndex;

                        var thirdHtml = "";
                        if (thirdPermissions.length > 0) {
                            for (var i = 0; i < thirdPermissions.length; i++) {

                                if (thirdPermissions[i].permissionId == thirdIndex) {
                                    checked = "checked_menu";
                                }
                                else {
                                    checked = "";
                                }

                                thirdHtml += '<div class="main_re1 ' + checked + '">' +
                                    '<input class="region_5_input" id="permissionName" disabled="disabled" value="' + thirdPermissions[i].permissionName + '">' +
                                    '<span class="update">修改</span>' +
                                    '<span class="delete">删除</span>' +
                                    '<input type="hidden" id="permissionId" value="' + thirdPermissions[i].permissionId + '">' +
                                    '</div>';
                            }

                        }
                        $(".permissionListThird").html(thirdHtml);

                    }
                    else {

                    }
                }
            }
        });

        $(this).addClass('checked_menu').siblings().removeClass('checked_menu');
    });


    //点击添加之后的效果
    $('.add').click(function(){
        $(this).parent().css('border','1px solid #1abc9c');

        var permissionLevel = $(this).parent("div").find("#level").val();
        var permissionParent = -1;

        if(permissionLevel==1)
        {
            permissionParent = 0;

        }
        else if(permissionLevel==2)
        {
            permissionParent = firstIndex;
        }
        else
        {
            permissionParent = secondIndex;
        }

        console.log(permissionParent);

        layer.open({
            type: 2,
            shadeClose: true, //开启遮罩关闭
            area: ['650px', '550px'],
            scrollbar: false,
            content:"/admin/baseConfig/authority/permission/add/page?permissionParent="+permissionParent,
            title:'添加权限'
        });
    });

    });








