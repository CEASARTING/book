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
   <div class="header"><img onclick=window.location.href="/store/getWineApply/${storeId}" src="/images/27.png"><span>补货记录</span></div>
<#if list??>
    <#list list as list>
    <div class="user_23">
        <div class="user_23_1">
            <span>申请时间：<c>${(list.replenishApply.replenishApplyAddtime?number_to_datetime)!""}</c></span>
            <span>申请名称：<c>${(list.wine.wineFactory)!}${(list.wine.wineClass)!}【${(list.wine.wineDegree)!}°${(list.dict.dictName)!}】-${list.fatValume!}装</c></span>
            <span>数量：<c>${(list.replenishApply.replenishApplyNum)!}</c></span>
            <#if '${applyOk}' == '${(list.replenishApply.replenishApplyStatus)!}'>
                <img src="/images/ybh.png"/>
            <#elseif '${applyNot}'=='${(list.replenishApply.replenishApplyStatus)!}'>
                <img src="/images/yjujue.png"/>
            <#elseif '${(list.replenishApply.replenishApplyStatus)!}'=='${applyIng}'>
                <img src="/images/sqz.png" />
            </#if>
        </div>
        <div class="user_23_2">
            <span>补货时间：<c>${(list.replenishApply.replenishApplyEndtime?number_to_datetime)!"无"}</c></span>
            <span onclick=window.location.href="/store/getWineApplyDetail/${(list.replenishApply.replenishApplyId)!}">查看申请</span>
            <img class="user_23_img2" src="/images/28.png" onclick=window.location.href="/store/getWineApplyDetail/${(list.replenishApply.replenishApplyId)!}">
        </div>
    </div>
    </#list>
</#if>
</body>
</html>
