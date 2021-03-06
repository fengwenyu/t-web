var path = getRootPath();
$(function(){
	$(".row-box").each(function(index, element) {
		var ele = $(this).find("input"),
			btn = $(this).find("button");
		!ele.val() && (btn.hide());
		
		ele.keyup(function(){
			btn.show(),
			!ele.val() && (btn.hide());
		});
		
		btn.click(function(e) {
			ele.val("").focus(),
			btn.hide();
			e.preventDefault();
		})
		ele.blur(function(){
			setTimeout(function(){btn.hide()},100);
		});
	});
	
	if($("#J_mobileNum").length>0){
		$("#J_mobileNum").bigGlass(2);
	}
	if($("#J_identificationNum").length>0){
		$("#J_identificationNum").bigGlass(1);
	}
	$(".agreement em").click(function(){
		if($(this).hasClass('cur')){
			$(this).removeClass('cur');
			$(".js-sign-up").addClass('grey-btn');
		}else{
			$(this).addClass('cur');
			$(".js-sign-up").removeClass('grey-btn');
		}
	})

	//点击开始报名按钮时验证输入内容是否正确
	$(".js-sign-up").click(function(){
		var re = /^[\u4e00-\u9fa5]$/,
			mre = /^1\d{10}$/,
			identification = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;

	/*	//选择跑团
		if ($.trim($("#J_groupSelect").val()) <= 0){
			return jShare('请选择跑团',"",""),
        	!1;
		}
		//跑团邀请码
		if ($.trim($("#J_groupCode").val()) == ""){
			return jShare('请填写跑团邀请码',"",""),
        	!1;
		}*/
		
		//姓名验证
		//if ($.trim($("#J_userName").val()) == "" || !re.test($("#J_userName").val())){
		if ($.trim($("#J_userName").val()) == ""){
			return jShare('请填写姓名',"",""),
        	!1;
		}
		//手机号码验证
        if ($.trim($("#J_mobileNum").val()) == "" || !mre.test($("#J_mobileNum").val())){
			return jShare('请输入正确手机号码',"",""),
        	!1;
		}
		//身份证号码验证
		if ($.trim($("#J_identificationNum").val()) =="" || !identification.test($("#J_identificationNum").val())){
			return jShare('请输入正确的身份证号码',"",""),
        	!1;
		}
		
		//身份证号码验证
		if ($(".js-sign-up").hasClass('grey-btn')){
        	return false;
		}

		//支付验证
		if (!$(".js-pay-mode img").hasClass('cur')){
			return jShare('请选择支付方式',"",""),
        	!1;
		}

	
		var fashionRun = $('#fashion_form').serialize();
		$.ajax({
			url : path + "/fashionrun/add",
			data : fashionRun,
			dataType : "json",
			type:"post",
			success : function(data) {
				if(data.code=="0"){
					$('.js-name-val').html($("#J_userName").val());
					$('.js-mobile-val').html($("#J_mobileNum").val());
					$('.js-id-val').html($("#J_identificationNum").val());
					$('#overlay').addClass('active');
					$('.modal').css({"display": "block"});
					$('.modal').animate(100,function(){
					  $('.modal').addClass('modal-in');
					});
					$("#orderId").val(data.orderId)
					
				}
				if(data.code=="1"){
					return jShare('该手机号用户已报过名了',"",""),
		        	!1;
				}
				if(data.code=="-1"){
					//报名结束
					location.href=path+"/fashionrun/finish";
				}
				if(data.code=="2"){
					return jShare('该身份证号已报过名了',"",""),
		        	!1;
				}
				if(data.code=="4"){
					return jShare(data.msg,"",""),
		        	!1;
				}
				
			}
		});

	});

	/*点击结算提醒弹层*/
	function modalHidden($ele) {
		$ele.removeClass('modal-in');
		$ele.one('webkitTransitionEnd',function(){
		  $ele.css({"display": "none"});
		  $('#overlay').removeClass('active');
		});
	}
	$('.js-close').click(function(e){
	  modalHidden($('.modal'));
	  e.stopPropagation();
	});
		
	$('#overlay').click(function(e){
	  if(e.target.classList.contains('overlay')){
		modalHidden($('.modal'));
	  }
	}); 


	  //尺码选择
	$('.js-bar-size li a').click(function(){
		if($(this).hasClass('saleOut')){
			var id=$(this).attr("id");
			if(id!=null){
				id=id.substr(0,1);
			}
			return jShare('抱歉，'+id+'码BRA已领完',"",""),
        	!1;
			return false;
		}
		if($(this).hasClass('cur')){
			$(this).removeClass('cur');
		}else{
			$("#size").val( $(this).attr("id"));
			$(this).addClass('cur');
			$(this).parent().siblings().find('a').removeClass('cur');
		}
	});
	
	//选择省市区
	var addrTxt;
	$("#J_area").click(function(){
		$("#area_overlay").height($(document).height());
		$("#area_overlay, #area_layer").show();
		addrTxt = "";
		return false;
	});
	
	$("#area_layer").delegate("dd a","click",function(e){
		var that = $(this),
		obj = $("#area_layer dd  a"),
		content = $("#area_layer dl"),
		thisCon = that.closest("dl"),
		title = $("#area_layer h3");
		
		obj.removeClass("cur");	
		that.addClass("cur");
		var dl_id = thisCon.attr("id");
		if(dl_id == "area_province"){
			$("#province").val(that.text());
		}else if(dl_id == "area_city"){
			$("#city").val(that.text());
		}else if(dl_id == "area_county"){
			$("#area").val(that.text());
		}else if(dl_id == "area_street"){
			$("#town").val(that.text());
		}	
		//选择结果
		addrTxt += " "+that.text();
		
		setTimeout(function(){
			
			if(thisCon.next("dl").length > 0){
				content.hide();
				thisCon.next("dl").show();
				title.html(thisCon.next("dl").attr("title"));
				if(thisCon.next("dl").attr("id") == "area_city"){
					$("#area_city").empty();
					$.post(path+"/fashionrun/city",{proviceId : that.attr("id")},function(data){
						console.log(data);
						$.each(data,function(index,item){
							$("#area_city").append("<dd><a href='#' id=" + item.id + ">" + item.name + "</a></dd>");
						});
					},"json");
				}else if(thisCon.next("dl").attr("id") == "area_county"){
					$("#area_county").empty();
					$.post(path+"/fashionrun/area",{cityId : that.attr("id")},function(data){
						$.each(data,function(index,item){
							$("#area_county").append("<dd><a href='#' id=" + item.id + ">" + item.name + "</a></dd>");
						});
					},"json");
				}else if(thisCon.next("dl").attr("id") == "area_street"){
					$("#area_street").empty();
					$.post(path+"/fashionrun/town",{areaId : that.attr("id")},function(data){
						$.each(data,function(index,item){
							$("#area_street").append("<dd><a href='#' id=" + item.id + ">" + item.name + "</a></dd>");
						});
					},"json");
				}
			}else{
				//返回初始状态
				console.log(1);
				content.hide();
				$("#area_overlay, #area_layer").hide();
				$("#area_layer dl:first").show();
				title.html($("#area_layer dl:first").attr("title"));
				$("#J_area").html(addrTxt);
			}
			
		}, 10);
		return false;
		
	});
	


	//省市区的弹层关闭
	$(".close_btn, #area_overlay").click(function(){
		$("#area_layer, #area_overlay").hide();
		$("#area_layer h3").show().html("省份");
		$("#area_layer").find("dl").eq(0).show().siblings("dl").hide();
		$("#area_layer dd a").removeClass("cur");

	});
	
	


	
	
	//点击领取按钮时验证输入内容是否正确
	$(".js-get-btn").click(function(){
		var mre = /^1\d{10}$/;
		//手机号码验证
        if ($.trim($("#J_mobileNum").val()) == "" || !mre.test($("#J_mobileNum").val())){
			return jShare('请输入正确手机号码',"",""),
        	!1;
		}
		//选择省市区验证
		if ($.trim($("#J_area").html()) == ""|| $("#J_area").html()=="省/市/区"){
			return jShare('选择省市区',"",""),
        	!1;
		}
		
		//详细地址验证
		if ($.trim($("#J_addr").val()) == ""){
			return jShare('请输入详细街道地址',"",""),
        	!1;
		}
		//尺码验证
		if (!$(".js-bar-size li a").hasClass('cur')){
			return jShare('请选择尺码',"",""),
        	!1;
		}
		
		var fashionRun = $('#apply_form').serialize();
		$.ajax({
			url : path + "/fashionrun/apply",
			data : fashionRun,
			dataType : "json",
			type:"post",
			success : function(data) {
				console.log(data);
				if(data.code=="0"){
					location.href=path+"/fashionrun/gift/success?orderId="+data.orderId;
				}
				if(data.code=="-1"){
					$('.js-name-val').html($("#J_userName").val());
					$('.js-mobile-val').html($("#J_mobileNum").val());
					$('.js-id-val').html($("#J_identificationNum").val());
					$('#overlay').addClass('active');
					$('.modal').css({"display": "block"});
					$('.modal').animate(100,function(){
					  $('.modal').addClass('modal-in');
					});
		        	!1;
				}
				if(data.code=="1"){
					return jShare('您已经领取过了!',"",""),
		        	!1;
				}
				if(data.code=="2"){
					return jShare('该尺码库存不足!',"",""),
		        	!1;
				}
				console.log(data);
			}
		});
		
	});




});
/*function add(){
	var fashionRun = $('#fashion_form').serialize();
	$.ajax({
		url : path + "/fashionrun/add",
		data : fashionRun,
		dataType : "json",
		success : function(data) {
			if(data.code=="0"){
				$("#orderId").val(data.orderId)
			
				
				var _iswx=$("#_iswx").val();
				if(_iswx){
					 pay(2,data.orderId);
				}else{
					pay(1,data.orderId);
				}
				
			}
			if(data.code=="1"){
				return jShare('该手机号用户已经报名成功',"",""),
	        	!1;
			}
			if(data.code=="-1"){
				//报名结束
				location.href=path+"/fashionrun/finish";
			}
			if(data.code=="2"){
				return jShare('该身份证用户已经报名成功',"",""),
	        	!1;
			}
			if(data.code=="4"){
				return jShare(data.msg,"",""),
	        	!1;
			}
			
		}
	});
}*/
function fromPay(type,orderId) {
	if (type == "1") {
		window.location.href = path + "/fashionrun/alipay?orderId=" + orderId;

	} else if (type == "2") {

		window.location.href = path + "/fashionrun/wxpay?orderId=" + orderId;

	}
	
}

function pay() {
	
	var _iswx=$("#_iswx").val();
	var orderId=$("#orderId").val();
	if(_iswx){
		fromPay(2,orderId);
	}else{
		fromPay(1,orderId);
	}
	
	
}