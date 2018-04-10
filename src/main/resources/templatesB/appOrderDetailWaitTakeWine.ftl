<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>本店管理</title>
    <link rel="stylesheet" href="/css/main.css" type="text/css"/>
    <script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript">
        window['adaptive'].desinWidth=750;
        window['adaptive'].baseFont=12;
        window['adaptive'].maxWidth=480;
        window['adaptive'].init();
    </script>
</head>

<body  class="body_1">
<div class="header"><img onclick=window.location.href="/order/clerk/myOrder/100" src="/images/27.png"><span>订单详情</span></div>
<div class="user_55">
    <span>${(ticket.wine.wineFactory)!}<c>${(ticket.wine.wineClass)!}【${degree!}°${(ticket.wineType.dictName)!}</c></span>
    <span>订单编号：<c>${(ticket.order.orderNumber)!}</c></span>
    <span>下单时间：<c>${(ticket.order.orderAddtime?number_to_datetime)!}</c></span>
    <img src="/images/jiudan.png">
</div>

<div class="user_57"><span>支付方式</span><span>${payType!}</span></div>
<div class="user_58">
    <span>购买酒量</span><span>${(ticket.order.orderTotal)!}ml</span>
    <span>原价</span><span>￥${(ticket.order.orderPrice)!}</span>
    <span>门店结算比例</span><span>${rate!100}%</span>
    <span>门店返利余额</span><span>-￥${rebate!0}</span>
</div>
<div class="user_59"><span><d>实付款：</d><c>¥</c>${(ticket.order.orderRealMoney)!}</span></div>
<div class="user_56"><span>取酒门店</span><span>${storeName!}</span><span></span></div>
<div class="user_56"><span>取酒时间</span><span>${(time?number_to_datetime)!"待取酒"}</span><span></span></div>
<div class="user_61">
    <span>支付时间：</span><span>${(ticket.order.orderPayTime?number_to_datetime)!}</span>
    <button style="display:none"></button><button>申请售后</button>
</div>
</body>
</html>
