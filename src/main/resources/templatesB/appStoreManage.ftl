<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>店员中心</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
</head>

<body class='body_3'>
<div class="header"><img src="/images/27.png" onclick=window.location.href="/clerk/center"><span>${name!}</span><span></span></div>
  <div class="user_5">
    <span>${userName!}， 欢迎使用</span>
    <span onclick=window.location.href="/store/balance/${storeId!}">${storeYuE!"0"}<c>元</c></span><span>门店余额</span>
    <span onclick=window.location.href="/store/rebateDetail/${storeId!}">${storeRebate!"0"}<c>元</c></span><span>返利余额</span>
    <span onclick=window.location.href="/store/salesCount/${storeId!}" >${sum!"0"}<c>元</c></span><span onclick=window.location.href="/store/salesCount/${storeId!}">本日销售额</span>
  </div>
   <div class="user_3" style="margin-top:0.6rem" onclick=window.location.href="/store/clerkManage/${storeId!}">
    <span >店员管理</span>
    <span>共${clerkNums!}个</span>
    <span>></span>
  </div>
   <div class="user_3" onclick=window.location.href="/store/manageCabinet/${storeId!}"><span>酒柜管理</span><span>共${cabinetNums!}台</span><span>></span></div>
   <div class="user_3" onclick=window.location.href="/store/storeEdit"><span>门店基本信息</span><span></span><span>></span></div>
   <div class="user_3"><span>开票申请</span><span></span><span>></span></div>
   <div class="user_3" onclick=window.location.href="/store/getWineApply/${storeId}"><span>补货申请</span><span></span><span>></span></div>
   <div class="user_3" onclick=window.location.href="/store/storeTicket/${storeId}"><span>本店酒券</span><span>共${ticketNums!}张</span><span>></span></div>
   <div class="user_3"><span>推荐菜品</span><span></span><span>></span></div>
</body>
</html>
