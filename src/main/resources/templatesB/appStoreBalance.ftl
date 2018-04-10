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

<body class="body_1">
  <div class="header">
     <img onclick=window.location.href="/store/manage/${store.storeId!}" src="/images/27.png">
     <span>账户管理</span>
     <span ></span>
  </div>
  <div class="user_7">
    <span onclick=window.location.href="/store/balanceDetail/${store.storeId}/100">现金余额（元）</span>
    <#if '${creditOk!}'=='${store.storeCreditStutas!}'>
        <span onclick=window.location.href="/store/credit/${store.storeId}">可用授信额（元）</span>
        <#else>
            <span ></span>
    </#if>
    <span onclick=window.location.href="/store/balanceDetail/${store.storeId}/100">${store.storeRecharge?string('0.00')}</span>

  <#if '${creditOk!}'=='${store.storeCreditStutas!}' >
      <span onclick=window.location.href="/store/credit/${store.storeId}">${store.storeCreditRemain?string('0.00')}</span>
  <#else>
      <span ></span>
  </#if>
  </div>
  <div class="user_3" onclick=window.location.href="/charge/index/"><span>充值</span><span></span><span>></span></div>
</body>
</html>
