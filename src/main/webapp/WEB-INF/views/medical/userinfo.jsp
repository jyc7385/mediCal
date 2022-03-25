<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<button data-oper="list" class="btn btn-info btn-bottom-margin" onclick="location.href='/medical/info'">이전 화면</button>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			
				<div class="panel-heading">
					<b>계정 정보 / 비밀번호 변경</b>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
			
					<form role="form" id="update_form" action="/medical/userinfo" method="post">
				
						<div class="form-group">
							<label>ID</label>
							<input class="form-control" name="id" value='<c:out value="${member.id}"/>' readonly="readonly">
						</div>
		        		        	
						<div class="form-group">
							<label>비밀번호</label>
							<input class="form-control pw_input" type="password" name='pw' maxlength="20">
							<span class="userinfo_pw_ck mobile_text">비밀번호를 입력해주세요.</span>
							<span class="userinfo_pw_val mobile_text">
								비밀번호는 영문자와 숫자로 시작하여 총 8~20자리 사용해아 합니다.<br>
								특수문자는 !@#$%^*+=-를 사용할 수 있습니다.
	            			</span>
						</div>
						
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					</form>
					
					<div class="form-group">
						<label>비밀번호 확인</label>
						<input class="form-control pwck_input" type="password" name='pwck' maxlength="20">
						<span class="userinfo_pwck_ck mobile_text">비밀번호를 입력해주세요.</span>
						<span class="userinfo_pwck_same mobile_text">비밀번호가 일치합니다.</span>
						<span class="userinfo_pwck_diff mobile_text">비밀번호가 틀립니다.</span>
					</div>
					
					<div class="form-group">
						<label>이름</label>
						<input class="form-control" name="name" value='<c:out value="${member.name}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>생년월일</label>
						<input class="form-control" name="birthDate" value='<c:out value="${member.birthDate}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>성별</label>
						<input class="form-control gender_input" readonly="readonly">
					</div>										
	          
					<input type="button" value="비밀번호 변경" class="btn btn-default pull-right update_button" />	          

					<input type="hidden" id="gen" value='<c:out value="${member.gender}"/>' />
	
				</div>
				<!--  end panel-body -->
			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<script>

	// Show gender input value
	
	var gen = $('#gen').val();
	
	if(gen == "m") $('.gender_input').val("남자");
	else $('.gender_input').val("여자");
	
	// Check password
	
	var pwCheck = false;
	var pwckCheck = false;
	var pwckcorCheck = false;
	
	$('.update_button').click(function() {
		
		if(pwCheck && pwckCheck && pwckcorCheck) {
			$("#update_form").submit();
		}
		else {
			if(!pwCheck) $('.userinfo_pw_ck').css('display', 'block');
			if(!pwckCheck) $('.userinfo_pwck_ck').css('display', 'block');
		}
		
		return false;
		
	});
	
	// Password validate
	$('.pw_input').on("propertychange change keyup paste input", function(){
		
		var pw = $('.pw_input').val();
		var pwval = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^*+=-]{8,20}$/;
		
		if(pw == '') {
			$('.userinfo_pw_ck').css('display', 'block');
			$('.userinfo_pw_val').css('display', 'none');
			pwCheck = false;
		}
		else {
			if(!pwval.test(pw)) {
				$('.userinfo_pw_ck').css('display', 'none');
				$('.userinfo_pw_val').css('display', 'block');
				pwCheck = false;
			}
			else {
				$('.userinfo_pw_ck').css('display', 'none');
				$('.userinfo_pw_val').css('display', 'none');
				pwCheck = true;
			}
		}
				
	});
	
	// Password check
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		
		var pwck = $('.pwck_input').val();
		
		$('.userinfo_pwck_ck').css('display', 'none');
		
		if(pwck == '') {
			$('.userinfo_pwck_ck').css('display', 'block');
			pwckCheck = false;
		}
		else {
			$('.userinfo_pwck_ck').css('display', 'none');
			pwckCheck = true;
		}    
			
	});
	
	$('.pw_input, .pwck_input').on("propertychange change keyup paste input", function(){
		
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		
		if(pwckCheck == true) {
			
		    if(pw == pwck){
		        $('.userinfo_pwck_same').css('display', 'block');
		        $('.userinfo_pwck_diff').css('display', 'none');
		        pwckcorCheck = true;
		    }
		    else {
		        $('.userinfo_pwck_same').css('display', 'none');
		        $('.userinfo_pwck_diff').css('display', 'block');
		        pwckcorCheck = false;
		    } 
		    
		}
		else {
			$('.userinfo_pwck_same').css('display', 'none');
			$('.userinfo_pwck_diff').css('display', 'none');
			pwckcorCheck = false;
		}
		
	});
	
</script>

<%@include file="../includes/footer.jsp"%>