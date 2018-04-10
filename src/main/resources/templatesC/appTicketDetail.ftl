<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
</head>

<body class="body_1">
  <div class="header"><img src="/images/27.png"  onclick="javascript :history.back(-1);"><span>酒券详情</span></div>
  <div class="C-user_19">
      <#--<span class="C-user_19_1">${(ticket.wine.wineFactory)!}</span><span class="C-user_19_2">纯粮陈窖【52度浓香型】</span>-->
      <#--<span class="C-user_19_3">使用期限：2017-01-02至2018-02-28</span>-->
      <#--<span class="C-user_19_4">¥<b>320</b></span><span class="C-user_19_5"><span>存量：5000ml</span><c>总量：5000ml</c></span>-->
      <#--<span class="C-user_19_6">取酒码：<span>1906 6678 9877</span></span>-->
      <#--<button class="C-user_19_7">可分享赠送</button>-->

      <span class="C-user_19_1">${(ticket.wine.wineFactory)!}</span><span class="C-user_19_2">${(ticket.wine.wineClass)!} 【${(ticket.wine.wineDegree)!}度${(ticket.wineType.dictName)!}】</span>
  <span class="C-user_19_3">使用期限：<#if (ticket.ticket.ticketEndtime)??>
    ${((ticket.ticket.ticketStarttime)?number_to_date)!}至${((ticket.ticket.ticketEndtime)?number_to_date)!"永久"}
  <#else >
  永久
  </#if></span>
  <span class="C-user_19_4">¥<b>${(ticket.order.orderPrice)!}</b></span><span class="C-user_19_5"><span>存量：${(ticket.ticket.ticketSurplus)!}ml</span><c>总量：${(ticket.ticket.ticketTotal)!}ml</c></span>
  <span class="C-user_19_6">取酒码：<span>${(ticket.ticket.ticketGetwinenumber)!}</span></span>
  <#if '${(ticket.ticket.ticketIfcangive)!}'='${give!}'>
  <button class="C-user_19_7">可分享赠送</button>
  </#if>
  </div>
  <div class="C-user_20"><span>适用门店</span><span>共${stores!}家 ></span></div>
  <div class="C-user_21">
    <span class="C-user_21_1">使用说明</span>
    <div class="C-user_21_2">
      <span>1、请到门店使用，使用时点击智能酒柜上的【酒券兑换】，输入取酒码进行使用；</span>
      <span>2、分享赠送后使用期限不变；</span>
      <span>3、进行使用；</span>
    </div>
  </div>
  <div class="C-user_22"><span>获得时间</span><span>${((ticket.ticket.ticketTime)?number_to_datetime)!}</span></div>
  <div class="C-user_23"><span>酒券来源</span><span>
        <#if '${(ticket.ticket.ticketSource)!}'='${buy}'>
                      购买
        <#elseif '${(ticket.ticket.ticketSource)!}'='${buyStore}'>
                        购买
        <#elseif '${(ticket.ticket.ticketSource)!}'='${receive}'>
                      赠送
        <#elseif '${(ticket.ticket.ticketSource)!}'='${otherGive}'>
                      转赠
        <#else >
                赠品
        </#if>
  </span></div>
  <button class="C-user_24">分享赠送</button>
</body>
</html>
