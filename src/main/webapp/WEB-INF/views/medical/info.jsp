<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<button class="btn btn-info btn-bottom-margin" onclick="location.href='/medical/list'">목록</button>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
						<b>계정 정보</b>
				</div>
				<div class="panel-body">
					<form role="form" method='post' action="/logout">
						<fieldset>
							<a href="/medical/manual" class="btn btn-lg btn-success btn-block">사용 설명서</a>
							<br>
							<a href="/medical/userinfo" class="btn btn-lg btn-success btn-block">계정 정보 / 비밀번호 변경</a>
							<br><br><br><br>
							<a class="btn btn-lg btn-warning btn-block logout_btn">로그아웃</a>
							<br><br><br><br>
							<a class="btn btn-lg btn-danger btn-block delete_btn">계정 탈퇴</a>
						</fieldset>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
											
				</div>
			</div>
		</div>
	</div>
</div>

 	
<script>

	var formObj = $("form");

	$(".logout_btn").on("click", function(e){
		
		e.preventDefault();
		$("form").submit();
		
	});
	
	$(".delete_btn").on("click", function(e){
		
		if(confirm("정말 탈퇴하시겠습니까?") == true) {			
			e.preventDefault();
			formObj.attr("action", "/medical/deleteUser");
			formObj.append("<input type='hidden' name='id' value='<sec:authentication property="principal.username"/>'>");
			$("form").submit();			
		}
		else {			
			return;			
		}
			
	});
	
	$(document).ready(function(){
		
		var infoAlert = '<c:out value="${infoAlert}"/>';

		if(infoAlert === '' ) return;
		if(infoAlert === "modify") alert("비밀번호 변경이 완료되었습니다.");

	});

</script>  

<%@include file="../includes/footer.jsp"%>
