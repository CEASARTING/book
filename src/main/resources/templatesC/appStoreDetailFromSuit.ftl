<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>门店详情</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
    <link type="text/css" href="/layui/css/layui.css" rel="stylesheet"/>
    <script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/main_1.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>


<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();

        function map() {
            layer.open({
                type: 2,
                shadeClose: false, //开启遮罩关闭
                area: ['450px', '450px'],
                scrollbar: false,
                content:"/Caddress_search.html",
                title:'地图'
            });
        }
 </script>
</head>

<body class="body_3">
  <div class="mdyq_top">
    <div style="position:absolute;z-index:2;width:100%;"><div class="yj_dh"><img src="/images/27.png" onclick="javascript:history.go(-1);"><span >${(store.storeName)!}</span><img src="/images/jct.png"></div></div>
    <div id="mdyqt_00">
        <div class="layui-carousel" id="test1">
            <div carousel-item>
            <#if urls??>
                <#list urls as url>
                    <div class="num"><img src='/${url}'></div>
                </#list>
            </#if>
            </div>
        </div>
        <script src="/layui/layui.js"></script>
        <script>
            layui.use('carousel', function(){
                var carousel = layui.carousel;
                //建造实例
                carousel.render({
                    elem: '#test1'
                    ,width: '100%' //设置容器宽度
                    ,height:'100%'
                    ,arrow: 'none' //始终显示箭头
                    //,anim: 'updown' //切换动画方式
                });

            });
        </script>
   </div>
    <div class="mdyqt_0"><span>1</span>/<c>4</c></div>
  </div>
  <div class="mdyqt_2">
    <span class="mdyqt_2_1">${(store.storeName)!}</span>
    <span class="mdyqt_2_2">${(store.storeManageDesc)!}</span>
    <img src="/images/ddh.png" class="mdyqt_2_3" onclick=window.location.href="tel:${(store.storeLinkmanPhone)!}">
    <hr class="mdyqt_2_4"/>
    <img class="mdyqt_2_5" src="/images/dizhi.png" onclick="map()"><span class="mdyqt_2_6" onclick="map()" id="address">${(store.storeAddressDetail)!}</span><img class="mdyqt_2_7" src="/images/gengduo.png" onclick="map()">
  </div>
  <#--<div class="mdyqt_3" d>-->
    <#--<img src="/images/tuijian.png"><span>推荐菜</span><span>麻辣小龙虾 猪蹄 酱鸭 菌锅汤...</span><img src="/images/gengduo.png">-->
  <#--</div>-->
  <#--<div id="mdyqt_4">-->
        <#--<div id="mdyqt_4_0" style="top:0.3rem;">-->
           <#--<div style="margin-left:0.3rem" id="mdyqt_4_1"><img  src="/images/longxia.png"><span>麻辣小龙虾</span></div>-->
           <#--<div id="mdyqt_4_1"><img src="/images/zhuti.png"><span>猪蹄</span></div>-->
           <#--<div id="mdyqt_4_1"><img src="/images/longxia.png"><span>羊肉</span></div>-->
           <#--<div id="mdyqt_4_1"><img src="/images/zhuti.png"><span>麻辣小龙虾</span></div>-->
           <#--<div id="mdyqt_4_1"><img src="/images/tj_mr.png"><span>羊肉</span></div>-->
        <#--</div>-->
  <#--</div>-->
  <div class="mdyqt_3"><img src="/images/jplb.png"><span>酒品列表</span></div>
  <#--<div class="mdyqt_5">-->
    <#--<img class="mdyqt_5_1" src="/images/wly.png">-->
    <#--<span class="mdyqt_5_2">纯酿陈窖【52浓香型白酒】</span>-->
    <#--<span class="mdyqt_5_3">¥ 35<c>/50ml</c></span>-->
    <#--<span class="mdyqt_5_4">余量：500ml</span>-->
  <#--</div>-->
   <#--<div class="mdyqt_5">-->
    <#--<img class="mdyqt_5_1" src="/images/wly.png">-->
    <#--<span class="mdyqt_5_2">纯酿陈窖【52浓香型白酒】</span>-->
    <#--<span class="mdyqt_5_3">¥ 35<c>/50ml</c></span>-->
    <#--<span class="mdyqt_5_4">余量：500ml</span>-->
  <#--</div>-->
   <#--<div class="mdyqt_5">-->
    <#--<img class="mdyqt_5_1" src="/images/wly.png">-->
    <#--<span class="mdyqt_5_2">纯酿陈窖【52浓香型白酒】</span>-->
    <#--<span class="mdyqt_5_3">¥ 35<c>/50ml</c></span>-->
    <#--<span class="mdyqt_5_4">余量：500ml</span>-->
  <#--</div>-->

  <#if wines??>
      <#list wines as wine>
          <div class="mdyqt_5">
              <img class="mdyqt_5_1" src="/${wine.winePic!}">
              <span class="mdyqt_5_2">${(wine.wineName)!}【${(wine.wineDegree)!}°${(wine.wineType)!}】</span>
              <span class="mdyqt_5_3"></span>
              <span class="mdyqt_5_4">余量：${(wine.cabinetFatSurplus)!}ml</span>
          </div>
      </#list>
  </#if>
 <!-- <script type="text/javascript">
  window.onload=function(){
	  var oLB2=document.getElementById('LB_D');	
	var aImg=oLB2.getElementsByTagName('div');
	var kk=aImg.length*2.2+0.4+'rem';
	$('#LB_D').css('width',kk);
	alert(kk);
	  }
  </script>-->
</body>
</html>
