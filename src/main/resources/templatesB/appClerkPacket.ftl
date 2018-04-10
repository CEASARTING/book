<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>店员中心</title>
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
  <div class="header"><img onclick=window.location.href="/clerk/center" src="/images/27.png"><span>我的红包</span></div>
  <div class="user_42">
    <div class="user_41">
      <span>${nums!"0"}<c>个</c></span>
      <span>${sum!"0"}<c>元</c></span>
      <span>红包总数</span>
      <span>红包总金额</span>
    </div>
  </div>
  <#if packets?exists>
      <#list packets as packet>
     <div class="user_43">
          <span><#if '${packet.clerkPacketSource!}'=='${PacketFromSale!}'>
              销售返利
          <#else>
              推荐提成
          </#if></span><span>${packet.clerkPacketMoney!}</span>
         <span>${(packet.clerkPacketTime?number_to_datetime)!""}</span><span>
       <#if '${packet.clerkPacketStatus!}'=='${PacketGive!}'>
           已发放
       <#else >
           未发放
       </#if>
      </span>


     </div>
      </#list>
  </#if>

</body>
</html>
