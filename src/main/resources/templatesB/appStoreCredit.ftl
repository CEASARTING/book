<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本店管理</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
</head>

<body class="body_2">
   <div class="header"><img onclick=window.location.href="/store/balance/${storeId!}" src="/images/27.png"><span>授信额度</span><span onclick=window.location.href="/store/creditDetail/${store.storeId}">明细</span> </div>
   <div class="user_14">
     <span>总额度</span>
     <c>${store.storeCreditTotal?string('0.00')}</c>
   </div>
   <div class="user_15">
     <span>可用额度（元）</span><span>${store.storeCreditRemain?string('0.00')}</span>
     <span>剩余应还（元）</span><span>${store.storeCreditShouldRepay?string('0.00')}</span>
   </div>
   <button class="user_16">现金余额还款</button>
</body>
</html>
