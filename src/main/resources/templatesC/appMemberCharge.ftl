<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员中心</title>
    <link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
    <script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js" ></script>
    <script type="text/javascript" src="/js/layer/layer.js" ></script>
    <script type="text/javascript">
        window['adaptive'].desinWidth=750;
        window['adaptive'].baseFont=12;
        window['adaptive'].maxWidth=480;
        window['adaptive'].init();
    </script>
    <script>
        function run(){
            var a=parseInt($('#money').val());
            if(a>0)
            {
                $('.C-user_11').css('opacity','1');
                $('.C-user_11').attr('disabled',false);
            }
            else
            {
                $('.C-user_11').css('opacity','0.4');
                $('.C-user_11').attr('disabled',true);
            }
        }
    </script>
    <script type="text/javascript">
                function onBridgeReady(data){
                    WeixinJSBridge.invoke(
                            'getBrandWCPayRequest', {
                                "appId":data.appId,     //公众号名称，由商户传入
                                "timeStamp":data.timeStamp,         //时间戳，自1970年以来的秒数
                                "nonceStr":data.nonceStr, //随机串
                                "package":data.package,
                                "signType":data.signType,         //微信签名方式：
                                "paySign":data.paySign //微信签名
                            },
                            function(res){
                                if(res.err_msg == "get_brand_wcpay_request:ok" ) {

                                    layer.alert("支付成功",{icon:6},function () {
                                        window.location.href = "/c/user/userBalance";
                                    });
                                }
                                else if(res.err_msg == "get_brand_wcpay_request:cancel")
                                {
                                    layer.msg("支付取消");
                                }else
                                {
                                    layer.msg("支付失败");

                                }
                                // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                            }
                    );
                }

        function callPay(data)
        {
            if (typeof WeixinJSBridge == "undefined"){
                if( document.addEventListener ){
                    document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                }else if (document.attachEvent){
                    document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                    document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                }
            }else{
                onBridgeReady(data);
            }
        }


        function pay() {

            var money = $("#money").val();
            if(isNaN(money)||money<=0)
            {
                layer.msg("金额必须是大于0的有效数字");
                return false;
            }

            var body = "${body}";
            $.ajax({
                url: "/c/wechat/pay",
                type: "post",
                data:
                        {
                            body:body,
                            money:money
                        },
                dataType: 'json',
                success:function (data) {
                    //window.clearInterval(timer);
                    if (data.status == "ok") {
                        //   onBridgeReady(data.appId,data.timeStamp,data.nonceStr,data.signType,data.paySign,data.package);
                        callPay(data);
                    }else {
                        layer.msg("购买失败");
                    }
                }
            });
        }

    </script>
</head>

<body class="body_1">
<div class="header"> <span><</span><span>账户管理</span><span></span></div>
<div class="C-user_8"><span>支付方式</span><span>微信支付</span></div>
<div class="C-user_9"><span>充值金额<c>（充值返利${ratio!}%）</c></span><span>¥</span>
    <input id="money" oninput="run()" type="text" placeholder="0">
</div>
<div class="C-user_10"><span>当前余额${(balance?string("0.00"))!"0.00"}元<c>全部提现</c></span></div>
<div class="C-user_13"><div class="C-user_12"> 充值返利金额请到"会员中心-我的优惠"查看</div>
    <button class="C-user_11" disabled="disabled" onclick="pay()">充值</button>
</div>
</body>
</html>
