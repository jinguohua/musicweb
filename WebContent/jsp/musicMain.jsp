<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file = "sourse.jsp" %> 
<title>Insert title here</title>
<style>
	.thumbnail{
		max-height: 300px !important;
	}
</style>
</head>
<body>
	<section>
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox" style = "height:336px">
		    <div class="item active">
		      <img src="http://p1.music.126.net/aOoXDq6RCL78Zhil2r4RQw==/109951163229931181.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		    
		    <div class="item">
		      <img src="http://p1.music.126.net/pxMp30eU6PdCwzYPBQETBg==/109951163232922157.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		    <div class="item">
		      <img src="http://p1.music.126.net/CstEaweLDXlt5O1BnRiRSg==/109951163232941211.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		    <div class="item">
		      <img src="http://p1.music.126.net/0nDHcx21DEYjHL87SRFKyA==/109951163229929478.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		    <div class="item">
		      <img src="http://p1.music.126.net/iwCUICdYyuFifl1TqqWl-A==/109951163229936288.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		    <div class="item">
		      <img src="http://p1.music.126.net/boRm6nN45c6LbDMkgMSmEw==/109951163233089312.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		  </div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		</section><!-- è½®æ­å¾é¨å   -->
		<section>
			<div>
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" style = "background-color: #a20f0f;" role="tablist">
			    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">首页</a></li>
			    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">华语</a></li>
			    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">摇滚</a></li>
			    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">经典</a></li>
			  </ul>
			
			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="home">
			    	<div class="row hot" style = "margin-right:0px;margin-left:0px">
					  <div class="col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="" alt="">
					      <div class="caption">
					        <a><h5></h5></a>
					      </div>
					    </div>
					  </div>
					  <div class="col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="" alt="">
					      <div class="caption">
					        <a><h5></h5></a></div>
					    </div>
					  </div>
					  <div class="col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="" alt="">
					      <div class="caption">
					        <a><h5></h5></a></div>
					    </div>
					  </div>
					  <div class="col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="" alt="">
					      <div class="caption">
					        <a><h5></h5></a></div>
					    </div>
					  </div>
					  <div class="col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="" alt="">
					      <div class="caption">
					        <a><h5></h5></a></div>
					    </div>
					  </div>
					  <div class="col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="" alt="">
					      <div class="caption">
					        <a><h5></h5></a></div>
					    </div>
					  </div>
					  <div class="col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="" alt="">
					      <div class="caption">
					        <a><h5></h5></a></div>
					    </div>
					  </div>
					  <div class="col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="" alt="">
					      <div class="caption">
					        <a><h5></h5></a></div>
					    </div>
					  </div>
					</div>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="profile">.2..</div>
			    <div role="tabpanel" class="tab-pane" id="messages">..3.</div>
			    <div role="tabpanel" class="tab-pane" id="settings">..4.</div>
			  </div>
			
			</div>
		</section>
</body>
<script type="text/javascript">
$(function(){
	getSongsList();	
})
function getSongsList(){
	 $.ajax({
		type:'get',
		url:'http://musicapi.leanapp.cn/top/playlist/highquality?limit=8', 
		dataType:'json',
		success:function(data){
			var hotLink = $(".hot").find('h5');
			var hotImg = $(".hot").find('img');
			for(var i = 0; i<hotLink.length;i++){
				$(hotLink[i]).text(data.playlists[i].name);
				$(hotImg[i]).attr("src",data.playlists[i].coverImgUrl);
				$(hotImg[i]).attr('alt',data.playlists[i].description);
				$(hotImg[i]).attr('data-id',data.playlists[i].id);
				 
			}
		},
		error:function(){
		}
	}) 
	
}
</script>
</html>