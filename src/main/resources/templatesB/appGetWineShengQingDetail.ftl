<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本店管理</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script src="/mobiscroll/js/mobiscroll.core-2.5.2.js" type="text/javascript"></script>
<script src="/mobiscroll/js/mobiscroll.core-2.5.2-zh.js" type="text/javascript"></script>
<link href="/mobiscroll/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
<link href="/mobiscroll/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
<script src="/mobiscroll/js/mobiscroll.datetime-2.5.1.js" type="text/javascript"></script>
<script src="/mobiscroll/js/mobiscroll.datetime-2.5.1-zh.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
<!-- S 可根据自己喜好引入样式风格文件 -->
<script src="/mobiscroll/js/mobiscroll.android-ics-2.5.2.js" type="text/javascript"></script>
<link href="/mobiscroll/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
</head>

<body class="body_1">
  <div class="header"><img onclick=window.location.href="/store/getWineApply/record/${storeId!}" src="/images/27.png"><span>申请记录</span><span ></span></div>
  <div class="user_3" ><span>酒品类型</span><span style="color: #F25C62;" class="awq">${(first.wineFactory)!}${(first.wineName)!}【${(first.wineDegree)!}°${(first.wineType)!}】-${(first.fatValume)!}装</span><span style="width:5%"></span></div>
  <div class="user_3" style="margin-top:0.02rem"><span>数量</span><input readonly="readonly"  id="replenishApplyNum"  value="${(replenishApply.replenishApplyNum)!}"/></div>
  <div class="user_3" style="margin-top:0.02rem"><span>期望到货时间</span><input readonly="readonly" name="appDate" id="appDate" type="text"  value="${(replenishApply.replenishApplyTime?number_to_date)!}"/></div>
  <div class="user_21" style="margin-top:0.02rem">
    <span>补货原因</span>
    <textarea placeholder="输入文字" contenteditable="true" id="replenishApplyReason" readonly="readonly">
        ${(replenishApply.replenishApplyReason)!}
    </textarea>
  </div>
</body>
</html>
