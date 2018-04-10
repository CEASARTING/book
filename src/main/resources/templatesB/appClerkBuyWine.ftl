<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>买酒</title>
<link rel="stylesheet" href="/css/zhifu.css" type="text/css"/>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
    <script type="text/javascript">
        function pay() {
            var url1 = ${machineId}+"/";
            var url2 = url1+${wine.wineId};
            var url3 = url2+"/";
            var url = url3+${wineNum};
            $.ajax({
                url: "/order/clerk/pay/"+url,
                type: "get",
                dataType:"json",
                async: false,
                success:function (data) {
                    var code = data.code;
                    var msg = data.msg;
                    if (code==1) {
                        layer.alert(msg, {icon: 6, shade: false}, function (index) {
                            window.location.href="/clerk/center";
                        });
                        return false;
                    }else if(code==2) {
                        layer.alert(msg, {icon: 5, shade: false});
                        return false;
                    }
                }
            });

        }
    </script>
</head>

<body class="body_1">
   <div class="zhifu_1">
     <div class="zhifu_2">
         <span>酒品</span>
         <span>${wine.wineFactory!} ${degree!}°${wineType!}[${wine.wineClass!}]</span>
     </div>
     <div class="zhifu_2">
         <span>购买量（ml）</span>
         <span>${wineNum!}</span>
     </div>
     <div class="zhifu_2" style="border-bottom:0">
         <span>酒费</span>
         <span>${orderPrice!}</span>
     </div>
   </div>
   <div class="zhifu_5">
     <img src="/images/bug_wine_icon_rebate.png">
     <span>返利余额抵扣（¥）</span>
     <span style="right:4%;">${rebateVoucher!}</span>
   </div>
   <div class="zhifu_3">
      <span>支付方式</span>
      <div class="zhifu_3_1">
         <img src="/images/bug_wine_icon_store.png">
         <span>门店余额</span>
         <img src="/images/bug_wine_btn_choice.png">
      </div>
   </div>
   <div class="zhifu_4">
     <div class="zhifu_4_1">
         <span>还需支付：</span>
         <span>¥${toPay!}</span>
     </div>
       <button class="zhifu_4_2" onclick="pay()">确认支付</button>
   </div>
</body>
</html>
