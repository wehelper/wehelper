<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>WeHelper</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<%@include file="includes/resource.jsp" %>
<link href="${metronicUrl}/global/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>
<link href="${metronicUrl}/admin/pages/css/login-soft.css" rel="stylesheet" type="text/css"/>
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<body class="login">
<div class="logo">
	<a href="index.shtml">
	<img src="${metronicUrl}/admin/layout/img/logo-big.png" alt=""/>
	</a>
</div>
<!-- END LOGO -->
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="login-form" action="toLogin.do" method="post">
			<h3 class="form-title">Login to your account</h3>
			<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span> Enter any username and password. </span>
			</div>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Username</label>
				<div class="input-icon">
					<i class="fa fa-user"></i> <input
						class="form-control placeholder-no-fix" type="text" id="username"
						autocomplete="off" placeholder="Username" name="username" value="wehelper"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i> <input
						class="form-control placeholder-no-fix" type="password" id="password"
						autocomplete="off" placeholder="Password" name="password" value="wehelper"/>
				</div>
			</div>
			<div class="form-actions">
				<label class="checkbox"> <input type="checkbox" id="remember"
					name="remember" value="1" /> Remember me
				</label>
				<button type="button" class="btn blue pull-right" onclick="toLogin()">
					Login <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
			<div class="forget-password">
				<h4>Forgot your password ?</h4>
				<p>
					no worries, click <a href="javascript:;" id="forget-password">
						here </a> to reset your password.
				</p>
			</div>
			<div class="create-account">
				<p>
					Don't have an account yet ?&nbsp; <a href="javascript:;"
						id="register-btn"> Create an account </a>
				</p>
			</div>
		</form>
		<!-- END LOGIN FORM -->
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<form class="forget-form" action="index.html" method="post">
			<h3>Forget Password ?</h3>
			<p>Enter your e-mail address below to reset your password.</p>
			<div class="form-group">
				<div class="input-icon">
					<i class="fa fa-envelope"></i> <input
						class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="Email" name="email" />
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
					<i class="m-icon-swapleft"></i> Back
				</button>
				<button type="submit" class="btn blue pull-right">
					Submit <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
		<!-- END FORGOT PASSWORD FORM -->
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">2014 &copy; Wehelper.</div>
<%@include file="includes/scripts.jsp" %>
<script src="${metronicUrl}/admin/pages/scripts/login-soft.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {
  Metronic.init(); // init metronic core components
  Layout.init(); // init current layout
  //QuickSidebar.init(); // init quick sidebar
  //Demo.init(); // init demo features
  Login.init();
       // init background slide images
  $.backstretch([
          "${metronicUrl}/admin/pages/media/bg/1.jpg",
          "${metronicUrl}/admin/pages/media/bg/2.jpg",
          "${metronicUrl}/admin/pages/media/bg/3.jpg",
          "${metronicUrl}/admin/pages/media/bg/4.jpg"
          ], {
            fade: 1000,
            duration: 8000
          }
    );
});


	function toLogin() {

		var systemUser = {};
		systemUser.loginAction = "login";
		//systemUser.registAction = "regist";
		systemUser.username = $("#username").val();
		systemUser.password = $("#password").val();
		systemUser.remember = $('#remember').is(":checked") ? 1 : 0;
		if (systemUser.username != "" && systemUser.username != "username"
				&& systemUser.password != ""
				&& systemUser.password != "password") {
			$("#pre-login").hide();
			$("#wait-login").show();
			$.ajax({
				url : "toLogin.do",
				type : "post",
				data : systemUser,
				dataType : "json",
				cache : false,
				async : false,
				success : function(result) {
					if (result != null) {
						if(result.success == true){
							location.href = "dashboard/index.shtml";
						}
					} else {
						$("#pre-login").show();
						$("#wait-login").hide();
						$("#msgArea").html("　" + "系统异常，请联系管理员!");
					}
				}
			});
		} else {
			$("#success-message").hide();
			$("#info-message").hide();
			$("#error-message").show();
			$("#error-message-text").html("用户名或密码不能为空。");
		}
	}
</script>
</body>
</html>