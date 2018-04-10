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

<body class="body_1">
  <div class="user_1"></div>
  <div class="user_2">
    <img src="${headimg}" class="user_2_1"/>
      <span>${userName!}， 欢迎使用</span>
     <span>${storeName!}</span>
    <span onclick=window.location.href="/clerk/packets/${userId}">${packetNums!}</span>
    <span onclick=window.location.href="/clerk/clerkRanks/${storeId!}"><#if rank??>第<b>${rank!}</b>名
    <#else >无排名
    </#if></span>
    <span>红包总数</span>
    <span onclick=window.location.href="/clerk/clerkRanks/${storeId!}">本月销售排行</span>
  </div>
  <div class="user_3" style="margin-top:0.6rem" onclick=window.location.href="/order/clerk/myOrder/100">
    <span>我的酒单</span>
    <span>待取酒${noPayNums!}个</span>
    <span>></span>
  </div>
  <div class="user_3" style="margin-top:0.02rem" onclick=window.location.href="/clerk/packets/${userId}">
    <span>我的红包</span>
    <span></span>
    <span>></span>
  </div>
  <div class="user_3" style="margin-top:0.02rem" onclick=window.location.href="/clerk/inviteCode">
    <span>我的推荐码</span>
    <span></span>
    <span>></span>
  </div>
  <div class="user_3" style="margin-top:0.02rem" onclick=window.location.href="/store/manage/${storeId!}">
    <span>本店管理</span>
    <span>管理员可用</span>
    <span></span>
  </div>
</body>
</html>
