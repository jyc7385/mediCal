<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

	<title>mediCal</title>
	
	<!-- Bootstrap Core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- MetisMenu CSS -->
	<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
		rel="stylesheet" type="text/css">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    
	<style>
		.login_id_ck {
			color: red;
			display: none;
		}
		.login_pw_ck {
			color: red;
			display: none;
		}
		#join_div {
			text-align: center;
		}
	</style>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">로그인을 하세요.</h3>
					</div>
					<div class="panel-body">
						<form role="form" method='post' action="/login">
							<fieldset>
								<div class="form-group">
									<input class="form-control id_input" placeholder="아이디"
										name="username" type="text" autofocus maxlength="20">
									<span class="login_id_ck">아이디를 입력해주세요.</span>
								</div>
								<div class="form-group">
									<input class="form-control pw_input" placeholder="비밀번호"
										name="password" type="password" value="" maxlength="20">
									<span class="login_pw_ck">비밀번호를 입력해주세요.</span>
								</div>
								<div class="checkbox">
									<label> <input name="remember-me" type="checkbox">로그인 상태 유지
									</label>
								</div>
								<a href="index.html" class="btn btn-lg btn-success btn-block">로그인</a>
							</fieldset>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
												
					</div>
				</div>
				<div id="join_div">
					<a href="/join">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
	
	<script>
	
		var idCheck = false;
		var pwCheck = false;
			
		$(".btn-success").on("click", function(e){
				
			if(idCheck && pwCheck) {
				e.preventDefault();
				$("form").submit(); 
			}
			else {
				if(!idCheck) $('.login_id_ck').css('display', 'block');
				if(!pwCheck) $('.login_pw_ck').css('display', 'block');
			}
			
			return false;
			
		}); 
		
		// ID check
		
		$('.id_input').on("propertychange change keyup paste input", function(){
			
			var id = $('.id_input').val();
			
			if(id == '') {
				$('.login_id_ck').css('display', 'block');
				idCheck = false;
			}
			else {
				$('.login_id_ck').css('display', 'none');
				idCheck = true;
			}
					
		});
		
		// Password check
		
		$('.pw_input').on("propertychange change keyup paste input", function(){
			
			var pw = $('.pw_input').val();
			
			if(pw == '') {
				$('.login_pw_ck').css('display', 'block');
				pwCheck = false;
			}
			else {
				$('.login_pw_ck').css('display', 'none');
				pwCheck = true;
			}
					
		});
	
		$(document).ready(function(){
			
			var error = '<c:out value="${error}"/>';
	
			if(error === '') return;
			if(error !== null) alert(error);
	
		});
				
		$(document).ready(function(){
			
			var logout = '<c:out value="${logout}"/>';
	
			if(logout === '' || history.state) return;
			
			if(logout !== null) {
				alert("로그아웃하였습니다.");
				history.replaceState({}, null, null);
			}
	
		});
		
		$(document).ready(function(){
			
			var loginAlert = '<c:out value="${loginAlert}"/>';
	
			if(loginAlert === '' ) return;
			if(loginAlert === "deleteUser") alert("회원탈퇴가 완료되었습니다.");
			else if(loginAlert === "join") alert("회원가입이 완료되었습니다.");
	
		});
	
	</script>  

</body>

</html>