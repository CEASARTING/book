<!'0'DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本店管理</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
</head>

<body class="body_1">
  <div class="header"><img onclick=window.location.href="/store/manage/${storeId!}" src="/images/27.png"><span>销售统计</span><span></span></div>
  <table id="table1" class="user_17" border="0">
    <tr><td></td><td>销售额（元）</td><td>酒单量（个）</td><td>取酒量（ml）</td></tr>
    <tr><td>本日</td><td>${countInfoToday.salesMoneyPage!'0'}</td><td>${countInfoToday.orderNums!'0'}</td><td>${countInfoToday.wineNums!'0'}</td></tr>
    <tr><td>昨日</td><td>${countInfoYesterday.salesMoneyPage!'0'}</td><td>${countInfoYesterday.orderNums!'0'}</td><td>${countInfoYesterday.wineNums!'0'}</td></tr>
    <tr><td>本月</td><td>${countInfoThisMonth.salesMoneyPage!'0'}</td><td>${countInfoThisMonth.orderNums!'0'}</td><td>${countInfoThisMonth.wineNums!'0'}</td></tr>
    <tr><td>上月</td><td>${countInfoLastMonth.salesMoneyPage!'0'}</td><td>${countInfoLastMonth.orderNums!'0'}</td><td>${countInfoLastMonth.wineNums!'0'}</td></tr>
  </table>
  <div class="user_3" style="margin-top:0.2rem;" onclick=window.location.href="/store/saleDetail/${storeId!}"><span onclick=window.location.href="/store/saleDetail/${storeId!}">销售明细</span><span onclick=window.location.href="/store/saleDetail/${storeId!}"></span><span onclick=window.location.href="/store/saleDetail/${storeId!}">></span></div>
  <div class="user_18">注：以上只针对本店店员扫码支付的酒单</div>
  <div class="user_3" onclick=window.location.href="/store/getWineLog/${storeId!}"><span>取酒记录</span><span></span><span>></span></div>
</body>
</html>
