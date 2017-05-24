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
				<a href="login.jsp" class="active">Login</a>
				<a href="register.jsp">Register</a>
				<div class="slide-bar"></div>
			</div>
		</div>

		<div class="login form">
			<div class="group">
				<div class="group-ipt email">
					<input type="text" name="email" id="email" class="ipt" placeholder="Enter username" required>
				</div>
				<div class="group-ipt password">
					<input type="password" name="password" id="password" class="ipt" placeholder="Enter password" required>
				</div>
				<div class="group-ipt verify">
					<input type="text" name="verify" id="verify" class="ipt" placeholder="Enter the verification code" required>
					<img src="http://zrong.me/home/index/imgcode?id=" class="imgcode">
				</div>
			</div>
		</div>

		<div class="button">
			<button type="submit" class="login-btn register-btn" id="button" onclick="login()">Login</button>
		</div>

		<div class="remember clearfix">
			<label class="remember-me"><span class="icon"><span class="zt"></span></span><input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck" checked>Remember Me</label>
			<label class="forgot-password">
				<a href="#">Forgot your password?</a>
			</label>
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
<script src='js/layer.js' type="text/javascript"></script>

<script>
	
	
	function login(){
		var username=$("#email").val();
		var password=$("password").val();
		var verify=$("#verify").val();
		$.post("login",
		{
		    username:username,
		    password:password
		},
		    function(data){
		    var result=data.result;
		    var token=data.token;
		    alert(result+'\n'+token);
		    if(result=='true') window.location.href="./template/master.jsp";
		},"json");

	}

	$('.imgcode').hover(function(){
		layer.tips("click to change", '.verify', {
        		time: 6000,
        		tips: [2, "#3c3c3c"]
    		})
	},function(){
		layer.closeAll('tips');
	}).click(function(){
		$(this).attr('src','http://zrong.me/home/index/imgcode?id=' + Math.random());
	});
	$("#remember-me").click(function(){
		var n = document.getElementById("remember-me").checked;
		if(n){
			$(".zt").show();
		}else{
			$(".zt").hide();
		}
	});
</script>
</body>
</html>
