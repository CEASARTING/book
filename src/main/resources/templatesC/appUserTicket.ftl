<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
  <script>
   $(function(){
	   $('.user_12_1').click(function(){
		   
		   $(this).addClass('checked').siblings().removeClass('checked');
		   if($(this).text()=="未使用")
		   {
			   $('#aaa').css('display','block');
			   $('#bbb').css('display','none');
			   $('#ccc').css('display','none');
		   }
		   else if($(this).text()=="已使用")
		   {
			   $('#bbb').css('display','block');
			   $('#aaa').css('display','none');
			   $('#ccc').css('display','none');
		   }
		   else
		   {
			   $('#ccc').css('display','block');
			   $('#bbb').css('display','none');
			   $('#aaa').css('display','none');
			}
		   })
	})
 </script>
</head>

<body class="body_1">
  <div class="header"><img onclick=window.location.href="/c/user/center/${userId!}" src="/images/27.png"><span>我的酒券</span></div>
  <div class="user_12">
      <div class="user_12_1 checked">未使用</div>
      <div class="user_12_1">已使用</div>
      <div class="user_12_1">已过期</div>
   </div>
   <div id="aaa" style="width:100%; height:auto">
       <#if ticketInfosCanUse??>
           <#list ticketInfosCanUse as ticket>
           <div class="user_30" onclick=window.location.href="/c/ticket/detail/${(ticket.ticket.ticketId)!}">
           <div class="user_30_1"><span>
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
           <div class="user_30_2"><span>${(ticket.wine.wineFactory)!}</span><span>${(ticket.wine.wineClass)!}
               【${(ticket.wine.wineDegree)!}°${(ticket.wineType.dictName)!}】</span><span>取酒码:${(ticket.ticket.ticketGetwinenumber)!}</span>
               <span>有效期至：${((ticket.ticket.ticketEndtime)?number_to_date)!"永久"}</span></div>
           </div>
           </#list>
       </#if>
           <span class="user_33">没有更多可用酒券<a>兑换酒券</a></span>
   </div>
   <div id="bbb" style="width:100%; height:auto; display:none">
   <#if ticketInfosCanNotUse??>
       <#list ticketInfosCanNotUse as ticket>
           <span class="user_32">兑换时间：2017-11-28 11:12:13</span>
           <div class="user_31" onclick=window.location.href="/c/ticket/detail/${(ticket.ticket.ticketId)!}">
               <div class="user_31_1">
                   <span>
                   <#if '${(ticket.ticket.ticketSource)!}'='${ticketSourceBuy}'>
                       ¥<b>${(ticket.order.orderPrice)!}</b>
                   <#elseif '${(ticket.ticket.ticketSource)!}'='${ticketSourceReceive}'>
                       <b>赠品</b>
                   </#if>
           </span><span>${(ticket.ticket.ticketTotal)!}ml</span></div>
               <div class="user_31_2"><span>${(ticket.wine.wineFactory)!}</span><span>${(ticket.wine.wineClass)!}
                   【${(ticket.wine.wineDegree)!}°${(ticket.wineType.dictName)!}】</span><span>取酒码:${(ticket.ticket.ticketGetwinenumber)!}</span>
                   <span>有效期至：${((ticket.ticket.ticketEndtime)?number_to_date)!"永久"}</span></div>
           </div>
       </#list>
   </#if>

   </div>
   <div id="ccc" style="width:100%; height:auto;display:none">
   <#if ticketInfosCanUseEndTime??>
       <#list ticketInfosCanUseEndTime as ticket>
           <div class="user_31" onclick=window.location.href="/c/ticket/detail/${(ticket.ticket.ticketId)!}">
               <div class="user_31_1">
                   <span>
                       <#if '${(ticket.ticket.ticketSource)!}'='${ticketSourceBuy}'>
                           ¥<b>${(ticket.order.orderPrice)!}</b>
                       <#elseif '${(ticket.ticket.ticketSource)!}'='${ticketSourceReceive}'>
                           <b>赠品</b>
                       </#if>
           </span><span>${(ticket.ticket.ticketTotal)!}ml</span></div>
               <div class="user_31_2"><span>${(ticket.wine.wineFactory)!}</span><span>${(ticket.wine.wineClass)!}
                   【${(ticket.wine.wineDegree)!}°${(ticket.wineType.dictName)!}】</span><span>取酒码:${(ticket.ticket.ticketGetwinenumber)!}</span>
                   <span>有效期至：${((ticket.ticket.ticketEndtime)?number_to_date)!"永久"}</span></div>
           </div>
       </#list>
   </#if>
       <#--<span class="user_33">没有更多可用酒券<a>兑换酒券</a></span>-->
   </div>
</body>
</html>
