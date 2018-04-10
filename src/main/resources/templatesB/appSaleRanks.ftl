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
   <div class="header"><img onclick=window.location.href="/clerk/center" src="/images/27.png"><span>本月销售排行</span></div>
   <div class="user_36">
   <#--<img class="user_36_img1" src="/images/jptwo.png" /> -->
   <#if '${(rank2.rankUser.ranking)!}'=='1'>
       <img class="user_36_img1" src="/images/jpone.png" />
   <#elseif  '${(rank2.rankUser.ranking)!}'=='2'>
       <img class="user_36_img1" src="/images/jptwo.png" />
   <#elseif '${(rank2.rankUser.ranking)!}'=='3'>
       <img class="user_36_img1" src="/images/jptree.png"/>
   </#if>
       <span class="user_36_span1">${(rank2.rankUser.userRealName)!}</span>
   <#--<img class="user_36_img2" src="/images/jpone.png" /> -->
   <#if '${(rank1.rankUser.ranking)!}'=='1'>
       <img class="user_36_img2" src="/images/jpone.png" />
   <#elseif  '${(rank1.rankUser.ranking)!}'=='2'>
       <img class="user_36_img2" src="/images/jptwo.png" />
   <#elseif '${(rank1.rankUser.ranking)!}'=='3'>
       <img class="user_36_img2" src="/images/jptree.png"/>
   </#if>
       <span class="user_36_span2">${(rank1.rankUser.userRealName)!}</span>
   <#--<img class="user_36_img3" src="/images/jptree.png"/> -->
   <#if '${(rank3.rankUser.ranking)!}'=='1'>
       <img class="user_36_img3" src="/images/jpone.png" />
   <#elseif  '${(rank3.rankUser.ranking)!}'=='2'>
       <img class="user_36_img3" src="/images/jptwo.png" />
   <#elseif '${(rank3.rankUser.ranking)!}'=='3'>
       <img class="user_36_img3" src="/images/jptree.png"/>
   </#if>
       <span class="user_36_span3">${(rank3.rankUser.userRealName)!}</span>
   <div class="user_36_1"></div>
   <div class="user_36_2"></div>
   <div class="user_36_3"></div>
   </div>
   <#--<div class="user_37" style="margin-top:0.2rem;">-->
      <#--<div><#if '${(rank1.rankUser.ranking)!}'=='1'>-->
          <#--<img src="/images/no1.png">-->
            <#--<#elseif  '${(rank1.rankUser.ranking)!}'=='2'>-->
                <#--<img src="/images/no2.png">-->
          <#--<#elseif '${(rank1.rankUser.ranking)!}'=='3'>-->
          <#--<img src="/images/no3.png">-->
            <#--</#if></div><SPAN>第${(rank1.rankUser.ranking)!}名</SPAN><span>${(rank1.rankUser.userRealName)!}</span>-->
   <#--</div>-->
   <#--<div class="user_37">-->
      <#--<div><#if '${(rank2.rankUser.ranking)!}'=='1'>-->
          <#--<img src="/images/no1.png">-->
      <#--<#elseif  '${(rank2.rankUser.ranking)!}'=='2'>-->
          <#--<img src="/images/no2.png">-->
      <#--<#elseif '${(rank2.rankUser.ranking)!}'=='3'>-->
          <#--<img src="/images/no3.png">-->
      <#--</#if></div><SPAN>第${(rank2.rankUser.ranking)!}名</SPAN><span>${(rank2.rankUser.userRealName)!}</span>-->
   <#--</div>-->
   <#--<div class="user_37">-->
      <#--<div><#if '${(rank3.rankUser.ranking)!}'=='1'>-->
          <#--<img src="/images/no1.png">-->
      <#--<#elseif  '${(rank3.rankUser.ranking)!}'=='2'>-->
          <#--<img src="/images/no2.png">-->
      <#--<#elseif '${(rank3.rankUser.ranking)!}'=='3'>-->
          <#--<img src="/images/no3.png">-->
      <#--</#if></div><SPAN>第${(rank3.rankUser.ranking)!}名</SPAN><span>${(rank3.rankUser.userRealName)!}</span>-->
   <#--</div>-->
  <#if sanYiHou?exists>
      <#list sanYiHou as rank>
      <div class="user_37">

          <div><#if '${(rank.rankUser.ranking)!}'=='1'>
              <img src="/images/no1.png">
          <#elseif  '${(rank.rankUser.ranking)!}'=='2'>
              <img src="/images/no2.png">
          <#elseif '${(rank.rankUser.ranking)!}'=='3'>
              <img src="/images/no3.png">
              <#else >
              ${(rank.rankUser.ranking)!}
          </#if></div>
          <SPAN>第${(rank.rankUser.ranking)!}名</SPAN>
          <span>${(rank.rankUser.userRealName)!}</span>
      </div>
      </#list>
  </#if>

</body>
</html>
