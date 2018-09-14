<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理员主界面</title>
<%@include file = "sourse.jsp" %> 
<script src = "../js/fileJs/nav.js"></script>
<style>
	body{
		background-color: rgba(123,123,123,0.5);
		background-image:url(../img/background.jpg);
		background-repeat:no-repeat ;
		background-size:100% 100%; 
		background-attachment: fixed;" 
	}
	.rowList label {
       min-width: 80px;
    }
   .listStyle{
        width:350px;
        max-height:400px;
        position:absolute;
        left:0px;
        background-color:#fff;
        color:#5C554D;
        overflow-y:scroll;
        border:1px solid #eee;
        z-index:2
    }
    .listItemStyle {
        margin: 0;
        display:block;
        padding: 5px 3px;
        word-break: break-all;
        vertical-align:middle;
        border-top:1px solid #eee;
        cursor:pointer;
        height:41px;
    }
    .listItemStyle:hover {
        background-color:#ddd;
    }
	.col-md-6 i{
		color:#fff;
	}
	.playContral i{
		color:#fff;
	}
	i{
		cursor:pointer;
	}
	.progress {
    	height: 10px;
    	background-color:#CCC;
    	margin-bottom:8px !important;
    }
	.progress-bar-success {
    	background-color: #3a1bb7f7;
	}
	.modal-content{
		background-color: #544d4d;
		color: #fff;
	}
	.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th {
    background-color: #9a8989;
}
.modal-dialog {
	width:400px;
    margin: 0px 0px;
}
</style>
 
</head>
<body onunload="setCurrtSong()">
	<div class = "mainCon" style="background-color: rgba(123,123,123,0.5); position:relative">
		<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#"><i class = "glyphicon glyphicon-music"></i></a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="musicMain" data-url = "musicMain"><a href="#">音乐首页 <span class="sr-only">(current)</span></a></li>
	        <li class = "myMain" data-url = "myMain"><a href="#">我的首页</a></li>
			<li><a href="#">Link</a></li>
	      </ul>
	      <ul class="nav navbar-nav pull-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.userName}  <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">修改密码</a></li>
	            <li><a href="#">退出登录</a></li>
	            <li><a href="#">上传头像</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">修改个人信息</a></li>
	          </ul>
	        </li>
	      </ul>
	      <form class="navbar-form navbar-right">
	        <div class="form-group" style="position:relative">
	        <!-- <button id = "s">sousuo</button> -->
	          <input type="text" class="form-control investorName" placeholder="翻滚吧！">
	          <div style="display:none" id="investorList" class="listStyle"></div>
	        </div>
	      </form>
	       
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<div class="container" >
		<iframe id = "iframeHook" src = "../jsp/musicMain.jsp" style = "width:1150px ;height:1100px;border:none"> </iframe>
	</div>
 
	<section  class = "footContent" style = "width:100%;position:fixed;background-color:#000;" >
		<div class = " minPlayBox container" style = "height:60px">
			<div class='playContral row' style = "margin:0 ;margin-top:12px">
				<div class = 'btnStyle play_pause col-md-4' style = "margin-left:30px;font-size:16px;height:100%">
					<audio id = 'video'></audio>
					<a class = 'songsListModel'><i class = "glyphicon glyphicon-list" data-control = 'music'></i></a>
					<span title = '控制' class = 'play_pause' style = "margin-left:60px;margin-right:60px">
						<i class = "glyphicon glyphicon-step-backward" data-control = 'backward'></i>
						<i class = "glyphicon glyphicon-play" data-control = 'play'></i>
						<i class = "glyphicon glyphicon-pause" data-control = 'pause' style = 'display:none'></i>
						<i class = "glyphicon glyphicon-step-forward" data-control = 'forward'></i>
					</span>
					<span title = '音量'>
						<i class = "glyphicon glyphicon-volume-off"></i>
						<i class = "glyphicon glyphicon-volume-down"></i>
						<i class = "glyphicon glyphicon-volume-up"></i>
					</span>
				</div>
				<div style = "height:100%" class = "col-md-4">
					<div class = 'songInfo' style = "font-size:15px;color:#FFF;margin-left:30px;">
						<span></span>
					</div>
					<div class="progress">
					  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="">
					    <span class="sr-only"></span>
					  </div>
					</div>
				</div>
				<div class = 'favorite col-md-3' style = ''>
					<i class = "glyphicon glyphicon-heart" title = "点亮五朵火花可以收藏"></i>
					<span title = '热度' style = " font-size: 11px;padding-left: 30px;">
						<i class = "glyphicon glyphicon-fire"></i>
						<i class = "glyphicon glyphicon-fire"></i>
						<i class = "glyphicon glyphicon-fire"></i>
						<i class = "glyphicon glyphicon-fire"></i>
						<i class = "glyphicon glyphicon-fire"></i>
					</span>
				</div>
			</div>
		</div>
	</section>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <h4 class="modal-title" id="myModalLabel">播放列表</h4>
		</div>
		<div class="modal-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<td>序号</td><td>歌名</td><td>歌手</td>
					</tr>
				</thead>
				<tbody>
					 
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-default playListClose" data-dismiss="modal">Close</button>
		  <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
		</div>
	  </div>
	</div>
  </div>
</body>

</html>