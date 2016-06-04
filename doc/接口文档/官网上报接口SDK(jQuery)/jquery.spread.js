(function($){
	
	function setCookie(name,value) 
	{ 
		var Days = 30; 
		var exp = new Date(); 
		exp.setTime(exp.getTime() + Days*24*60*60*1000); 
		document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
	} 

	//读取cookies 
	function getCookie(name) 
	{ 
		var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	 
		if(arr=document.cookie.match(reg))
	 
			return unescape(arr[2]); 
		else 
			return null; 
	} 
	   
	function uuid(){
		return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
			var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
			return v.toString(16);
		});
	};
	
	var ksCookie = getCookie("ksSpreadCookie");
	if(ksCookie == null){
		setCookie("ksSpreadCookie", uuid());
		ksCookie = getCookie("ksSpreadCookie");
	}
	
	// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
	Date.prototype.Format = function (fmt) {  
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	function createURL(url, param){
		$.each(param, function(item, key){
			if(url==null){
				url = item + '=' + key;	
			}else{
				url += '&' + item + '=' + key;
			}
		});
		
		return url;
	}
	
	function createHeader(spreadId){
		var param = spreadId.split("_");
		if(param.length < 3){
			return null;
		}	
		var appId = param[0];
		var channelId = param[2]; 
		var curTime= new Date().Format("yyyy-MM-dd hh:mm:ss.S");
		
		var head = {
			batchTimestamp: curTime,
			batchDataId:  uuid(),
			msgVersion: '2.0',
			appId: appId,
			channel:channelId,
			datasource:'client',
			appVersion:'1.0.0'
		}
		
		return createURL(null, head);
	}
	
	var collectURL = "http://xgdata.xgsdk.com/jspush";
	var clickParam = null;
	var downParam = null;
	
	//广告点击
	function click(spreadId){
	
		var head = createHeader(spreadId);
		if(head == null){
			return false;
		}
		
		var content = {
			msgType: 'spread.click',
			msgId: uuid(),
			timestamp: new Date().Format("yyyy-MM-dd hh:mm:ss.S"),
			ksSpreadCookie: ksCookie
		}
		clickParam = encodeURI(createURL(head, content));
		return sendClick();
	}
	
	//广告点击下载
	function down(spreadId){
		var head = createHeader(spreadId);
		if(head == null){
			return false;
		}
		
		var content = {
				msgType: 'spread.download',
				msgId: uuid(),
				timestamp: new Date().Format("yyyy-MM-dd hh:mm:ss.S"),
				ksSpreadCookie: ksCookie
			}
			
		downParam = encodeURI(createURL(head, content));
		return sendDown();
	}
	
	
	function sendClick(){
		if(clickParam == null)
			return false;
		
		$.ajax({
			url: collectURL,
			type: "GET",
			data: clickParam,
			dataType:'jsonp',
			success: function(data, status, xhr){
				if(data.status != "success"){
					//一秒后重试
					setTimeout(function(){sendClick();}, 1000);
				}
				
			}
		});
		return true;
	}
	
	function sendDown(){
		if(downParam == null)
			return false;
		
		$.ajax({
			url: collectURL,
			type: "GET",
			data: downParam,
			dataType:'jsonp',
			success: function(data, status, xhr){
				if(data.status != "success"){
					//一秒后重试
					setTimeout(function(){sendDown();}, 1000);	
				}
				
			}
		});
		return true;
	};
	

	
	$(document).ready(function(){
		
		function getUrlParam(name)
		{
			var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			var r = window.location.search.substr(1).match(reg);  //匹配目标参数
			if (r!=null) return unescape(r[2]); return null; //返回参数值
		} 

		var param = getUrlParam("spreadTag");
		if(param != null){
			click(param);
		}
		
		$(".ks_spread_down_and").click(function(){
			if(param != null){
				down(param);
				
				var params = param.split("_");
				if(params.length > 1){
					var downUrl = "http://appdown.kingsoft.com/" + params[0] + "/" + params[1] + "/" + param +".apk";
					window.location.href = downUrl;	
				}
				
			}
		});
		
	});
	

	
	//$.spread={
	//	click:function(spreadId){
	//		return click(spreadId);
	//	},
	//	down:function(spreadId){
	//		return down(spreadId);
	//	}
	//};
	

	
})(jQuery);