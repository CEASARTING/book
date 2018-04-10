<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>门店查询</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
    <script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>


    <script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>


    <script type="text/javascript">
        var city = '${defaultCity}';
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

                    $("#longitude").val(longitude);
                    $("#latitude").val(latitude);



                    var speed = res.speed; // 速度，以米/每秒计
                    var accuracy = res.accuracy; // 位置精度

                    var locationa = latitude+','+longitude;

                        $.ajax({
                            type : 'get',
                            url : 'http://apis.map.qq.com/ws/geocoder/v1',
                            dataType:'jsonp',
                            data : {
                                key:"QEPBZ-LQHW4-476UC-X7WAY-MHRT5-K7BZM",
                                get_poi:"1",//是否返回周边POI列表：1.返回；0不返回(默认)
                                coord_type:"1",//输入的locations的坐标类型,1 GPS坐标
                                parameter:{"scene_type":"tohome","poi_num":20},//附加控制功能
                                output:"jsonp",
                                location:locationa//位置坐标
                            },
                            success : function(data, textStatus) {
                                if(data.status == 0){
                                    var address = data.result.address_component.city;
                                    StoreData(address,latitude,longitude);
                                }else {
                                    alert("系统错误，请联系管理员！")
                                }
                            },
                            error : function() {
                                alert("系统错误，请联系管理员！")
                            }
                        });
                },
                cancel: function (res) {
                    $("#longitude").val(null);
                    $("#latitude").val(null);
                    StoreData(city,null,null);
                }
            });
        });



        function StoreData(city,userHorizontal,userVertical){
            $.ajax({
                type: 'GET',
                url: '/c/store/query/data',
                data: {
                    city:city,
                    storeName:$("#storeName").val(),
                    userHorizontal:userHorizontal,
                    userVertical:userVertical
                },
                dataType: 'json',
                success: function (data){
                    var code = data.code;
                    var msg = data.msg;
                    var stores = data.data.stores;
                    var cityName = data.data.city;

                    if(code==200){
                        refreshData(stores,cityName);
                    }else if(code==201){
                        refreshData(stores,cityName);
                        layer.msg(msg);
                    }
                },
                error: function (xhr, type) {

                }
            });
        }

        function refreshData(stores,cityName){
            var resultHtml = '';
            for(var i = 0;i<stores.length;i++) {  //循环LIST
                var store = stores[i];//获取LIST里面的对象

                resultHtml +='<div class="SelectShop_6" onclick=window.location.href="/c/store/detail/'+store.store.storeId+'"'+'>'+'<img src="/'+store.store.storeThumbnail+'" class="SelectShop_6_1">';
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
            $("#city").text(cityName);
        }
    </script>
</head>

<body class="body_3" id="body" >
  <div  class="SelectShop"><div class="SelectShop_1" id="city">${defaultCity}</div><input type="text" id="storeName"class="SelectShop_2" placeholder="搜索酒品名称"/>
      <img src="/images/select.png" class="SelectShop_3" onclick="StoreData($('#city').text())" >

 <!-- /* <img src="/images/SelectShop_jiu.png" class="SelectShop_4">*/-->
      <input type="hidden" id="latitude"/>
      <input type="hidden" id="longitude"/>
  </div>
  <div id="container" style="display: none"></div>
  <script src="/js/jquery.selector-px.js"></script>
  <script>
      $.scrEvent({
          data: [${data}],   //数据
          //data: ['全国', '上海市', '苏州市', '杭州市', '南京市', '武汉市', '深圳市', '北京市','乌鲁木期'],   //数据
          evEle: '#city',            //选择器
          title: '切换城市',            // 标题
          defValue: '全国',             // 默认值
          afterAction: function (data) {   //  点击确定按钮后,执行的动作
              StoreData(data,$("#latitude").val(),$("#longitude").val());
          }
      });
  </script>
  <div style="height: auto;width: 100%" id="data"></div>

</body>
</html>

