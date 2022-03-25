<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<button class="btn btn-info btn-bottom-margin" onclick="location.href='/medical/list'">목록</button>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>일정 등록</b>
				</div>
				<!-- /.panel-heading -->			
				<div class="panel-body">
				
					<form role="form" id="register_form" action="/medical/register" method="post">
						
						<div class="form-group">
							<label>종류</label> <input class="form-control type_input" name='schType' maxlength="30">
							<span class="sim_register_type_ck mobile_text">종류를 입력해주세요.</span>
							<span class="sim_register_type_val mobile_text">한글, 영문자, 숫자로 2~30자만 입력할 수 있습니다.</span>
							<span class="sim_register_type_imposs mobile_text">이미 존재하는 종류 명입니다. 다른 종류 명을 입력하세요.</span>
						</div>
			
						<div class="form-group">
							<label>검사/복용 일자</label> <input class="form-control take_input" type="date" name='takeDate'>
							<span class="sim_register_take_ck mobile_text">검사/복용 일자를 알맞게 입력해주세요. (이번 해 + 10년까지만 적용 가능합니다.)</span>
						</div>
														     		     
			     		<div class="form-group">
							<label>메모</label>
							<textarea class="form-control" name="memo" rows="3" maxlength="150" style="resize: none;"></textarea>
							<span class="sim_register_memo_val mobile_text">사용할 수 없는 문자가 있습니다.</span>
						</div>
			     		     
						<button type="submit" class="btn btn-default pull-right submit_button">등록</button>
			    		     
			    		<input type="hidden" class="form-control id_input" name='id' value='<sec:authentication property="principal.username" />'> 
						<input type="hidden" name="cycleYear" value=<c:out value="0" /> />
						<input type="hidden" name="cycleMonth" value=<c:out value="0" /> />
						<input type="hidden" name="cycleWeek" value=<c:out value="0" /> />
						<input type="hidden" name="cycleDay" value=<c:out value="0" /> />
						<%-- "2000-01-01" -> possDate = takeDate --%>											    
						<input type="hidden" class="poss_input" name="possDate" value=
						'<fmt:parseDate value="2000-01-01" pattern="yyyy-MM-dd" var="parsedSimDate" type="both" /><fmt:formatDate pattern="yyyy-MM-dd" value="${parsedSimDate}" />'>
						<input type="hidden" name="regType" value=<c:out value="simple" /> />
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	          			
					</form>
	
				</div>
				<!-- end panel-body -->
		    </div>
		    <!-- end panel panel-default -->
		</div>
		<!-- end col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<script>

	var typeCheck = false;
	var typeckCheck = true;
	var takeCheck = false;
	var memoCheck = true;
	
	$('.submit_button').click(function() {
		
		if(typeCheck && typeckCheck && takeCheck && memoCheck) {
			$("#register_form").submit();
		}
		else {
			if(!typeCheck) $('.sim_register_type_ck').css('display', 'block');
			if(!takeCheck) $('.sim_register_take_ck').css('display', 'block');
		}
		
		return false;
		
	});
	
	// Type check & validate
	
	$('.type_input').on("propertychange change keyup paste input", function(){
		
		var id = $('.id_input').val();
		var type = $('.type_input').val();
		var typeval = /^[a-zA-Z가-힣0-9]+[a-zA-Z가-힣0-9 ]{1,29}$/;
		
		var data = {id : id, schType : type};
		
		if(type == '') {
			$('.sim_register_type_ck').css('display', 'block');
			$('.sim_register_type_val').css('display', 'none');
			typeCheck = false;
		}
		else {
			if(!typeval.test(type)) {
				$('.sim_register_type_ck').css('display', 'none');
				$('.sim_register_type_val').css('display', 'block');
				typeCheck = false;
			}
			else {
				$('.sim_register_type_ck').css('display', 'none');
				$('.sim_register_type_val').css('display', 'none');
				typeCheck = true;
			}
		}
		
		if(typeCheck == true) {
			
			$.ajax({
				type : "get",
				url : "/medical/schTypeChk",
				data : data,
				success : function(result){
					if(result != "fail") {
						$('.sim_register_type_imposs').css("display", "none");
						typeckCheck = true;
					}
					else {
						$('.sim_register_type_imposs').css("display", "inline-block");
						typeckCheck = false;
					}
				}
			});
			
		}
		else {
			
			$('.sim_register_type_imposs').css("display", "none");
			typeckCheck = false;
			
		}
				
	});
	
	// Take date check & validate
	
	$('.take_input').on("propertychange change keyup paste input", function(){
		
		var take = $('.take_input').val();
		var poss = $('.poss_input').val();
		
		var takeYear = Number(take.split("-")[0]);
		var takeMonth = Number(take.split("-")[1]);
		var takeDay = Number(take.split("-")[2]);
		
		var today = new Date();		
		var todayYear = today.getFullYear();
		
		if((takeYear == 0) || (isNaN(takeMonth)) || (isNaN(takeDay))) {
			$('.sim_register_take_ck').css('display', 'block');
			takeCheck = false;
		}
		else {
			
			if((takeYear < 1900) || (takeYear > (todayYear + 10))) {
				$('.sim_register_take_ck').css('display', 'block');
				takeCheck = false;
			}
			else {
				$('.sim_register_take_ck').css('display', 'none');
				takeCheck = true;
			}
			
		}
			
		var possYear = takeYear;
		var possMonth = takeMonth;
		var possDay = takeDay;
		
		if(possMonth < 10) {
			possMonth = String(possMonth);
			possMonth = "0" + possMonth;
		}
		else possMonth = String(possMonth);
		
		if(possDay < 10) {
			possDay = String(possDay);
			possDay = "0" + possDay;
		}
		else newDate = String(possDay);
				
		$('.poss_input').val(possYear + "-" + possMonth + "-" + possDay);
							
	});	
	
	$('.memo_input').on("propertychange change keyup paste input", function(){
		
		var memo = $('.memo_input').val();
		var memoVal = /^[0-9a-zA-Zㄱ-힣\n\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\" ]*$/;
			
		if(!memoVal.test(memo)) {
			$('.sim_register_memo_val').css('display', 'block');
			memoCheck = false;
		}
		else {
			$('.sim_register_memo_val').css('display', 'none');
			memoCheck = true;
		}
				
	});
	
</script>

<%@include file="../includes/footer.jsp"%>