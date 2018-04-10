<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
    <script>
        $(function(){
            var realMoney = ${price1!};
            $('#confirm').click(function(){
                $('.GmBuy').css('display','none');
                $('.zhebiceng').css('display','none');
                window.location.href = "/c/ticket/list";
            })

            $('#coupons').click(function(){
                $('.goumaijq_7').slideDown("slow");
                $('.zhebiceng').css('display','block');

            })
            $('#coupons_no').click(function(){
                $('.goumaijq_7').hide();
                $('.zhebiceng').css('display','none');

            })

            $('.user_30').click(function(){

                if($(this).find("input").prop("checked")){
                    $('.goumaijq_7').hide();
                    $('.zhebiceng').css('display','none');
                    $(this).find("input").removeAttr("checked");
                    $("#voucherMoney").html('${vouchers!"0"}个可用');
                    $("#realMoney").html('￥${price1!}');
                }else{
                    $('.goumaijq_7').hide();
                    $('.zhebiceng').css('display','none');
                    $(this).find("input").prop("checked", true);
                    var coucher = $("input[name='voucher']:checked").val();
                    coucher = $("#"+coucher).val();
                    $("#voucherMoney").html('-'+coucher+'元');
                    realMoney = ${price1!}-coucher;
                    if(realMoney<=0){
                        realMoney = 0;
                    }
                    $("#realMoney").html('￥'+realMoney);
                }
            })

            $("#BUY").click(function(){
                var orderId = ${order.orderId};
                var voucherId = $("input[name='voucher']:checked").val();
                var payType = $("input[name='1']:checked").val();

                if(payType == ${WeChatPay}){
                    //使用微信支付
                    var body = "${body}";
                    $.ajax({
                        url: "/c/wechat/pay",
                        type: "post",
                        data:
                                {
                                    body:body,
                                    money:realMoney,
                                    orderId:orderId,
                                    voucherId:voucherId
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

                }else if(payType == ${VipYuEPay}){
                    //会员余额支付
                    $.ajax({
                        type: 'GET',
                        url: '/c/order/orderYuEPay/'+orderId,
                        data: {
                            voucherId:voucherId
                        },
                        dataType: 'json',
                        success: function (data) {
                            var code = data.code;
                            var msg = data.msg;

                            if(code==200){
                                $('.GmBuy').css('display','block');
                                $('.zhebiceng').css('display','block');
                            }else{
                                layer.alert(msg, {icon: 5, shade: false});
                                return false;
                            }

                        },
                        error: function (xhr, type) {
                            alert("lalalal");
                        }
                    });
                }

            })
        })


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
                            $('.GmBuy').css('display','block');
                            $('.zhebiceng').css('display','block');
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

    </script>
</head>

<body class="body_3">
  <div class="header"><img src="/images/27.png" onclick="javascript :history.back(-1);"><span>确认订单</span><span></span></div>
  <div class="goumaijq"><span>酒品</span><span>${(wine.wineName)!}</span></div>
  <div class="goumaijq_1"><span>酒量（ml）</span><span>${(num)!}</span></div>
  <div class="goumaijq_1"><span>酒费（¥）</span><span>原价<s>¥${ticketGive.ticketGiveMoney!}</s><c style="color:#ff5901;font-size:0.26rem;margin-left:0.1rem;">${ticketGive.ticketGiveRealmoney!}</c></span></div>
  <div class="goumaijq_1"><span onclick=window.location.href="/c/store/suitStore?storesStr=${storesStr!}">适用门店</span><span>${size!}家<img class="wineList_4" src="/images/gengduo.png"></span></div>
  <div class="goumaijq_1"><span>有效期至</span><span>${(endTime?number_to_date)!}</span></div>
  <div class="goumaijq_4"><span>可用优惠券</span><span id="coupons"><c id="voucherMoney">${vouchers!"0"}个可用</c><img src="/images/gengduo.png"></span></div>
  <div class="goumaijq_1"><span>结算比列</span><span>${ratios!}%</span></div>
  <div class="goumaijq_5"><span>支付方式</span></div>
  <div class="goumaijq_6"><img src="/images/bug_wine_icon_weixin.png"><span>微信支付</span><input name='1' checked="checked" type="radio" value="${WeChatPay}"></div>
  <div class="goumaijq_6"><img src="/images/bug_wine_icon_associator.png"><span>余额支付</span><input name="1" type="radio" value="${VipYuEPay}"></div>
  <div class="goumaiBuy"><span>合计</span><span id="realMoney">¥${price1!}</span><button id="BUY">确认支付</button></div>
  <div class="GmBuy">
    <img src="/images/Buysuccess.png">
    <span>购买成功</span>
    <span>您可在"会员中心--我的酒券"中查看</span>
    <button id="confirm">确认</button>
  </div>
  <div class="zhebiceng"></div>
  <div class="goumaijq_7">
    <div class="goumaijq_8">
     <#if voucherList??>
         <#list voucherList as voucher><div class="user_30" ">
    <div class="user_30_1"><span>¥<b>${(voucher.voucherMoney)!}</b></span>
        <#if '${VoucherMin}'=='${(voucher.voucherIfMin)!}'>
        <span>满${(voucher.voucherMin)!}可用</span>
        </#if></div>
    <div class="user_30_2"><span>${(voucher.voucherName)!}</span><span>有效期至：
                      <#if '${(voucher.voucherIfTerm)!}'='${VoucherTermOn!}'>
                          ${(voucher.voucherEndtime?number_to_date)!}
                      <#else >
                   永久
                      </#if></span><span>限品类：
                      <#if '${(voucher.voucherIfWine)!}'='${VoucherLimitWine!}'>
                   限制
                      <#else >
                   无限制
                      </#if></span><span>限门店：
                      <#if '${(voucher.voucherIfStore)!}'='${VoucherLimitStore!}'>
                   限制
                      <#else >
                   无限制
                      </#if>
    </span></div>
    <input type="radio" value="${(voucher.voucherId)}"  name="voucher" >
    </div>
    <input readonly type="hidden" value="${(voucher.voucherMoney)!}" id="${voucher.voucherId}" />
         </#list>
     </#if>
  </div>
     <div class="goumaijq_9" id="coupons_no">取消</div>
  </div>
<!--/* <script>
  $(document).click(function(e){
		 var _con = $('.goumaijq_7');  // 设置目标区域
		 if($('.goumaijq_7').css('display')=='block')
		 {
			 alert(1);
			  if(!_con.is(e.target) && _con.has(e.target).length === 0){
			 $('.goumaijq_7').remove();
			 }
			
		  }
		  else
		  {}
		});
 </script>*/-->
  <div style="height:1rem;width:100%"></div>
</body>
</html>
