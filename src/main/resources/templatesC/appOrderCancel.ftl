<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
</head>

<body  class="body_1">
 <div class="header"><img src="/images/27.png" onclick="javascript :history.back(-1);"><span>订单详情</span></div>
  <div class="user_55">
    <span>${(ticket.wine.wineFactory)!}<c>${(ticket.wine.wineClass)!} 【${(ticket.wine.wineDegree)!}°${(ticket.wineType.dictName)!}</c></span>
    <span>订单编号：<c>${(ticket.order.orderNumber)!}</c></span>
    <span>下单时间：<c>${((ticket.order.orderAddtime)?number_to_datetime)!}</c></span>
    <#if '${(ticket.order.orderSource)!}' = '${OrderSourceBuyTicket!}'>
      <img src="/images/jiuquan.png">
    <#elseif  '${(ticket.order.orderSource)!}' = '${OrderSourceBuyTicketStore!}'>
        <img src="/images/jiuquan.png">
    <#else >
    <img src="/images/jiudan.png">
    </#if>
  </div>
   <div class="user_56" onclick=window.location.href="/c/store/suitStore?storesStr=${storesStr!}"><span>适用门店</span><span>${storeName!}${stores!}家</span><span>></span></div>
  <div class="user_57"><span>支付方式</span><span>
      <#if '${WeChatPay!}'='${(ticket.order.orderPayType)!}'>
          微信余额
          <#elseif  '${VipYuEPay!}'='${(ticket.order.orderPayType)!}'>
          会员余额
      </#if>
  </span></div>
  <div class="user_57"><span>选择红包</span><span>无</span></div>
  <div class="user_58">
     <span>购买酒量</span><span>${(ticket.order.orderTotal)!}ml</span>
     <span>原价</span><span>￥${(ticket.order.orderPrice)!'0.00'}</span>
     <span>优惠（含红包）</span><span>-￥${(ticket.order.orderFavour)!'0.00'}</span>
  </div>
  <div class="user_59"><span><d>实付款：</d><c>¥</c>${(ticket.order.orderRealMoney)!'0.00'}</span></div>
 <div class="user_61">
     <span>取消时间：</span><span>${((ticket.order.orderFinishtime)?number_to_datetime)!}</span>
     <button style="display:none">申请售后</button>
     <button>再次购买</button>
 </div>
</body>
</html>
