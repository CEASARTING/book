<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本店管理</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script src="/mobiscroll/js/mobiscroll.core-2.5.2.js" type="text/javascript"></script>
<script src="/mobiscroll/js/mobiscroll.core-2.5.2-zh.js" type="text/javascript"></script>
<link href="/mobiscroll/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
<link href="/mobiscroll/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
<script src="/mobiscroll/js/mobiscroll.datetime-2.5.1.js" type="text/javascript"></script>
<script src="/mobiscroll/js/mobiscroll.datetime-2.5.1-zh.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
<!-- S 可根据自己喜好引入样式风格文件 -->
<script src="/mobiscroll/js/mobiscroll.android-ics-2.5.2.js" type="text/javascript"></script>
<link href="/mobiscroll/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
  <script type="text/javascript">
//		$(function () {
//		        var currYear = (new Date()).getFullYear();
//		        var opt={};
//		        opt.datetime = {preset : 'datetime'};
//		        opt.default = {
//		            theme: 'android-ics light', //皮肤样式
//		            display: 'modal', //显示方式 ：modal（正中央）  bottom（底部）
//		            mode: 'scroller', //日期选择模式
//		            lang:'zh',
//		            startYear:currYear-5, //开始年份
//		            endYear:currYear + 5, //结束年份
//		            minDate: new Date()
//		        };
//
//		        $("#appDate").val('').scroller('destroy').scroller($.extend(opt['date'], opt['default']));
//		        var optDateTime = $.extend(opt['datetime'], opt['default']);
//		        $("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
//
//		    });



		 	$(function() {
				
				
				
				var currYear = (new Date()).getFullYear();
				var opt = {};
				opt.date = {
					preset: 'date'
				};
				//opt.datetime = { preset : 'datetime', minDate: new Date(2012,3,10,9,22), maxDate: new Date(2014,7,30,15,44), stepMinute: 5  };
				opt.datetime = {
					preset: 'datetime'
				};
				opt.time = {
					preset: 'time'
				};
				opt.default = {
					theme: 'android-ics light', //皮肤样式
					display: 'modal', //显示方式 
					mode: 'scroller', //日期选择模式
					lang: 'zh',
					startYear: currYear - 10, //开始年份
					endYear: currYear + 10 //结束年份
				};
				$("#appDate").val('').scroller('destroy').scroller($.extend(opt['date'], opt['default']));
				var optDateTime = $.extend(opt['datetime'], opt['default']);
				var optTime = $.extend(opt['time'], opt['default']);
				$("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
				$("#appTime").mobiscroll(optTime).time(optTime); 
				//下面注释部分是上面的参数可以替换改变它的样式
				//希望一起研究插件的朋友加我个人QQ也可以，本人也建个群 291464597 欢迎进群交流。哈哈。这个不能算广告。
				// 直接写参数方法
				//$("#scroller").mobiscroll(opt).date(); 
				// Shorthand for: $("#scroller").mobiscroll({ preset: 'date' });
				//具体参数定义如下
				//{
				//preset: 'date', //日期类型--datatime --time,
				//theme: 'ios', //皮肤其他参数【android-ics light】【android-ics】【ios】【jqm】【sense-ui】【sense-ui】【sense-ui】
				//【wp light】【wp】
				//mode: "scroller",//操作方式【scroller】【clickpick】【mixed】
				//display: 'bubble', //显示方【modal】【inline】【bubble】【top】【bottom】
				//dateFormat: 'yyyy-mm-dd', // 日期格式
				//setText: '确定', //确认按钮名称
				//cancelText: '清空',//取消按钮名籍我
				//dateOrder: 'yymmdd', //面板中日期排列格
				//dayText: '日', 
				//monthText: '月',
				//yearText: '年', //面板中年月日文字
				//startYear: (new Date()).getFullYear(), //开始年份
				//endYear: (new Date()).getFullYear() + 9, //结束年份
				//showNow: true,
				//nowText: "明天",  //
				//showOnFocus: false,
				//height: 45,
				//width: 90,
				//rows: 3,
				//minDate: new Date()  从当前年，当前月，当前日开始}
			});   
		</script>
    
</head>

<body class="body_1">
  <div class="header"><img onclick=window.location.href="/store/manage/${storeId!}" src="/images/27.png"><span>补货申请</span><span onclick=window.location.href="/store/getWineApply/record/${storeId!}">申请记录</span></div>
  <div class="user_3" ><span>酒品类型</span><span style="color: #F25C62;" class="awq">${(first.wineFactory)!}${(first.wineName)!}【${(first.wineDegree)!}°${(first.wineType)!}】-${(first.fatValume)!}装</span><span style="width:5%">></span></div>
  <input type="hidden" value="${(first.wineId)!}"  id="replenishApplyWine"/>
  <input type="hidden" value="${(first.autowineFat.fatVolume)!}"  id="fatVolume"/>
  <div class="user_3" style="margin-top:0.02rem"><span>数量</span><input  id="replenishApplyNum" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
																		placeholder="请点击输入"/></div>
  <div class="user_3" style="margin-top:0.02rem"><span>期望到货时间</span><input name="appDate" id="appDate" type="text" placeholder="2018-1-1"/></div>
  <div class="user_21" style="margin-top:0.02rem">
    <span>补货原因</span>
    <textarea placeholder="输入文字" contenteditable="true" id="replenishApplyReason"></textarea>
  </div>
  <button class="user_22" onclick="save()">提交</button>
  <div class="user_70">
    <div class="user_70_1"><span class="wer">取消</span><span class="werd">确认</span></div>
    <div class="user_70_2">
		<#if wines??>
		    <#list wines as cabinetPage>
		        <div>
					<input type="radio" style="display: none" name="replenishApplyWine" value="${(cabinetPage.wineId)!}"/>
					<input type="radio" style="display: none" name="fatVolume" value="${(cabinetPage.autowineFat.fatVolume)!}"/>
				${cabinetPage.wineFactory!}${cabinetPage.wineName!}【${cabinetPage.wineDegree!}°${cabinetPage.wineType!}】-${(cabinetPage.fatValume)!}装
				</div>
		    </#list>
		</#if>
    </div>
  </div>
 <script>
		$(function(){
			var a;
			var replenishApplyWine;
			var fatVolume;
            $('.awq').click(function(){
				
				$('.user_70').slideDown(500);
				})
		   
		   $('.user_70_2').find('div').click(function(){
			   $(this).css('background','#F3F5F6').siblings().css('background','#ffffff');
			    $(this).css('color','#F25C62').siblings().css('color','#535353');
				a=$(this).text();
               $(this).find("input").prop("checked",true);
               	replenishApplyWine = $("input[name='replenishApplyWine']:checked").val();
               fatVolume = $("input[name='fatVolume']:checked").val();
			   })
		 $('.wer').click(function(){
				
				 $('.user_70').hide();
				})
		  $('.werd').click(function(){
				 $('.user_70').hide();
				 $('.awq').text(a);
				 $("#replenishApplyWine").val(replenishApplyWine);
				 $("#fatVolume").val(fatVolume);
				})
			})
</script>
<script type="text/javascript">
	function save() {

        $.ajax({
            type: 'get',
            data:
                    {
                        replenishApplyWine: $("#replenishApplyWine").val(),
                        replenishApplyNum:$("#replenishApplyNum").val(),
                        replenishApplyAddtime:$("#appDate").val(),
                        replenishApplyReason:$("#replenishApplyReason").val(),
                        fatVolume:$("#fatVolume").val()
                    },
            dataType: 'json',
            async: false,
            url: "/store/getWineApplyDo/${storeId!}",
            success: function (data) {
                var code = data.code;
                var msg = data.msg;
                var info = data.data;
                if(code==200){
                    layer.alert(msg,function () {
                        window.location.href="/store/manage/${storeId!}";
                        return false;
                    });
				}else {
                    layer.alert(msg);
                    return false;
                }
            }
        });
    }
</script>
</body>
</html>
