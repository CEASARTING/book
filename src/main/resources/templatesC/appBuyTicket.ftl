<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购买酒券</title>
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
</head>

<body class="body_3">
  <div class="header"><img src="/images/27.png" onclick=window.location.href="/c/ticket/list"><span>购买酒券</span><span></span></div>
  <div class="goumaijq"><span>酒品</span><span>${wine.wineName!}</span></div>
  <div class="goumaijq_1"><span>酒量（ml）</span><span>${ticketGive.ticketGiveWineAmount!}</span></div>
  <div class="goumaijq_1"><span>酒费（¥）</span><span>原价<s>¥${ticketGive.ticketGiveMoney!}</s><c style="color:#ff5901;font-size:0.26rem;margin-left:0.1rem;">${ticketGive.ticketGiveRealmoney!}</c></span></div>
  <div class="goumaijq_1" onclick=window.location.href="/c/store/suitStore?storesStr=${storesStr!}"><span>适用门店</span><span>${size!}家<img class="wineList_4" src="/images/gengduo.png"></span></div>
  <div class="goumaijq_1"><span>有效期至</span><span>${(endTime?number_to_date)!}</span></div>
  <div class="goumaiBuy"><span>合计</span><span>¥${ticketGive.ticketGiveRealmoney!}</span><button id="BUY" onclick=window.location.href="/charge/index?ticketGiveId=${ticketGive.ticketGiveId!}&desc=${desc}">去结算</button></div>
  <div class="goumaijq_3"><span>
      <#if '${ticketGive.ticketGiveType}'='${ticketStatusCanrepeat}'>
          该酒券可分多次取酒
          <#elseif '${ticketGive.ticketGiveType}'='${ticketStatusNorepeat}'>
          该酒券为单次取酒
      </#if>
  </span></div>
</body>
</html>
