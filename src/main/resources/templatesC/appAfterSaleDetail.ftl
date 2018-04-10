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
   function text()
   {
	   var length=$('#abc').val().length;
	   if(length<='200')
	   {
		    $('#zishu').find('c').text(length);
		  }
		else
		{
			var value = $('#abc').val().substring(0,200);
			 $('#abc').val(value);
			 $('#zishu').find('c').text(200);
			
			}
	  
	   
	 
	   
   }
 </script>
</head>

<body class="body_1">
  <div class="header"> <span onclick=window.location.href="/c/order/afterSale/#{userId!}"><</span><span>申请售后服务</span></div>
  <div class="C-user_1">
      <div class="C-user_1_1">
          <span>${order.orderWineName!}</c></span>
          <span>订单编号：<c>${order.orderNumber!}</c></span>
          <span>下单时间：<c>${(order.orderAddtime?number_to_datetime)!}</c></span>
          <#if '${afterService.afterServiceStatus}'='${clz}'>
              <img src="/images/clz.png">
          <#elseif '${afterService.afterServiceStatus}'='${ok}'>
              <img src="/images/ywc.png">
          </#if>
      </div>
      <div class="C-user_1_2">
          <span>购买酒量：<c>${order.orderTotal!}ml</c></span>
          <span><d>实付款： </d>¥<c>${order.orderRealMoney!"0.00"}</c></span>


                <#if '${order.orderSource!}' = '${jiuquan}' >
                <img src="/images/jiuquan.png">
                <#elseif '${order.orderSource!}' = '${jiuquanStore}'>
                <img src="/images/jiuquan.png">
                <#else >
                <img src="/images/jiudan.png">
                </#if>
          <button class="C-user_1_btn1" onclick=window.location.href="/c/order/detail/${order.orderId}">查看订单</button>
      </div>
  </div>
   <div class="user_46"><span>服务类型</span>
       <#if '${money}'='${afterService.afterServiceType!}'>
       <span>退款</span>
       <#elseif '${wine}'='${afterService.afterServiceType!}'>
       <span>退酒</span>
       </#if>

   </div>
   <div class="user_47">
      <span>服务类型</span>
      <textarea id="abc" oninput="text()" readonly="readonly" >${afterService.afterServiceContent!}</textarea>
      <span id="zishu"><c>0</c>/200</span>
   </div>
   <div class="user_48">
      <span>售后处理结果</span>
      <span>处理时间：${(afterService.afterServiceEndtime?number_to_datetime)!}</span>
      <textarea disabled="disabled">${afterService.afterServiceResult!}</textarea>
      </div>
</body>
</html>
