<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>登录</title>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<link href="../js/bootstrap.min.css" rel="stylesheet">
	<%-- <%@include file = "sourse.jsp" %> --%>
	<style>
		.tab-content{
			color:#fff;
		}
	</style> 
	<script type="text/javascript">
	$(function(){
		var num =Math.floor(5*Math.random())
		/* if(num != 0 ) */
		/* $("img").attr('src','img/'+num+'.jpg'); */
	})
	</script>
</head>
<body style = "background-color:#731f1f">
	<div class = "container jumbotron" style = "width:59%;margin-top:50px; background-color:#614848">
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs"  >
	    <li role="presentation" ><a href="#admin" aria-controls="home" role="tab" data-toggle="tab">注册</a></li> 
	    <li role="presentation" class="active  "><a href="#customer" aria-controls="profile" role="tab" data-toggle="tab">用户登录</a></li>
	  </ul>
	  <div class = "row">
	  <div class ="panel col-md-7" style = "height:300px;overflow:hidden; background-color:#614848;text-align:center">
	  <img src = '../img/favicon.ico' style= "width:450px;height:300px" />
	  </div>
	  <!-- Tab panes -->
	  <div class="tab-content col-md-5">
	    <div role="tabpanel" class="tab-pane" id="admin">
		    <form class="form-inline" action = "admin/login" method = "post">
		    <h3>新用户</h3>
			  <div class="form-group">
			    <label>账号</label>
			    <input type="text" class="form-control" name ="admin"    >
			  </div><br>
			  <div class="form-group">
			    <label>密码</label>
			    <input type="password" class="form-control" name = "adminpwd"  >
			  </div><br>
			  <div class="form-group" style = "width:84%">
			    <label>再一次密码</label>
			    <input type="password" class="form-control" name = "adminpwd"  >
			  </div>
			  <hr>
			  <button type="submit" class="btn btn-default">确认</button>
			</form>
		</div>
	    <div role="tabpanel" class="tab-pane  active" id="customer">
		   <form class="form-inline" action = "../member/login" method = "post">
		    <h3>用户登陆</h3>
			  <div class="form-group">
			    <label>账号</label>
			    <input type="text" class="form-control" name = "userName"  placeholder="2">
			  </div><br>
			  <div class="form-group">
			    <label>密码</label>
			    <input type="password" class="form-control" name = "passWord"  placeholder="2">
			  </div><br><hr>
			  <button type="submit" class="btn btn-success">确认</button>
			</form>
	    </div>
	  </div>
	</div>
</div>
</body>
</html>