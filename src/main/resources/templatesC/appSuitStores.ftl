<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>门店查询</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
    <script type="text/javascript">
        wx.config({
            debug: false,
            appId:"${map.appId}",
            timestamp: "${map.timestamp}",
            nonceStr: "${map.nonceStr}",
            signature: "${map.signature}",
            jsApiList: [
                'getLocation'
            ]
        });
        wx.ready(function () {
            wx.getLocation({
                type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                success: function (res) {
                    var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                    var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                    StoreData(${storesStr!},latitude,longitude);

                },
                cancel: function (res) {
                    StoreData(${storesStr!},null,null);
                }
            });
        });

        function StoreData(StoresStr,latitude,longitude){
            $.ajax({
                type: 'GET',
                url: '/c/store/suitStore/data',
                data: {
                    storesStr:StoresStr,
                    userHorizontal:latitude,
                    userVertical:longitude
                },
                dataType: 'json',
                success: function (data){

                    var code = data.code;
                    var msg = data.msg;
                    var stores = data.data.stores;

                    if(code==200){
                        refreshData(stores);
                    }
                },
                error: function (xhr, type) {

                }
            });
        }

        function refreshData(stores){
            var resultHtml = '';
            for(var i = 0;i<stores.length;i++) {  //循环LIST
                var store = stores[i];//获取LIST里面的对象

                resultHtml +='<div class="SelectShop_6" onclick=window.location.href="/c/store/detailFromSuit/'+store.store.storeId+'"'+'>'+'<img src="/'+store.store.storeThumbnail+'" class="SelectShop_6_1">';
                resultHtml +='  <span class="SelectShop_6_2">'+store.store.storeName+'</span>';
                var str = store.store.storeManageDesc!=null?store.store.storeManageDesc:"";
                resultHtml +='<span class="SelectShop_6_3">'+str+'</span>';
                resultHtml +='<span class="SelectShop_6_4"><img src="/images/select_tubiao.png">';
                if(store.distance==null){
                    resultHtml +='</span>';
                }else if(store.distance<500){
                    resultHtml +='&lt;500m</span>';
                }else if(store.distance<1000){
                    resultHtml +='&lt;1000m</span>';
                }else{
                    resultHtml +='&gt;1000m</span>';
                }
                resultHtml +='<div class="SelectShop_6_5"></div>';
                resultHtml +='<div class="SelectShop_6_6"><img src="/images/wyl_icon.png" class="SelectShop_wly"><img src="/images/lzlj.png" class="SelectShop_lzlj"><img src="/images/mt.png" class="SelectShop_mt"></div>';
                resultHtml +='</div>';

            }
            $("#data").html(resultHtml);
        }
    </script>
</head>

<body class="body_3" id="data">
 <#--<div class="SelectShop_6" id="data">-->
   <#--<img src="images/longxia.png" class="SelectShop_6_1">-->
   <#--<span class="SelectShop_6_2">竹园村火锅（高新四路店）</span>-->
   <#--<span class="SelectShop_6_3">火锅 | ¥68/人</span>-->
   <#--<span class="SelectShop_6_4"><img src="images/select_tubiao.png"><500m</span>-->
   <#--<div class="SelectShop_6_5"></div>-->
   <#--<div class="SelectShop_6_6">-->
      <#--<img src="images/wyl_icon.png" class="SelectShop_wly">-->
      <#--<img src="images/lzlj.png" class="SelectShop_lzlj">-->
      <#--<img src="images/mt.png" class="SelectShop_mt">-->
   <#--</div>-->
 <#--</div>-->
 <#--<div class="SelectShop_6">-->
   <#--<img src="images/longxia.png" class="SelectShop_6_1">-->
   <#--<span class="SelectShop_6_2">竹园村火锅（高新四路店）</span>-->
   <#--<span class="SelectShop_6_3">火锅 | ¥68/人</span>-->
   <#--<span class="SelectShop_6_4"><img src="images/select_tubiao.png"><500m</span>-->
   <#--<div class="SelectShop_6_5"></div>-->
   <#--<div class="SelectShop_6_6">-->
      <#--<img src="images/wyl_icon.png" class="SelectShop_wly">-->
      <#--<img src="images/lzlj.png" class="SelectShop_lzlj">-->
      <#--<img src="images/mt.png" class="SelectShop_mt">-->
   <#--</div>-->
 <#--</div>-->
 <#--<div class="SelectShop_6">-->
   <#--<img src="images/longxia.png" class="SelectShop_6_1">-->
   <#--<span class="SelectShop_6_2">竹园村火锅（高新四路店）</span>-->
   <#--<span class="SelectShop_6_3">火锅 | ¥68/人</span>-->
   <#--<span class="SelectShop_6_4"><img src="images/select_tubiao.png"><500m</span>-->
   <#--<div class="SelectShop_6_5"></div>-->
   <#--<div class="SelectShop_6_6">-->
      <#--<img src="images/wyl_icon.png" class="SelectShop_wly">-->
      <#--<img src="images/lzlj.png" class="SelectShop_lzlj">-->
      <#--<img src="images/mt.png" class="SelectShop_mt">-->
   <#--</div>-->
 <#--</div>-->
</body>
</html>













