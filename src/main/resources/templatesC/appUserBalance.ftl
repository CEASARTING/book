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

<body class="body_1">
  <div class="header">
     <span onclick="javascript :history.back(-1);"><</span>
     <span>账户管理</span>
     <span></span>
  </div>
  <div class="user_7">
    <span>会员余额（元）</span>
    <span>${(cUser.userRechange?string("0.00"))!"0.00"}</span>
  </div>
  <div class="user_3" onclick=window.location.href="/charge/index/"><span>充值</span><span>></span></div>
  <div class="user_3" onclick=window.location.href="/c/user/balanceDetail/100"><span>明细</span><span>></span></div>
  <div class="user_3"><span>提现</span><span>></span></div>
   <div class="user_3" style="margin-top:0.18rem;"><span>发票与报销</span><span>></span></div>
</body>
</html>
