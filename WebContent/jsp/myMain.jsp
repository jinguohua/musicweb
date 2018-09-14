<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<%@include file = "sourse.jsp" %> 
<script type="text/javascript" src = "../js/jquery.dataTables.min.js"></script>
<link href="../js/jquery.dataTables.min.css" rel="stylesheet">
<style type="text/css">
	#dutyListTable{
		margin:0;
		width:100% !important;
		background-color:#000;
		color:#fff;
	}
	table.dataTable.cell-border tbody td {
    	border-top: 0px solid #ddd !important;
    }
    table.dataTable.cell-border tbody td {
    	border-right: 0px solid #ddd;
    }
    table.dataTable.cell-border thead th {
    	border-right: 0px solid #ddd;
    	border-bottom: 1px solid #ddd;
    }
	table.dataTable tbody tr:nth-child(odd) {
		background-color:#000 !important;
		color:#fff !important;
	}
	table.dataTable tbody tr:nth-child(odd):hover {
		color:#c00 !important;
	}
	table.dataTable tbody tr:nth-child(even):hover {
		color:#c00 !important;
	}
	table.dataTable tbody tr:nth-child(odd):hover a{
		color:#c00 !important;
	}
	table.dataTable tbody tr:nth-child(even):hover a{
		color:#c00 !important;
	}
	table.dataTable tbody tr:nth-child(even) {
		background-color:#000 !important;
		color:#fff !important;
	}
	.dataTables_wrapper .dataTables_filter input {
		border-top-right-radius: 10px;
	}
	.panel{
	    background-color: #f1ebeb;
	}
	.row{
		margin:0 0;
	}
 
	.playIt{
		color:#fff !important;
		float:right !important;
	}
	.deleteIt,.downLoadIt{
		color:#fff !important;
	}
	.playIt:hover{
		color:#000 !important;
	}
</style>
 
</head>
<body  style= "background-color:rgba(0,0,0,0)">
<div class = "row">
	<div class = "col-md-2" style = "background-color:#ccc">
	喜欢的歌曲列表
	</div>
	<div class = col-md-10 style= 'padding:0'>
		<div id = "fSongTableHook" class = "panel">
		 	<table class="table table-bordered table-hover cell-border" id="dutyListTable">
	             <thead>
	             <tr>
	                 <th>歌曲序列</th>
	                 <th>歌曲标题</th>
	                 <th>时长</th>
	                 <th>歌手</th>
	                 <!-- <th>操作</th>   -->
	                 <!-- <th>name</th>
	                 <th>position</th>
	                 <th>salary</th>
	                 <th>start_date</th>
	                 <th>专辑</th> -->
	             </tr>
	             </thead>
	             <tbody id="fSongHook">
	
	             </tbody>
	         </table>
		 </div>
	</div>
</div>
	 
</body>
 
<script type="text/javascript">
$(function(){
	getSongs();	
})
//鼠标滑动显示/隐藏播放效果
$(document).on("mouseover",'#fSongHook tr',function(){
	$(this).find('td:first i').show();
})
$(document).on("mouseout",'#fSongHook tr',function(){
	$(this).find('td:first i').hide();
})
$(document).on('click','#fSongHook tr td i',function(){
	debugger;
	var song ={},
		songId = '',
		tds = $(this).parents("tr").find("td");
		type = $(this).attr('data-typ'),
		mp3Id = $(this).attr('data-id'),
		name = tds.eq(1).text(),
		Aname = tds.eq(3).text(),
		duration = tds.eq(2).text();
		song.id = mp3Id;
		song.name = name;
		song.Aname = Aname;
		song.duration = duration; 
		song.heart =1; 
	if(type =='play'){
		$(window.parent.getSongUrlById(song).then(function(song){window.parent.initAllPlay(song)}));  
	}
	
	
})

 

//获取喜欢的歌的数据
function getSongs(){
	$.ajax({
		url:'../member/getMyFSongs',
		type:'post',
		dataType:'json',
		success:function(data){
			var datas = [];
			for(var i = 0;i<data.length;i++){
				var item = {};
				item.num = i+1+"<i class = 'glyphicon glyphicon-headphones' data-id="+data[i][3]+" style= 'display:none;margin-left:22px' data-typ = 'play'></i><i class = 'glyphicon glyphicon-download-alt' style= 'display:none;margin-left:14px' data-typ = 'downLoad' data-id= "+data[i][3]+"></i><i class = 'glyphicon glyphicon-trash' style= 'display:none;margin-left:14px' data-typ = 'remove' data-id="+data[i][3]+"></i>";
				item.songName = data[i][4];
				item.songAname = data[i][2];
				item.duration = data[i][1];
				item.songId = data[i][3];
				//item.operation ="<a href = '#' class = 'deleteIt' data-Id ="+data[i][0]+">删除</>&nbsp;&nbsp;&nbsp;<a href = '#' class = 'downLoadIt' data-Id ="+data[i][0]+">下载</>";
				//item.operation =
				datas.push(item);
			}
			initTable(datas);
		},
		error:function(data){
			alert(data);
		}
	})
}
function initTable(data){
	$('#dutyListTable').DataTable( {
        data: data, 
        columns: [
        	{ data: 'num' },
            { data: 'songName' },
            { data: 'duration' },
            { data: 'songAname' } 
        ],
        
        language: {  
            "sProcessing": "处理中...",  
            "sLengthMenu": "显示 _MENU_ 项结果",  
            "sZeroRecords": "没有匹配结果",  
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",  
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",  
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",  
            "sInfoPostFix": "",  
            "sSearch": "搜索:",  
            "sUrl": "",  
            "sEmptyTable": "表中数据为空",  
            "sLoadingRecords": "载入中...",  
            "sInfoThousands": ",",  
            "oPaginate": {  
                "sFirst": "首页",  
                "sPrevious": "上页",  
                "sNext": "下页",  
                "sLast": "末页"  
            },  
            "oAria": {  
                "sSortAscending": ": 以升序排列此列",  
                "sSortDescending": ": 以降序排列此列"  
            }  
        }  


    } );
}
</script>
</html>