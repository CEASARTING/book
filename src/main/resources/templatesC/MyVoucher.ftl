<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
  <script>
   $(function(){
	   $('.user_12_1').click(function(){
		   
		   $(this).addClass('checked').siblings().removeClass('checked');
		   if($(this).text()=="可使用")
		   {
			   $('#aaa').css('display','block');
			   $('#bbb').css('display','none');
			   $('#ccc').css('display','none');
		   }
		   else if($(this).text()=="已使用")
		   {
			   $('#bbb').css('display','block');
			   $('#aaa').css('display','none');
			   $('#ccc').css('display','none');
		   }
		   else
		   {
			   $('#ccc').css('display','block');
			   $('#bbb').css('display','none');
			   $('#aaa').css('display','none');
			}
		   })
	})
 </script>
</head>

<body class="body_1">
  <div class="header"><img src="/images/27.png" onclick=window.location.href="/c/user/center/${userId}"><span>我的优惠</span><span>兑换优惠码</span></div>
  <div class="user_12">
      <div class="user_12_1 checked">可使用</div>
      <div class="user_12_1">已使用</div>
      <div class="user_12_1">已过期</div>
   </div>
   <div id="aaa" style="width:100%; height:auto;background: #F7F4EC;padding-bottom:0.2rem;overflow:hidden">
     <#--<div class="user_30">-->
        <#--<div class="user_30_1"><span>¥<b>320</b></span><span>满1000可用</span></div>-->
        <#--<div class="user_30_2"><span>酒单抵用券</span><span>有效期至：2018-02-28</span><span>限品类：不限制</span><span>限门店：不限制</span></div>-->
     <#--</div>-->
     <#--<div class="user_30">-->
        <#--<div class="user_30_1"><span>¥<b>320</b></span><span>满1000可用</span></div>-->
        <#--<div class="user_30_2"><span>酒单抵用券</span><span>有效期至：2018-02-28</span><span>限品类：不限制</span><span>限门店：不限制</span></div>-->
     <#--</div>-->
     <#--<div class="user_30">-->
        <#--<div class="user_30_1"><span>¥<b>320</b></span><span>满1000可用</span></div>-->
        <#--<div class="user_30_2"><span>酒单抵用券</span><span>有效期至：2018-02-28</span><span>限品类：不限制</span><span>限门店：不限制</span></div>-->
     <#--</div>-->
       <#if list??>
           <#list list as voucher>
           <div class="user_30">
           <div class="user_30_1">
               <span>¥<b>${(voucher.voucherMoney)!}</b></span>
               <#if 'VoucherMin'=='${(voucher.voucherIfMin)!}'>
                   <span>满${(voucher.voucherMin)!}可用</span>
               </#if>
           </div>
           <div class="user_30_2"><span>${(voucher.voucherName)!}</span>
               <span>有效期至：
                   <#if '${(voucher.voucherIfTerm)!}'='${VoucherTermOn!}'>
                       ${(voucher.voucherEndtime?number_to_date)!}
                   <#else >
                   永久
                   </#if>
               </span>
               <span>限品类：
                    <#if '${(voucher.voucherIfWine)!}'='${VoucherLimitWine!}'>
                   限制
                    <#else >
                   无限制
                    </#if>
                  </span>
               <span>限门店： <#if '${(voucher.voucherIfStore)!}'='${VoucherLimitStore!}'>
                   限制
               <#else >
                   无限制
               </#if></span></div>
           </div>
           </#list>
       </#if>
   </div>
   <div id="bbb" style="width:100%; height:auto; display:none;background: #F7F4EC;padding-bottom:0.2rem; overflow:hidden">
       <#if list1??>
           <#list list1 as voucher>
           <span class="user_32">兑换时间：${(voucher.voucherUsetime?number_to_datetime)!}</span>
           <div class="user_31">
               <div class="user_31_1">
                   <span>¥<b>${(voucher.voucherMoney)!}</b></span>
               <#if 'VoucherMin'=='${(voucher.voucherIfMin)!}'>
                   <span>满${(voucher.voucherMin)!}可用</span>
               </#if>
               </div>
               <div class="user_31_2"><span>${(voucher.voucherName)!}</span>
                   <span>有效期至：
                   <#if '${(voucher.voucherIfTerm)!}'='${VoucherTermOn!}'>
                       ${(voucher.voucherEndtime?number_to_date)!}
                   <#else >
                   永久
                   </#if>
               </span>
                   <span>限品类：
                    <#if '${(voucher.voucherIfWine)!}'='${VoucherLimitWine!}'>
                   限制
                    <#else >
                   无限制
                    </#if>
                  </span>
                   <span>限门店： <#if '${(voucher.voucherIfStore)!}'='${VoucherLimitStore!}'>
                   限制
                   <#else >
                   无限制
                   </#if></span></div>
           </div>
           </#list>
       </#if>
      <#--<div class="user_31">-->
        <#--<div class="user_31_1"><span>¥<b>320</b></span><span>500ml</span></div>-->
        <#--<div class="user_31_2"><span>酒单抵用券</span><span>有效期至：2018-02-28</span><span>限品类：不限制</span><span>限门店：不限制</span></div>-->
     <#--</div>-->
     <#--<div class="user_31">-->
        <#--<div class="user_31_1"><span>¥<b>320</b></span><span>500ml</span></div>-->
       <#--<div class="user_31_2"><span>酒单抵用券</span><span>有效期至：2018-02-28</span><span>限品类：不限制</span><span>限门店：不限制</span></div>-->
     <#--</div>-->
   </div>
   <div id="ccc" style="width:100%; height:auto;display:none;background: #F7F4EC;padding-bottom:0.2rem;overflow:hidden">
     <#--<div class="C-user_14">-->
        <#--<div class="C-user_14_1"><span>¥<b>320</b></span><span>500ml</span></div>-->
        <#--<div class="C-user_14_2"><span>五粮液股份</span><span>纯粮陈窖【52度浓香型】</span><span>取酒码:976 876</span><span>有效期至：2018-02-28</span></div>-->
     <#--</div>-->
        <#if list2??>
            <#list list2 as voucher>
           <div class="C-user_14">
               <div class="C-user_14_1">
                   <span>¥<b>${(voucher.voucherMoney)!}</b></span>
               <#if 'VoucherMin'=='${(voucher.voucherIfMin)!}'>
                   <span>满${(voucher.voucherMin)!}可用</span>
               </#if>
               </div>
               <div class="C-user_14_2"><span>${(voucher.voucherName)!}</span>
                   <span>有效期至：
                   <#if '${(voucher.voucherIfTerm)!}'='${VoucherTermOn!}'>
                       ${(voucher.voucherEndtime?number_to_date)!}
                   <#else >
                   永久
                   </#if>
               </span>
                   <span>限品类：
                    <#if '${(voucher.voucherIfWine)!}'='${VoucherLimitWine!}'>
                   限制
                    <#else >
                   无限制
                    </#if>
                  </span>
                   <span>限门店： <#if '${(voucher.voucherIfStore)!}'='${VoucherLimitStore!}'>
                   限制
                   <#else >
                   无限制
                   </#if></span></div>
           </div>
            </#list>
        </#if>
    
     
   </div>
</body>
</html>
