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

<body class="body_3">
  <div class="huiy_top">
     <img class="huiyt_1" src="${user1.userWxHeading!}"/>
     <span class="huiyt_2">${user1.userWxName!}</span>
     <span class="huiyt_3">会员卡</span>
     <button class="huiyt_4"  onclick=window.location.href="/c/user/userEdit">编辑个人资料</button>
     <span class="huiyt_5">会员ID:<c>${user1.userMemId!""}</c></span>
      <img class="ewmtj" src="${url!"/images/tuijian_bg.png"}" onclick=window.location.href="/c/user/inviteCode">
      <span class="ewmtj_11">${vip!"普通卡"}</span>
      <img src="/images/ewm.png" class="ewmtj_1">
  </div>
  <div class="huiy_header">
     <span class="huiyh_1" onclick=window.location.href="/c/user/userBalance/">${(user1.userRechange?string("0.00"))!"0.00"}<c>元</c></span>
     <span class="huiyh_2" onclick=window.location.href="/c/user/userBalance/">余额</span>
     <span class="huiyh_3" onclick=window.location.href="/c/voucher/${user1.userId!}">${size!"0"}<c>张</c></span>
     <span class="huiyh_4" onclick=window.location.href="/c/voucher/${user1.userId!}">优惠券</span>
     <span class="huiyh_5">${user1.userIntegration!"0"}<c>分</c></span>
     <span class="huiyh_6">积分</span>
  </div>
  <div onclick=window.location.href="/c/order/myOrder/${ALL}" class="huim" style="margin-top:0.4rem;"><span>我的消费</span><span>待支付${nopayNums!"0"}个  ></span></div>
  <div class="huim" onclick=window.location.href="/c/user/userTicket/${user1.userId!}"><span>我的酒券</span><span>未使用${notUseTicket!}个  ></span></div>
  <div class="huiq">
<#if ticketInfosCanUse??>
    <#list ticketInfosCanUse as ticket>
          <div class="huiq_1" onclick=window.location.href="/c/ticket/detail/${(ticket.ticket.ticketId)!}">
              <div class="huiq_left">
            <span>
               <#if '${(ticket.ticket.ticketSource)!}'='${ticketSourceBuy}'>
                   ¥<b>${(ticket.order.orderPrice)!}</b>
               <#elseif '${(ticket.ticket.ticketSource)!}'='${ticketSourceBuyStore}'>
                   ¥<b>${(ticket.order.orderPrice)!}</b>
               <#elseif '${(ticket.ticket.ticketSource)!}'='${ticketSourceReceive}'>
                       <b>赠品</b>
               <#elseif '${(ticket.ticket.ticketSource)!}'='${otherGive}'>
                    <b>转增</b>
                   <#else >
                   <b>赠品</b>
               </#if>
            </span><span>${(ticket.ticket.ticketTotal)!}ml</span></div>
              <div class="huiq_right">
                  <span>${(ticket.wine.wineFactory)!}</span><span>${(ticket.wine.wineClass)!}
               【${(ticket.wine.wineDegree)!}°${(ticket.wineType.dictName)!}】</span>
                  <span>取酒码：${(ticket.ticket.ticketGetwinenumber)!}</span><span>有效期至：${((ticket.ticket.ticketEndtime)?number_to_date)!"永久"}</span>
                  <div class="huiq_right_1">存量：
                      <#--<#if '${(ticket.ticket.ticketSurplus)!}'>-->
                          <#--${(ticket.ticket.ticketSurplus)!}-->
                      <#--<#else >-->
                          <#--${(ticket.ticket.ticketSurplus)!}-->
                      <#--</#if>-->${(ticket.ticket.ticketSurplus)!}
                      ml</div>
              </div>
          </div>
    </#list>
</#if>


  </div>
   <div class="huim"><span>我的评价</span><span>待评价2个  ></span></div>
</body>
</html>
