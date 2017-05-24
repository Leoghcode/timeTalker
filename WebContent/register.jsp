<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Login & Register</title>
	<link rel="stylesheet" type="text/css" href="myStyle/register-login.css">
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
	    <img alt="logo" src="img/logo(2).png" width="139" height="117.5" >
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="login.jsp" >Login</a>
				<a href="register.jsp" class="active">Register</a>
				<div class="slide-bar slide-bar1"></div>
			</div>
		</div>

		<div class="login form">
			<div class="group">
				<div class="group-ipt student_id">
					<input type="student_id" name="username" id="username" class="ipt" placeholder="Pleanse enter your username" required>
				</div>
				<div class="group-ipt user">
					<input type="text" name="email" id="email" class="ipt" placeholder="Enter your e-mail" required>
				</div>
				<div class="group-ipt password">
					<input type="password" name="password" id="password" class="ipt" placeholder="Enter your password" required>
				</div>
				<div class="group-ipt password1">
					<input type="password" name="password1" id="password1" class="ipt" placeholder="Repeat your password" required>
				</div>
				<div class="group-ipt verify">
					<input type="text" name="verify" id="verify" class="ipt" placeholder="Enter verification code" required>
					<img src="http://zrong.me/home/index/imgcode?id=" class="imgcode">
				</div>
			</div>
		</div>

		<div class="button">
			<button type="submit" class="login-btn register-btn" id="button">Register</button>
		</div>
	</div>
</div>
<br>
<div class="footer">
	<p>TimeTalker-Be your private time assistant</p>
	
</div>

<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery_login.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>
<script>
	$('.imgcode').hover(function(){
		layer.tips("click to change", '.verify', {
        		time: 6000,
        		tips: [2, "#3c3c3c"]
    		})
	},function(){
		layer.closeAll('tips');
	}).click(function(){
		$(this).attr('src','http://zrong.me/home/index/imgcode?id=' + Math.random());
	})

	$(".login-btn").click(function(){
		var username=$("#username").val();
		var email = $("#email").val();
		var password = $("#password").val();
		var verify = $("#verify").val();
		
		alert(username);
		 $.ajax({
		 url: 'register',
		 type: 'PUT',
		 dataType:'json',
		 cache: false,
		 data: {
		 	'username':username,
		 	'password':password,
		 	'email':email,
		 },
		 success: function(data){
			 var result=data.result;
			 alert(result);
		 	if('true'==result) window.location.href="./template/master.jsp";
		 	
		 }
		 });

	});
	$("#remember-me").click(function(){
		var n = document.getElementById("remember-me").checked;
		if(n){
			$(".zt").show();
		}else{
			$(".zt").hide();
		}
	})
</script>
</body>
</html>
