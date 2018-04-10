<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购买酒券</title>
<link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
 <script>
 $(function(){
	 $('#minus').click(function(){
		 var num=parseInt($('#Input_1').val());
		 $('#add').attr('src',"/images/btn_add.png");
		 if(num<=100)
		 {
			 $('#Input_1').val(50);
			 $('#minus').attr('src',"/images/btn_minus_no.png");
		 }
		 else
		 {
			$('#Input_1').val(num-50);
			$('#minus').attr('src',"/images/btn_minus.png");
		 }

         var price = ($('#Input_1').val()/50)*${(cabinetWine.cabinetWinePrice)!"0.00"};
         $("#price").html("¥"+price);
	 
	 })
	 $('#add').click(function(){
		 var num=parseInt($('#Input_1').val());
		 $('#minus').attr('src',"/images/btn_minus.png");
		 if(num>=950)
		 {
			 $('#Input_1').val(1000);
			 $('#add').attr('src',"/images/btn_add_no.png");
		 }
		 else
		 {
			$('#Input_1').val(num+50);
		 }
		 var price = ($('#Input_1').val()/50)*${(cabinetWine.cabinetWinePrice)!"0.00"};
	 	$("#price").html("¥"+price);
	 })
	})
 </script>
 
</head>

<body class="body_3">
  <div class="header"><img src="/images/27.png" onclick="javascript :history.back(-1);"><span>购买酒券</span><span></span></div>
  <div class="goumaijq">
     <span>酒品</span><span>${(wine.wineName)!}</span>
  </div>
  <div class="goumaijq_1">
     <span>单价</span><span><c>¥ ${(cabinetWine.cabinetWinePrice)!"0.00"}</c>/50ml</span>
  </div>
  <div class="goumaijq_1">
     <span>适用门店</span><span>${(store.storeName)!}</span>
  </div>
  <div class="goumaijq_2">
     <span>购买量(ml)</span>
     <div class="goumaijq_2_1"><img id="minus" src="/images/btn_minus_no.png"/><input oninput="run()" id="Input_1" type="text" value="50" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" /><img id="add" src="/images/btn_add.png"><div class="clear"></div></div>
  </div>
  <div class="goumaijq_3"><span>该酒券为单次使用酒券,购买量为50~1000ml</span></div>
  <div class="goumaiBuy"><span>合计</span><span id="price">¥${(cabinetWine.cabinetWinePrice)!"0.00"}</span><button onclick=window.location.href="/charge/index?cabinetId=${cabinetWine.cabinetWineCabinet}&wineId=${cabinetWine.cabinetWineWine}&desc=${desc}&num="+$('#Input_1').val()>去结算</button></div>
</body>
 <script>
  function run()
      {
		  var num1=parseInt($('#Input_1').val());
		  if(num1>1000)
		  {
			  $('#Input_1').val(1000);
			  $('#add').attr('src',"/images/btn_add_no.png");
		  }
		  else if(num1<=50)
		  {
			   $('#Input_1').val(50);
			   $('#minus').attr('src','/images/btn_minus_no.png');
		  }
		 else
		 {
			 $('#minus').attr('src',"/images/btn_minus.png");
		 }
      }
</script>
</html>
