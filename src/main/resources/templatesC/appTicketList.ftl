<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>酒券列表</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <link rel="stylesheet" href="/css/dropload.css" type="text/css"/>
    <script type="text/javascript" src="/js/dropload.min.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
<script>
    var factoryId = -1 ;
    $(function(){

        var counter = 0;
        // 每页展示4个
        var num = 1;
	    $('#list>span').click(function(){
		    $(this).addClass('wineList_checked').siblings().removeClass('wineList_checked');
            var value = $(this).attr("id");
            if(value!=$("#factory").val()){

                $("#data").html("");
                $("#factory").val(value);
                factoryId = value;
                datas();
            }

		});




        <#--$('.dropload').dropload({-->
            <#--scrollArea: window,-->
            <#--domDown: {-->
                <#--domClass: "dropload-down",-->
                <#--domRefresh: '<div class="dropload-refresh">↑上拉加载更多</div>',-->
                <#--domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>',-->
                <#--domNoData: '<div class="dropload-noData">暂无更多数据</div>'-->
            <#--},-->
            <#--loadDownFn: function (me) {-->
                <#--var result = '';-->
                <#--counter++-->
                <#--$.ajax({-->
                    <#--type: 'POST',-->
                    <#--url: '/c/ticket/listData/'+factoryId,-->
                    <#--data: {-->
                        <#--page: counter,-->
                        <#--pageSize: num,-->
                    <#--},-->
                    <#--dataType: 'json',-->
                    <#--success: function (data) {-->

                        <#--var detail = data.data.detail;-->
                        <#--var pages = data.data.pages;-->


                        <#--if(pages<=counter){-->
                            <#--me.lock();-->
                            <#--// 无数据-->
                            <#--me.noData();-->
                            <#--// 无数据-->
                            <#--$('.dropload').html('<div class="dropload-noData">暂无更多数据</div>');-->
                        <#--}-->

                        <#--if (detail.length == 0) {-->
                            <#--me.lock();-->
                            <#--// 无数据-->
                            <#--me.noData();-->
                            <#--// 无数据-->
                            <#--$('.dropload').html('<div class="dropload-noData">暂无更多数据</div>');-->
                        <#--}-->
                        <#--else {-->

                            <#--for (var i = 0; i < detail.length; i++) {-->
                                <#--result+=' <div class="C-user_18">';-->
                                <#--result+='<div class="C-user_18_1"><span>¥<b>'+detail[i].ticketGive.ticketGiveMoney+'</b></span><span>'+detail[i].ticketGive.ticketGiveWineAmount+'ml</span></div>';-->
                                <#--result+='<div class="C-user_18_2">';-->
                                <#--result+='<span>'+detail[i].wine.wineFactory+'</span><span>'+detail[i].wine.wineClass+'【'+detail[i].wine.wineDgree+'度'+'detail[i].wineType.dictValue'+'】</span>';-->
                                <#--result+='<span>原价 <s>¥150</s></span><span>有效期:';-->
                                <#--if(detail[i].ticketGive.ticketGiveEffectType==${notLimit}){-->
                                    <#--result+='无限制';-->
                                <#--}else if(detail[i].ticketGive.ticketGiveEffectType==${limitDate}){-->
                                    <#--result+='至'+timestampToTime(detail[i].ticketGive.ticketGiveEndtime);-->
                                <#--}else if(detail[i].ticketGive.ticketGiveEffectType==${limitDays}){-->
                                    <#--result+=detail[i].ticketGive.ticketGiveEffectTime+'ticketGiveEffectTime';-->
                                <#--}-->
                                <#--result+='</span><button class="wineList_3">点击购买</button></div></div>';-->
                            <#--}-->

                            <#--if (detail.length < num) {-->
                                <#--$('.dropload').hide();-->
                            <#--}-->
                            <#--// 为了测试，延迟1秒加载-->
                            <#--//setTimeout(function(){-->
                            <#--$('#data').append(result);-->

                            <#--// 每次数据加载完，必须重置-->
                            <#--me.resetload();-->
                            <#--// },1000);-->
                        <#--}-->
                    <#--},-->
                    <#--error: function (xhr, type) {-->

                        <#--// alert(xhr.status);-->
                        <#--//alert('Ajax error!');-->
                        <#--// 即使加载出错，也得重置-->
                        <#--me.resetload();-->
                    <#--}-->
                <#--});-->
            <#--}-->
        <#--});-->
	})

    function datas(){
        $.ajax({
            type: 'POST',
            url: '/c/ticket/listData/'+factoryId,
            dataType: 'json',
            success: function (data) {
                var result = '';
                var detail = data.data.detail;
                for (var i = 0; i < detail.length; i++) {
                    result+=' <div class="C-user_18">';
                    result+='<div class="C-user_18_1"><span>¥<b>'+detail[i].ticketGive.ticketGiveRealmoney+'</b></span><span>'+detail[i].ticketGive.ticketGiveWineAmount+'ml</span></div>';
                    result+='<div class="C-user_18_2">';
                    result+='<span>'+detail[i].wine.wineFactory+'</span><span>'+detail[i].wine.wineClass+'【'+detail[i].wine.wineDegree+'度'+detail[i].wineType.dictName+'】</span>';
                    result+='<span>原价 <s>¥'+detail[i].ticketGive.ticketGiveMoney+'</s></span><span>有效期:';
                    if(detail[i].ticketGive.ticketGiveEffectType==${notLimit}){
                        result+='无限制';
                    }else if(detail[i].ticketGive.ticketGiveEffectType==${limitDate}){
                        result+='至'+timestampToTime(detail[i].ticketGive.ticketGiveEndtime);
                    }else if(detail[i].ticketGive.ticketGiveEffectType==${limitDays}){
                        result+=+detail[i].ticketGive.ticketGiveEffectTime+'天';
                    }
                    result+='</span><button class="wineList_3" onclick=window.location.href="/c/order/buyTicket/'+detail[i].ticketGive.ticketGiveId+'">点击购买</button></div></div>';
                }
                $('#data').html(result);

            },
            error: function (xhr, type) {

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
    return Y+M+D;
}
</script>
</head>

<body class="body_3" onload="datas()" >
    <input type="hidden" id="factory" value="-1"/>
  <div class="wineList">
     <div class="wineList_1" id="list">
        <span class="wineList_checked" id="-1">全部</span>
        <#if wines??>
            <#list wines as wine>
                <span id="${wine.wineFactoryId!}">${wine.wineFactory!}</span>
            </#list>
        </#if>
        <div class="clear"></div>
     </div>
  </div>
  <div class="wineList_2" id="data">
  </div>
</body>
</html>
