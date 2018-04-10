<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <link rel="stylesheet" href="/css/dropload.css" type="text/css"/>
    <script type="text/javascript" src="/js/dropload.min.js" ></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
 <script>
   // $(function(){
	//    $('.user_34_1').click(function(){
	// 	   $(this).addClass('checked').siblings().removeClass('checked');
	// 	   })
	// })
 </script>
    <script type="text/javascript">

        $(function () {
            var counter = 0;
            // 每页展示4个
            var num = 4;

            $('.dropload').dropload({
                scrollArea: window,
                domDown: {
                    domClass: "dropload-down",
                    domRefresh: '<div class="dropload-refresh">↑上拉加载更多</div>',
                    domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
                    domNoData: '<div class="dropload-noData">暂无更多数据</div>'
                },
                loadDownFn: function (me) {
                    var result = '';
                    counter++



                    $.ajax({
                        type: 'POST',
                        url: '/c/order/user/myOrderData',
                        data: {
                            page: counter,
                            pageSize: num,
                            status:${status}
                        },
                        dataType: 'json',
                        success: function (data) {

                            var detail = data.data.detail;
                            var pages = data.data.pages;


                            if(pages<=counter){
                                me.lock();
                                // 无数据
                                me.noData();
                                // 无数据
                                $('.dropload').html('<div class="dropload-noData">暂无更多数据</div>');
                            }

                            if (detail.length == 0) {
                                me.lock();
                                // 无数据
                                me.noData();
                                // 无数据
                                $('.dropload').html('<div class="dropload-noData">暂无更多数据</div>');
                            }
                            else {

                                for (var i = 0; i < detail.length; i++) {

                                    result +='<div id="'+detail[i].orderId +'"class="user_35">' + '<div class="user_35_1" onclick=window.location.href="/c/order/detail/'+detail[i].orderId+'">'+'<span>'+ detail[i].orderWineName+'</span>'
                                            +'<span>订单编号：<c>'+detail[i].orderNumber+'</c></span>'
                                            +'<span>申请时间：<c>'+timestampToTime(detail[i].orderAddtime)+'</c></span>';

                                    if(detail[i].orderStatus==${orderPay}){
                                        result +='<img src="/images/dqj.png">';
                                    }else if(detail[i].orderStatus==${orderCancel}){
                                        result +='<img src="/images/yqx.png">';
                                    }else if(detail[i].orderStatus==${orderFinish}){
                                        result +='<img src="/images/ywc.png">';
                                    }else if(detail[i].orderStatus==${orderNotPay}){
                                        result +='<img src="/images/dzf.png">';
                                    }

                                    result +='</div>';
                                    result +='<div class="user_35_2">'
                                            +'<span>购买酒量：<c>'+detail[i].orderTotal+'ml</c></span>'
                                            +'<span>原价：<c style="text-decoration:line-through;">¥'+detail[i].orderPrice+'</c></span>'
                                            +'<span>实付款：<c>¥</c></span><span>'+detail[i].orderRealMoney+'</span>'
                                            if(detail[i].orderSource>=${jiuquan}){
                                                result+='<img src="/images/jiuquan.png">';
                                            }else{
                                                result+='<img src="/images/jiudan.png">';
                                            }

                                            if(detail[i].orderStatus==${orderNotPay}){
                                                result+='<button class="newbtn_3"'+'onclick="pay('+detail[i].orderId+','+detail[i].orderSource+')">立即支付</button>';
                                        result+='<button onclick="cancelOrder('+detail[i].orderId+')" class="newbtn_1"'+detail[i].orderId+'">取消订单</button>';

                                            }else if(detail[i].orderStatus==${orderPay}){
                                                // result+='<button class="user_35_btn4"'+detail[i].orderId+'">售后申请</button>';
                                            }else if(detail[i].orderStatus==${orderFinish}){

                                                if(detail[i].orderSource>=${jiuquan}){
                                                    result+='<button class="newbtn_2"'+detail[i].orderId+'">再次购买</button>';
                                                }
                                                result+='<button class="newbtn_1"'+detail[i].orderId+'">评价</button>';
                                            }else if(detail[i].orderStatus==${orderCancel}){
                                                if(detail[i].orderSource>=${jiuquan}){
                                                    result+='<button class="newbtn_2"'+detail[i].orderId+'">再次购买</button>';
                                                }
                                            }
                                            result+='</div></div>';
                                }

                                if (detail.length < num) {
                                    $('.dropload').hide();
                                }
                                // 为了测试，延迟1秒加载
                                //setTimeout(function(){
                                $('#data').append(result);

                                // 每次数据加载完，必须重置
                                me.resetload();
                                // },1000);
                            }
                        },
                        error: function (xhr, type) {

                            // alert(xhr.status);
                            //alert('Ajax error!');
                            // 即使加载出错，也得重置
                            me.resetload();
                        }
                    });
                }
            });
        });

        function pay(orderId,orderSource){
            if(orderSource==${buy}){
                window.location.href="/charge/index?orderId="+orderId+"&desc=${desc!}";
            }else if(orderSource==${buyStore}){
                window.location.href="/charge/index?orderId="+orderId+"&desc=${descStore!}";
            }else if(orderSource==${userBuyWine}){
                window.location.href="/charge/index?orderId="+orderId+"&desc=${descWine!}";
            }

        }

        function cancelOrder(orderId){
            $.ajax({
                type: 'GET',
                url: '/c/order/cancel/'+orderId,
                dataType: 'json',
                success: function (data) {
                    var code = data.code;
                    var msg = data.msg;
                    if(code == 200){
                        layer.msg(msg);
                        // window.location.go(-1);
                        $("#"+orderId).remove();
                    }else{
                        layer.msg(msg);
                    }
                },
                error : function() {
                    alert("系统错误，请联系管理员！");
                }
            });
        }


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
    </script>
</head>

<body class="body_1">
   <div class="header"><img src="/images/27.png" onclick=window.location.href="/c/user/center/${userId!}"><span>我的消费</span><span onclick= window.location.href="/c/order/afterSale/${userId!}">退款/售后</span></div>
   <#--<div class="user_34">-->
      <#--<div class="user_34_1 checked">全部</div>-->
      <#--<div class="user_34_1">待支付</div>-->
      <#--<div class="user_34_1">已取消</div>-->
      <#--<div class="user_34_1">已完成</div>-->
   <#--</div>-->${orderTop}
   <div id="data">
   <#--<div class="user_13">-->
   <#--<span>现金余额支付</span><span>2017-11-19 10:23:12</span>-->
   <#--<span>现金余额：30.94</span><span>-10.00</span>-->
   <#--</div>-->
   </div>
   <div class="dropload">

   </div>
   <#--<div class="user_35">-->
      <#--<div class="user_35_1">-->
        <#--<span>五粮液股份<c> 纯粮陈窖【52°浓香型】</c></span>-->
        <#--<span>订单编号：<c>6101012017112800000132</c></span>-->
        <#--<span>申请时间：<c>2017-11-29 10:23:12</c></span>-->
        <#--<img src="images/ywc.png">-->
      <#--</div>-->
      <#--<div class="user_35_2">-->
        <#--<span>购买酒量：<c>500ml</c></span>-->
        <#--<span>原价：<c style="text-decoration:line-through;">¥9999</c></span>-->
        <#--<span>实付款：<c>¥</c></span>-->
        <#--<span>3200.12</span>-->
        <#--<img src="images/jiuquan.png">-->
        <#--<button class="user_35_btn1">评价</button>-->
        <#--<button class="user_35_btn2">再次购买</button>-->
      <#--</div>-->
   <#--</div>-->
   <#--<div class="user_35">-->
      <#--<div class="user_35_1">-->
        <#--<span>五粮液股份<c> 纯粮陈窖【52°浓香型】</c></span>-->
        <#--<span>订单编号：<c>6101012017112800000132</c></span>-->
        <#--<span>申请时间：<c>2017-11-29 10:23:12</c></span>-->
        <#--<img src="images/ywc.png">-->
      <#--</div>-->
      <#--<div class="user_35_2">-->
        <#--<span>购买酒量：<c>500ml</c></span>-->
        <#--<span>原价：<c style="text-decoration:line-through;">¥9999</c></span>-->
        <#--<span>实付款：<c>¥</c></span>-->
        <#--<span>3200.12</span>-->
         <#--<img src="images/jiudan.png">-->
        <#--<button class="user_35_btn3">查看订单</button>-->
      <#--</div>-->
   <#--</div>-->
   <#--<div class="user_35">-->
      <#--<div class="user_35_1">-->
        <#--<span>五粮液股份<c> 纯粮陈窖【52°浓香型】</c></span>-->
        <#--<span>订单编号：<c>6101012017112800000132</c></span>-->
        <#--<span>申请时间：<c>2017-11-29 10:23:12</c></span>-->
        <#--<img src="images/dzf.png">-->
      <#--</div>-->
      <#--<div class="user_35_2">-->
        <#--<span>购买酒量：<c>500ml</c></span>-->
        <#--<span>原价：<c style="text-decoration:line-through;display:none">¥9999</c></span>-->
        <#--<span>实付款：<c>¥</c></span>-->
        <#--<span>3200.12</span>-->
        <#--<img src="images/jiuquan.png">-->
        <#--<button class="user_35_btn4">取消订单</button>-->
        <#--<button class="user_35_btn5">立即支付</button>-->
      <#--</div>-->
   <#--</div>-->
</body>
</html>
