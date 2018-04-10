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
	    var areaName=me.prev().val();
        var areaLevel = $(this).parent("div").find("#level").val();
        var areaParent = 0;

        if(areaLevel==1)
		{
            areaParent = 0;

        }
        else if(areaLevel==2)
		{
            areaParent = firstIndex;
		}
        else if(areaLevel==3)
        {
            areaParent = secondIndex;
        }
        else
		{
            areaParent = thirdIndex;
        }

        // if(areaParent==0)
        // {
        //     layer.alert("缺少上级区域！",{icon:5});
        //     return false;
        // }

        //修改区域的名字
        $.ajax({
            url:"/admin/area/addArea",
            type:"post",
            data:
                {
                    areaLevel:areaLevel,
                    areaName:areaName,
                    areaParent:areaParent,
                },
            dataType:"json",
            success:function(data){
                //window.clearInterval(timer);

				var code = data.code;
                var msg = data.msg;

                var resultData = data.data;
                if(code==200){
						var insertHtml='<div class="main_re1">' +
							'<input class="region_5_input" name="areaName" disabled="disabled" value="'+areaName+'">' +
							'<span class="update">修改</span>' +
							'<span class="delete">删除</span>' +
                            '<input type="hidden" id="areaId" value="'+resultData.areaId+'">'+
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

				var areaName = $(this).parent("div").find("#areaName").val();
                var areaId = $(this).parent("div").find("#areaId").val();
                //修改区域的名字
                $.ajax({
                    url:"/admin/area/updateArea",
                    type:"post",
                    data:
					{
						areaId:areaId,
						areaName:areaName,
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
        var areaId = me.parent("div").find("#areaId").val();
        $.ajax({
            url:"/admin/area/delArea",
            type:"post",
            data:
                {
                    areaId:areaId,
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
    	var level = me.parent("div").parent("div").find("#level").val();
    	var areaId  = me.find("#areaId").val();
    	if(level==1)
		{
			firstIndex = areaId;
		}
		else if(level==2)
		{
            secondIndex = areaId;

        }else if(level==3)
		{
            thirdIndex = areaId;
        }
        else
		{
			fourthIndex = areaId;
		}

		var index = layer.msg("加载中...",{time:10000});

        $.ajax({
            url:"/admin/area/getChildAreaAll",
            type:"post",
            data:
                {
                    areaId:areaId,
                    level:level,
                },
            dataType:"json",
            success:function(data){

                layer.close(index);
                var code = data.code;
                var msg = data.msg;
                var resultData = data.data;
                if(data.code==200){
                    var checked = "";

                    if(level==1)
                    {

                        $(".areaListSecond").html("");
                        $(".areaListThird").html("");
                        $(".areaListFourth").html("");

                       var secondAreas =  resultData.secondAreas;
                       secondIndex =  resultData.secondIndex;

                        var thirdAreas =  resultData.thirdAreas;
                        thirdIndex =  resultData.thirdIndex;

                        var fourthAreas =  resultData.fourthAreas;
                        fourthIndex =  resultData.fourthIndex;

                        if(secondAreas.length>0)
                       {
                           var secondHtml = "";

                           for(var i=0;i<secondAreas.length;i++)
                           {
                                   if(secondAreas[i].areaId==secondIndex)
                                   {
                                       checked = "checked_menu";
                                   }
                                   else
                                   {
                                       checked = "";
                                   }
                                   secondHtml += '<div class="main_re1 '+checked+'">' +
                                   '<input class="region_5_input" id="areaName" disabled="disabled" value="'+secondAreas[i].areaName+'">' +
                                   '<span class="update">修改</span>' +
                                   '<span class="delete">删除</span>' +
                                   '<input type="hidden" id="areaId" value="'+secondAreas[i].areaId+'">'+
                                   '</div>';
                           }
                           $(".areaListSecond").html(secondHtml);
                       }

                        if(thirdAreas.length>0)
                        {

                            var thirdHtml = "";
                            for(var i=0;i<thirdAreas.length;i++)
                            {

                                if(thirdAreas[i].areaId==thirdIndex)
                                {
                                    checked = "checked_menu";
                                }
                                else
                                {
                                    checked = "";
                                }

                                thirdHtml += '<div class="main_re1 '+checked+'">' +
                                    '<input class="region_5_input" id="areaName" disabled="disabled" value="'+thirdAreas[i].areaName+'">' +
                                    '<span class="update">修改</span>' +
                                    '<span class="delete">删除</span>' +
                                    '<input type="hidden" id="areaId" value="'+thirdAreas[i].areaId+'">'+
                                    '</div>';
                            }
                            $(".areaListThird").html(thirdHtml);
                        }

                        if(fourthAreas.length>0)
                        {
                            var fourthHtml = "";
                            for(var i=0;i<fourthAreas.length;i++)
                            {
                                if(fourthAreas[i].areaId==fourthIndex)
                                {
                                    checked = "checked_menu";
                                }
                                else
                                {
                                    checked = "";
                                }

                                fourthHtml += '<div class="main_re1 '+checked+'">' +
                                    '<input class="region_5_input" id="areaName" disabled="disabled" value="'+fourthAreas[i].areaName+'">' +
                                    '<span class="update">修改</span>' +
                                    '<span class="delete">删除</span>' +
                                    '<input type="hidden" id="areaId" value="'+fourthAreas[i].areaId+'">'+
                                    '</div>';
                            }
                            $(".areaListFourth").html(fourthHtml);
                        }


                    }
                    else if(level==2)
                    {
                        $(".areaListThird").html("");
                        $(".areaListFourth").html("");

                        var thirdAreas =  resultData.thirdAreas;
                        thirdIndex =  resultData.thirdIndex;

                        var fourthAreas =  resultData.fourthAreas;
                        fourthIndex =  resultData.fourthIndex;

                        if(thirdAreas.length>0)
                        {
                            var thirdHtml = "";
                            for(var i=0;i<thirdAreas.length;i++)
                            {
                                if(thirdAreas[i].areaId==thirdIndex)
                                {
                                    checked = "checked_menu";
                                }
                                else
                                {
                                    checked = "";
                                }

                                thirdHtml += '<div class="main_re1" '+checked+'>' +
                                    '<input class="region_5_input" id="areaName" disabled="disabled" value="'+thirdAreas[i].areaName+'">' +
                                    '<span class="update">修改</span>' +
                                    '<span class="delete">删除</span>' +
                                    '<input type="hidden" id="areaId" value="'+thirdAreas[i].areaId+'">'+
                                    '</div>';
                            }
                            $(".areaListThird").html(thirdHtml);
                        }


                        if(fourthAreas.length>0)
                        {
                            var fourthHtml = "";
                            for(var i=0;i<fourthAreas.length;i++)
                            {
                                if(fourthAreas[i].areaId==fourthIndex)
                                {
                                    checked = "checked_menu";
                                }
                                else
                                {
                                    checked = "";
                                }

                                fourthHtml += '<div class="main_re1 '+checked+'">' +
                                    '<input class="region_5_input" id="areaName" disabled="disabled" value="'+fourthAreas[i].areaName+'">' +
                                    '<span class="update">修改</span>' +
                                    '<span class="delete">删除</span>' +
                                    '<input type="hidden" id="areaId" value="'+fourthAreas[i].areaId+'">'+
                                    '</div>';
                            }
                            $(".areaListFourth").html(fourthHtml);
                        }

                    }else if(level==3)
                    {
                        $(".areaListFourth").html("");

                        var fourthAreas =  resultData.fourthAreas;
                        fourthIndex =  resultData.fourthIndex;
                        if(fourthAreas.length>0)
                        {
                            var fourthHtml = "";
                            for(var i=0;i<fourthAreas.length;i++)
                            {
                                if(fourthAreas[i].areaId==fourthIndex)
                                {
                                    checked = "checked_menu";
                                }
                                else
                                {
                                    checked = "";
                                }

                                fourthHtml += '<div class="main_re1 '+checked+'">' +
                                    '<input class="region_5_input" id="areaName" disabled="disabled" value="'+fourthAreas[i].areaName+'">' +
                                    '<span class="update">修改</span>' +
                                    '<span class="delete">删除</span>' +
                                    '<input type="hidden" id="areaId" value="'+fourthAreas[i].areaId+'">'+
                                    '</div>';
                            }
                            $(".areaListFourth").html(fourthHtml);
                        }
                    }

                }else {
                    layer.alert(data.msg,{icon:5});
                }
            }
        });


        $(this).addClass('checked_menu').siblings().removeClass('checked_menu');
	});

});