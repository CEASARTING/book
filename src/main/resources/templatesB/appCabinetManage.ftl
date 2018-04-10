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

<body class="body_1">
  <div class="header"><img onclick=window.location.href="/store/manage/${storeId!}" src="/images/27.png"><span>酒柜管理</span>
      <span onclick=window.location.href="/store/getWineApply/${storeId!}">补货申请</span></div>

  <#if list?exists>
      <#list list as cabinetPage>
      <div class="user_20">
          <div class="user_20_1">
              <div class="user_20_1_1">
                  ${cabinetPage.cabinetFatSurplus!}
                  <div class="user_20_1_2"></div>

              </div>
              <div class="user_20_1_3">
                  <span>酒柜编号：<c>${cabinetPage.cabinetNumber!}</c></span>
                  <span>安装时间：<c>${cabinetPage.cabinetAddtimePage!}</c></span>
                  <span>本月出酒：<c>共计<#if cabinetPage.monthOutWine?exists>${cabinetPage.monthOutWine!}
                  <#else >
                  0
                  </#if>
      ml</c></span>
                  <span>最后一次出酒：<c>${cabinetPage.lastOutWine!}ml</br>${cabinetPage.lastOutTimePage!}</c></span>
                  <b>${cabinetPage.cabinetStatusPage!}</b>
              </div>
          </div>
          <div class="user_3" style="margin-top:0.02rem"><span>${cabinetPage.wineFactory!}.${cabinetPage.wineName!}[${cabinetPage.wineDegree!}°${cabinetPage.wineType!}]</span><span>取酒记录</span>
              <span onclick=window.location.href="/store/getWineLog/${storeId}?cabinetId="+${cabinetPage.cabinetId!}>></span></div>
      </div>

      </#list>
  </#if>

</body>
</html>
