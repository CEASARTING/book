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
 <script type="text/javascript">
     $(function(){
         $('.C-user_0_1').click(function(){
             $(this).addClass('checked').siblings().removeClass('checked');
             if($(this).attr('id')=='a')
             {
                 $('#aaa').css('display','block');
                 $('#bbb').css('display','none');
             }
             else
             {
                 $('#bbb').css('display','block');
                 $('#aaa').css('display','none');
             }
         })



         $('#d').click(function(){
             $('.zhebiceng').css('display','none');
             $('.C-user_5').hide();
         })
         $('#e').click(function(){
             $('.zhebiceng').css('display','none');
             $('.C-user_5').hide();
         })
     })
 </script>
    <script type="text/javascript">
        function alerts(id){
            $('.zhebiceng').css('display','block');
            $('.C-user_5').show();
            $("#e").val(id);
        }
        function update(){
            $.ajax({
                type: 'get',
                dataType: 'json',
                async: false,
                url: "/c/order/afterSale/record",
                success: function (data) {
                    var code = data.code;
                    var msg = data.msg;
                    var detail = data.data.detail;
                    if(code==200){
                        var result = "";
                        for (var i = 0; i < detail.length; i++) {
                            result +='<div class="C-user_4"><span>服务编号：<c>'+detail[i].autowineAfterService.afterServiceNumber
                                    +'</c></span><span>';
                            if(${ing}==detail[i].autowineAfterService.afterServiceStatus){
                                result +='处理中</span><span>申请时间：<c>';
                            }else if(${ok}==detail[i].autowineAfterService.afterServiceStatus){
                                result +='已完成</span><span>申请时间：<c>';
                            }
                            result+=timestampToTime(detail[i].autowineAfterService.afterServiceStarttime);
                            result+='</c></span></div>';


                            result +='<div class="C-user_1" >' + '<div class="C-user_1_1">'+'<span>'+ detail[i].order.orderWineName+'</span>'
                                    +'<span>订单编号：<c>'+detail[i].order.orderNumber+'</c></span>'
                                    +'<span>申请时间：<c>'+timestampToTime(detail[i].order.orderAddtime)+'</c></span>';

                            if(detail[i].order.orderStatus==${orderPay}){
                                result +='<img src="/images/dqj.png">';
                            }else if(detail[i].order.orderStatus==${orderCancel}){
                                result +='<img src="/images/yqx.png">';
                            }else if(detail[i].order.orderStatus==${orderFinish}){
                                result +='<img src="/images/ywc.png">';
                            }else if(detail[i].order.orderStatus==${orderNotPay}){
                                result +='<img src="/images/dzf.png">';
                            }

                            result +='</div>';
                            result +='<div class="C-user_1_2">'
                                    +'<span>购买酒量：<c>'+detail[i].order.orderTotal+'ml</c></span>'

                                    +'<span><d>实付款：</d>¥<c>'+detail[i].order.orderRealMoney+'</c></span>'
                            if(detail[i].order.orderSource>=${jiuquan}){
                                result+='<img src="/images/jiuquan.png">';
                            }else{
                                result+='<img src="/images/jiudan.png">';
                            }

                            if(${ing}==detail[i].autowineAfterService.afterServiceStatus){
                                result+='  <button id="abc" class="C-user_1_btn3" onclick="alerts('+detail[i].autowineAfterService.afterServiceId+')">撤销申请</button>';
                                result +='<button class="C-user_1_btn4" ' +
                                        'onclick=window.location.href="/c/order/afterSale/detail/'+detail[i].autowineAfterService.afterServiceId+'">查看申请</button>';
                            }else if(${ok}==detail[i].autowineAfterService.afterServiceStatus){

                                result +='<button class="C-user_1_btn4" ' +
                                        'onclick=window.location.href="/c/order/afterSale/detail/'+detail[i].autowineAfterService.afterServiceId+'">查看申请</button>';
                            }


                            result+='</div></div>';

                            $("#bbb").html(result);

                        }
                    }else{
                        alert(msg);
                    }

                }
        });}

        function timestampToTime(timestamp) {
            var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            Y = date.getFullYear() + '-';
            M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
            D = date.getDate() + ' ';
            h = date.getHours() + ':';
            m = date.getMinutes() + ':';
            s = date.getSeconds();
            return Y+M+D+h+m+s;
        }

        function deletes(){
            $.ajax({
                type: 'get',
                dataType: 'json',
                async: false,
                url: "/c/order/afterSale/delete/"+$("#e").val(),
                success: function (data) {
                    var code = data.code;
                    var msg = data.msg;
                    // var detail = data.data.detail;
                    if(code==200){
                        // layer.alert(msg);
                        window.location.href="/c/order/afterSale/${userId}";
                    }else{
                        layer.alert(msg);
                    }

                }
            });
        }
    </script>

</head>

<body class="body_1">
   <div class="header"> <img src="/images/27.png" onclick=window.location.href="/c/order/myOrder/${ALL}"><span>申请售后服务</span></div>
   <div class="C-user_0">
      <div class="C-user_0_1 checked" id="a">申请售后</div>
      <div class="C-user_0_1" id="b" onclick="update()">申请记录</div>
   </div>
   <div id="aaa">


        <#if orders?exists>
            <#list orders as order>
            <div class="C-user_1">
            <div class="C-user_1_1">
            <span>${order.orderWineName!}</c></span>
            <span>订单编号：<c>${order.orderNumber!}</c></span>
            <span>下单时间：<c>${(order.orderAddtime?number_to_datetime)!}</c></span>
            <#--<img src="images/ywc.png">-->
                <#if '${order.orderStatus!}'= '${orderPay}'>
                <img src="/images/dqj.png">
                    <#elseif '${order.orderStatus!}'='${orderCancel}'>
                <img src="/images/yqx.png">
                    <#elseif '${order.orderStatus!}'='${orderFinish}'>
                <img src="/images/ywc.png">
                    <#elseif '${order.orderStatus!}'='${orderNotPay}'>
                <img src="/images/dzf.png">
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
            <button class="C-user_1_btn1" onclick=window.location.href="/c/order/afterSalePage/${order.orderId!}">申请售后</button>
            </div>
            </div>
            </#list>
        </#if>
    </div>
    <div id="bbb" style="display:none">
        <#--<div class="C-user_4">-->
         <#--<span>服务编号：<c>F61010120171128000001321</c></span><span>处理中</span>-->
         <#--<span>申请时间：<c>2017-11-29 11:12:13</c></span>-->
        <#--</div>-->
        <#--<div class="C-user_1">-->
          <#--<div class="C-user_1_1">-->
            <#--<span>五粮液股份<c> 纯粮陈窖【52°浓香型】</c></span>-->
            <#--<span>订单编号：<c>6101012017112800000132</c></span>-->
            <#--<span>下单时间：<c>2017-11-29 10:23:12</c></span>-->
            <#--<img src="/images/ywc.png">-->
          <#--</div>-->
          <#--<div class="C-user_1_2">-->
            <#--<span>购买酒量：<c>500ml</c></span> -->
            <#--<span><d>实付款： </d>¥<c>3200.12</c></span>-->
            <#--<img src="/images/jiudan.png">-->
            <#--<button id="abc" class="C-user_1_btn3">撤销申请</button>-->
            <#--<button class="C-user_1_btn4">查看申请</button>-->
          <#--</div>-->
       <#--</div>-->
       <#--<div class="C-user_4">-->
         <#--<span>服务编号：<c>F61010120171128000001321</c></span><span>已完成</span>-->
         <#--<span>申请时间：<c>2017-11-29 11:12:13</c></span>-->
        <#--</div>-->
        <#--<div class="C-user_1">-->
          <#--<div class="C-user_1_1">-->
            <#--<span>五粮液股份<c> 纯粮陈窖【52°浓香型】</c></span>-->
            <#--<span>订单编号：<c>6101012017112800000132</c></span>-->
            <#--<span>下单时间：<c>2017-11-29 10:23:12</c></span>-->
            <#--<img src="/images/ywc.png">-->
          <#--</div>-->
          <#--<div class="C-user_1_2">-->
            <#--<span>购买酒量：<c>500ml</c></span> -->
            <#--<span><d>实付款： </d>¥<c>3200.12</c></span>-->
            <#--<img src="/images/jiudan.png">-->
            <#--<button class="C-user_1_btn4">查看申请</button>-->
          <#--</div>-->
       <#--</div>-->
    </div>
    <div class="C-user_5">
       <span>亲，请确认是否撤销售后申请？</span>
       <button id="d">取消</button><button id="e" onclick="deletes()">确认</button>
    </div>
    <div class="zhebiceng"></div>
</body>


</html>
