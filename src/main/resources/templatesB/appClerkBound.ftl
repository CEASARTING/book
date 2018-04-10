<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>店员中心</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
 <script>
 $(function(){
	 $('#search').click(function(){

         layui.use('layer', function() {
             var layer = layui.layer;
             var phone = $("#phone").val();
             $.ajax({
                 type: 'post',
                 data:
                         {
                             phone: phone,
                         },
                 dataType: 'json',
                 url: "/clerk/getClerkByPhone",
                 success: function (data) {
                     var code = data.code;
                     var msg = data.msg;
                     var info = data.data;
                     switch (code) {
                         case 200:
                             $("#storeName").html(info.storeName);
                             $("#userId").html(info.userId);
                             $('.user_54').slideDown(500);
                             $("#J_getCode").attr("disabled", false);
                             $("#J_getCode").css('opacity','1');
                             $("#bound").attr("disabled", false);
                             $("#bound").css('opacity','1');
                             break;
                         default:
                             $('.user_54').slideUp(500);
                             $(this).css('background','#F25C62');
                             $('.user_44').slideDown(500);
                             $('#errorMsg').html(msg);
                             $('.zhebiceng').css('display','block');
                     }
                 }
             });
         });

     });


     $('#bound').click(function(){

         layui.use('layer', function() {
             var layer = layui.layer;
             var phone = $("#phone").val();
             var code = $("#code").val();

             $.ajax({
                 type: 'post',
                 data:
                 {
                     phone: phone,
                     code:code,
                 },
                 dataType: 'json',
                 url: "/clerk/clerkBoundDo",
                 success: function (data) {
                     var code = data.code;
                     var msg = data.msg;
                     var info = data.data;
                     switch (code) {
                         case 200:
                             layer.alert("绑定成功!",{icon:6},function () {
                                 wx.closeWindow();
                             });
                             break;
                         default:
                             layer.alert(msg,{icon:5});
                     }
                 }
             });
         });

     });


	 $('#close').click(function(){
		 $('#search').css('background','#04A6FE');
		 $('.user_44').hide();
		 $('.zhebiceng').css('display','none');

	 });


	 })
 </script>
 <script>
  //获取验证码
 $(function () {
 $("#J_getCode").click(function(){
	layui.use('layer', function(){
            var layer = layui.layer;
            var phone = $("#phone").val();
            if(phone == ""){
                layer.msg("请填写手机号");
                return false;
            }

            $.ajax({
                type: 'post',
                data:
                {
                    phone: phone,
                },
                dataType: 'json',
                url: "/common/getCode",
                success: function (data) {
                    var code = data.code;
                    var msg = data.msg;
                    var info = data.data;
                    switch (code) {
                        case 200:
                            layer.msg("短信发送成功！");
                            resetCode();
                            break;
                        default:
                            layer.alert(msg,{icon:5});
                    }
                }
            });
		});
	});


     function resetCode(){
         $('#J_getCode').hide();

         var second = 60;
         $('#J_second').html(second+"秒后重发");
         $('#J_second').show();
         var timer = null;
         timer = setInterval(function(){
             second -= 1;
             if(second >0 ){
                 $('#J_second').html(second+"秒后重发");
             }else{
                 clearInterval(timer);
                 $('#J_getCode').show();
                 $('#J_second').hide();
             }
         },1000);
     }
});



 </script>
    <script type="text/javascript">
        wx.config({
            debug: false,
            appId:"${map.appId}",
            timestamp: "${map.timestamp}",
            nonceStr: "${map.nonceStr}",
            signature: "${map.signature}",
            jsApiList: [
                'closeWindow'
            ]
        });


        wx.ready(function () {
        });
    </script>
    <style>
        .user_55 span:nth-child(1) {
            font-family: PingFangSC-Medium !important;
            font-size: 0.24rem !important;
            color: #535353 !important;
            letter-spacing: 0 !important;
            position: absolute !important;
            top: 0.2rem !important;
            left: 4.3% !important;
            line-height: 0 !important;
            font-weight: 100 !important;;
        }
    </style>
</head>

<body class="body_2">
  <div class="user_4">
    <span>第一步：请输入手机号，点【查询】是否已添加到门店</span>
    <input id="phone" type="text"/><button id="search">查询</button>
    <input id="userId" type="hidden"/>

  </div>
    <div class="user_54"><span>查询门店名称为：<c id="storeName">陕西门店</c></span></div>
    <div class="user_55">
     <span>第二步：点击发送【验证码】进行身份验证</span>
    <input type="text" id="code"/><button id="J_getCode" disabled="disabled">发送验证码</button>
    <span id="J_second" style="display: none;" >60秒后重发</span>
    <button id="bound" disabled="disabled">确认绑定</button>
  </div>

  <div class="user_44">
    <span id="errorMsg">该号码不存在，请联系门段管理员添加。</span>
    <button id="close">关闭</button>
  </div>
  <div class="zhebiceng"></div>
</body>
</html>
