<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本店管理</title>

<link rel="stylesheet" href="/css/main.css" type="text/css"/>
    <link rel="stylesheet" href="/css/dropload.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/dropload.min.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
    <script type="text/javascript">

        $(function () {
            var counter = 0;
            // 每页展示4个
            var num = 10;
            var storeId = ${store.storeId};

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
                        url: '/store/creditDetailData',
                        data: {
                            page: counter,
                            pageSize: num,
                            storeId: storeId
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

                                    var actionType = "+";
                                    if(detail[i].detailType==2)
                                    {
                                        actionType = "-";
                                    }

                                    result += '<div class="user_13">'
                                            + '<span>' + detail[i].detailDesc + '</span><span>' + timestampToTime(detail[i].detailAddtime) + '</span>'
                                            + '<span>授信余额：' + detail[i].detailRemain + '</span><span>' + actionType+detail[i].detailMoney + '</span></div>';

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
   <div class="header"><img onclick=window.location.href="/store/credit/${storeId}" src="/images/27.png"><span>明细</span> </div>
   <div id="data">

   </div>
   <div class="dropload">

   </div>
<#--<#list detailList as detail>-->
    <#--<div class="user_13">-->
        <#--<div class="user_13">-->
            <#--<span>${detail.detailDesc}</span><span>${detail.detailAddtime?number_to_datetime}</span>-->
            <#--<span>授信余额：${detail.detailRemain}</span><span><#if detail.detailType==IN>+<#else >-</#if>${detail.detailMoney}</span>-->
        <#--</div>-->
    <#--</div>-->
<#--</#list>-->

   <#--<div class="user_13">-->
     <#--<span>现金余额支付</span><span>2017-11-19 10:23:12</span>-->
     <#--<span>现金余额：30.94</span><span>-10.00</span>-->
   <#--</div>-->
   <#--<div class="user_13">-->
     <#--<span>授信余额支付</span><span>2017-11-19 10:23:12</span>-->
     <#--<span>现金余额：930.94</span><span>-900.00</span>-->
   <#--</div>-->
   <#--<div class="user_13">-->
     <#--<span>还款至授信余额</span><span>2017-11-19 10:23:12</span>-->
     <#--<span>现金余额：30.94</span><span>-10.00</span>-->
   <#--</div>-->
</body>
</html>
