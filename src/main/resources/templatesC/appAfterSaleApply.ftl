<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
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
    <script type="text/javascript">
        function submit(){
            $.ajax({
                type: 'post',
                data:
                        {
                            afterServiceOrder: ${order.orderId!},
                            afterServiceType:$("#type").val(),
                            afterServiceContent:$("#abc").val()
                        },
                dataType: 'json',
                async: false,
                url: "/c/order/afterSaleApply",
                success: function (data) {
                    var code = data.code;
                    var msg = data.msg;
                    var info = data.data;
                    if(code==200){
                        layer.alert(msg,{icon: 6, shade : false},function () {
                            window.location.href="/c/order/afterSale/${userId!}";
                            return false;
                        });
                    }else {
                        layer.alert("您已经申请过啦", {icon: 5, shade : false});
                        return false;
                    }
                }
            });
        }
    </script>
</head>

<body class="body_3">
  <div class="header"><img src="/images/27.png" onclick=window.location.href="/c/order/afterSale/${userId!}"><span>申请售后服务</span></div>
  <div class="C-user_1">
      <div class="C-user_1_1">
          <span>${order.orderWineName!}</c></span>
          <span>订单编号：<c>${order.orderNumber!}</c></span>
          <span>下单时间：<c>${(order.orderAddtime?number_to_datetime)!}</c></span>
      <#--<img src="images/ywc.png">-->
                <#if '${order.orderStatus!}'= '${orderPay}'>
                <img src="/images/dqj.png">
                <#elseif '${order.orderStatus!}'='${orderCancel}'>
                <img src="/images/yqx.png">
                <#elseif '${order.orderStatus!}'='${orderFinish}'>
                <img src="/images/ywc.png">
                <#elseif '${order.orderStatus!}'='${orderNotPay}'>
                <img src="/images/dzf.png">
                </#if>
      </div>
      <div class="C-user_1_2">
          <span>购买酒量：<c>${order.orderTotal!}ml</c></span>
          <span><d>实付款： </d>¥<c>${order.orderRealMoney!"0.00"}</c></span>
                <#if '${order.orderSource!}' = '${jiuquan}' >
                <img src="/images/jiuquan.png">
                <#elseif '${order.orderSource!}' = '${jiuquanStore}'>
                <img src="/images/jiuquan.png">
                <#else >
                <img src="/images/jiudan.png">
                </#if>
          <button class="C-user_1_btn1" onclick=window.location.href="/c/order/detail/${order.orderId}">查看订单</button>
      </div>
  </div>
  <div class="C-user_6"><span>服务类型</span>
  <#if '${type}'='${wine}'>
      <button id="type" value="${type}">退酒</button>
  <#elseif '${type}'='${money}'>
  <button  id="type" value="${type}">退款</button>
  </#if>
  </div>
   <div class="user_47">
      <span>服务类型</span>
      <textarea id="abc" oninput="text()" placeholder="请在此描述问题"></textarea>
      <span id="zishu"><c>0</c>/200</span>
   </div>
   <div class="C-user_7"><div class="C-user_7_1">提交申请后，售后专员可能会电话联系您</div><button class="C-user_7_2" onclick="submit()">提交</button></div>
</body>
</html>
