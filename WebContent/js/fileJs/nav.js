//var duration = 0;
var width = 0;
var t = '';
var flag = 1;
var songsList = []; //字符串转化成JSON数据
if(localStorage.getItem('songs')!=undefined){
	songsList = JSON.parse(localStorage.getItem('songs')); //字符串转化成JSON数据
}
$(function(){
	getCurrtSong();
	setPlayTop();
})
//设置播放器版块的top
function setPlayTop(){
	var mainHeight = $(window).height();
	//$(".mainCon").css("height","408px");
	$('.footContent').css('top',mainHeight-60);
	
}
//根据传入的song对象中的mp3Id，来查找对应歌曲的url
function getSongUrlById(song){
	debugger;
	var dfd = new Promise(function (resolve, reject) {
		var songid = song.id;
		$.ajax({
			url:"http://musicapi.leanapp.cn/music/url?id="+songid,		
			datatype:'json',
			type:'get',
				success:function(data){
					width = 0;
					var url = data.data[0].url;
					song.url = url;
					resolve(song);
					//initAllPlay(url,mp3Id,Aname,name,duration);
				},
				error:function(data){
					
				}
			});
	});
    return dfd;

	}
	
//刷新时从当前浏览器取到歌曲
function getCurrtSong(){
	var currtSong = '';
	if(localStorage.getItem('currtSong')!=undefined && localStorage.getItem('currtSong')!="{}"){
		currtSong = JSON.parse(localStorage.getItem('currtSong')); //字符串转化成JSON数据
		var mp3Id = currtSong.id;
		var Aname = currtSong.Aname;
		var name = currtSong.name;
		var duration = currtSong.duration;
		var song = {};
		song.id = mp3Id;
		song.Aname= Aname;
		song.name = name;
		song.duration  = duration;
		getSongUrlById(song).then(function(song){
			initAllPlay(song);
		})
		}
	}
	
 
	//当输入框内容改变时；调用这个get 方法
$(document).on('input porpertychange', '.investorName',function () {
     getTATransactionAccountData();
});

$(document).on('click', '.songsListModel',function () {
	$("#myModal").modal('show');
	var htmlStr = '';
	var datas = [];
	datas = localStorage.getItem('songs'); 
	var newObject = JSON.parse(datas);
	for(var i = 0;i<newObject.length;i++){
		htmlStr = htmlStr+ "<tr data-id ="+newObject[i].id +" data-duration = "+newObject[i].duration+" class = 'playThis' > <td>"+i+"</td><td>"+newObject[i].name+"</td><td>"+newObject[i].Aname+"</td></tr>"
	}
	$("#myModal").find("tbody").append(htmlStr);
});

$(document).on('click', '.playListClose',function () {
	 $("#myModal").modal('hide');
	 $("#myModal").find("tbody").empty();

});

 //聚集焦点后将改变输入框的样式
$(document).on('click', '.investorName',function (e) {
     $('.investorName').css('width','350px');
});

	//阻止播放区内部模块 冒泡事件
$(document).on("click",'.playThis',function(e){
	width = 0;
	 var mp3Url ="";
	 clearInterval(t);
	 var id  = $(this).data('id');
	 var name  = $(this).find('td')[1].innerText;
	 var Aname  = $(this).find('td')[2].innerText;
	 var duration = $(this).data('duration');
	 var song = {};
		song.id = id;
		song.Aname= Aname;
		song.name = name;
		song.duration  = duration;
		getSongUrlById(song).then(function(song){
			initAllPlay(song);
			
		})
	
})
//控制播放和显示
$(document).on('click','.play_pause i',function(){
	var type = $(this).attr("data-control");
	if(type =='play'){
		clearInterval(t);
		if($(".progress-bar").width() >=$(".progress").width()){
			 width = 0
		} 
		$('.glyphicon-play').hide();
		$('.glyphicon-pause').show();
		$('audio')[0].play();
		t = setInterval(progress, 1000);
		
	}if(type =='pause'){
		$('.glyphicon-play').show();
		$('.glyphicon-pause').hide();
		$('audio')[0].pause();
		clearInterval(t);
	}
	//设置进度条
	function progress(){
		var duration = Math.ceil($(".glyphicon-heart").attr('data-duration'));
		width = width+ (1/duration);
		$(".progress-bar").css('width',(width+0.02)*100+"%");
		if($(".progress-bar").width() >=$(".progress").width()){
			width = 0;
			$(".progress-bar").css('width',(width)*100+"%");
			clearInterval(t);
			$('.glyphicon-pause').click();
		} 
		
	}
})
//失去焦点后，下拉菜单上滑
$(document).on('blur', '.investorName',function (e) {
    $('#investorList').slideUp();
});
//点击
$(document).on('click', '.glyphicon-heart',function (e) {
    var songId = $(this).attr("data-id");
    var songName = $(this).attr("data-name");
    var songAname = $(this).attr("data-Aname");
    var duration = $(this).attr("data-duration");
    if(songId != null){
    	 $.ajax({
 	    	url:"../member/myFavoriteSongs",
 	    	type:"post",
 	    	data:{songId:songId,songName:songName,songAname:songAname,duration:duration},
 	    	dataType:'text',
 	    	success:function(data){
 	    		if(data == 0)
 	   		 {
 	   			 alert("已添加此歌曲，不用重复添加");
 	   		 }else{
 	   			 alert( "添加成功！");
 	   		 }
 	    	},
 	    	error:function(data){
 	    		alert("失败！")
 	    	}
 	    });
    }
});
//点击下拉菜单后播放歌曲
$(document).on('click', '.InItem', function () {
	debugger;
	var song = {};
	clearInterval(t);
	var mp3Id = $(this).attr('data-id');
	var Aname = $(this).attr('data-Aname');
	var duration = ($(this).attr('data-duration'))/1000;
	var name = $(this).attr('data-name');
 
	$.ajax({
		url:"http://musicapi.leanapp.cn/music/url?id="+mp3Id,		
		datatype:'json',
		type:'get',
		success:function(data){
			width = 0;
			var url = data.data[0].url;
			song.id = mp3Id;
			song.url = url;
			song.name = name;
			song.Aname = Aname;
			song.duration = duration;
			var tag = 1
			for(var i = 0;i<songsList.length;i++){
				if(song.id == songsList[i].id){
					tag= 0
				}
			}
			if(tag ==1){
				songsList.push(song);
			}
			var objString = JSON.stringify(songsList); //JSON 数据转化成字符串 
			localStorage.setItem('songs', objString);
			//$.cookie('songsList',objString, { expires: 20 });
			initAllPlay(song);
			$('.glyphicon-play').click();
			
		},
		error:function(data){
			
		}
	});
	/* getSongById(mp3Id); */
	 })
 
 
	//初始化全部播放信息
function initAllPlay(/*url,mp3Id,Aname,name,duration*/song){
	debugger;
	clearInterval(t);
	$(".playContral").find("audio").attr('src',song.url);
	$(".songInfo").find("span").text(song.Aname+'|'+song.name);
	$(".glyphicon-heart").attr('data-id',song.id);
	$(".glyphicon-heart").attr('data-name',song.name);
	$(".glyphicon-heart").attr('data-aname',song.Aname);
	$(".glyphicon-heart").attr('data-duration',song.duration);
	if(song.heart != undefined && song.heart == 1){
		$(".glyphicon-heart").css("color",'red')
	}else{
		$(".glyphicon-heart").css("color",'#fff')
	}
	if(flag ==1){
		flag= flag-1;
	}else{
		$('.glyphicon-play').click();
	}
	
}
function setCurrtSong(){
	debugger;
	var currtSong ={};
	currtSong.id = $(".glyphicon-heart").attr('data-id');
	currtSong.name = $(".glyphicon-heart").attr('data-name');
	currtSong.Aname = $(".glyphicon-heart").attr('data-aname');
	currtSong.duration = $(".glyphicon-heart").attr('data-duration');
	
	var objString = JSON.stringify(currtSong); //JSON 数据转化成字符串 
	localStorage.setItem('currtSong', objString);
}
 

function getTATransactionAccountData() {
	var investorName = $(".investorName").val();
	var link = 'http://musicapi.leanapp.cn/search?keywords='+investorName;
    $('#investorList').empty();
    $.ajax({
		url:link,	
		dataType:'json',
		type:'GET',
		success:function(data){
			$.each(data.result.songs, function (a, item) {
                $('#investorList').append('<span class="listItemStyle InItem" data-id="' + item.id + '" data-name="' + item.name + '" data-url = "'+item.mp3Url+'" data-duration = "'+item.duration+'" data-Aname = "'+item.album.artists[0].name+'">' + item.name + '&nbsp;&nbsp;' + item.album.artists[0].name + '</span>');
            })
            $('#investorList').slideDown();
		},
		error:function(data){
			
		}
	});
	
}


function checkUrl(iUrl){
	var iframeSrc = $('iframe').attr('src');
	var strS = iframeSrc.split('/');
	if(strS[2] != iUrl+'.jsp'){
		$('iframe').attr("src","../jsp/"+iUrl+".jsp");
		if(iUrl != "musicMain"){
			$('iframe').css('height','600px')
			
		}else{
			$('iframe').css('height','1100px')
				
			}
				
			
		}
	}
 
	$(document).on('click','.navbar-nav li',function(){
	var iUrl = $(this).attr("data-url");
	if(iUrl != undefined &&iUrl !=null){
		checkUrl(iUrl)
		
	}
})
