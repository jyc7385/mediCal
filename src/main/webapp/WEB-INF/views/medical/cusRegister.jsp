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
							<span class="cus_register_type_ck mobile_text">종류를 입력해주세요.</span>
							<span class="cus_register_type_val mobile_text">한글, 영문자, 숫자로 2~30자만 입력할 수 있습니다.</span>
							<span class="cus_register_type_imposs mobile_text">이미 존재하는 종류 명입니다. 다른 종류 명을 입력하세요.</span>
						</div>
			
						<div class="form-group">
							<label>검사/복용 일자</label> <input class="form-control take_input" type="date" name='takeDate'>
							<span class="cus_register_take_ck mobile_text">검사/복용 일자를 알맞게 입력해주세요. (이번 해 + 10년까지만 적용 가능합니다.)</span>
						</div>
						
						<div class="form-group">
							<div class="cus-cycle-form-group">						
								<label>주기</label><br>
								<input id="cycle_year" name="cycleYear" size="3" maxlength="2" value=<c:out value="0" /> style="text-align:center;" />
								<label for="cycle_year">년&nbsp;&nbsp;</label>
								<input id="cycle_month" name="cycleMonth" size="3" maxlength="2" value=<c:out value="0" /> style="text-align:center;" />
								<label for="cycle_month">개월&nbsp;&nbsp;</label>
								<br>
								<input id="cycle_week" name="cycleWeek" size="3" maxlength="2" value=<c:out value="0" /> style="text-align:center;" />
								<label for="cycle_week">주&nbsp;&nbsp;</label>
								<input id="cycle_day" name="cycleDay" size="3" maxlength="3" value=<c:out value="1" /> style="text-align:center;" />
								<label for="cycle_day">일&nbsp;&nbsp;</label>							
								<span class="cus_register_cycle_val mobile_text">0 이상의 숫자를 입력해주세요.</span>
								<span class="cus_register_cycle_ck mobile_text">1칸 이상은 숫자가 0보다 높아야 합니다.</span>
							</div>
						</div>
											    
						<div class="form-group">
							<label>다음 일자</label> <input class="form-control poss_input" type="date" name='possDate' readonly="readonly">
						</div>
			     		     
			     		<div class="form-group">
							<label>메모</label>
							<textarea class="form-control memo_input" name="memo" rows="3" maxlength="150" style="resize: none;"></textarea>
							<span class="cus_register_memo_val mobile_text">사용할 수 없는 문자가 있습니다.</span>
						</div>
			     		     
						<button type="submit" class="btn btn-default pull-right submit_button">등록</button>
			    		     
			    		<input type="hidden" class="form-control id_input" name='id' value='<sec:authentication property="principal.username" />'> 
						<input type="hidden" name='regType' value=<c:out value="custom" /> />
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
	var cycleValCheck = true;
	var cycleCheck = true;
	var memoCheck = true;
	
	$('.submit_button').click(function() {
		
		if(typeCheck && typeckCheck && takeCheck && cycleCheck && memoCheck) {			
			$("#register_form").submit();			
		}
		else {			
			if(!typeCheck) $('.cus_register_type_ck').css('display', 'block');
			if(!takeCheck) $('.cus_register_take_ck').css('display', 'block');			
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
			$('.cus_register_type_ck').css('display', 'block');
			$('.cus_register_type_val').css('display', 'none');
			typeCheck = false;			
		}
		else {			
			if(!typeval.test(type)) {				
				$('.cus_register_type_ck').css('display', 'none');
				$('.cus_register_type_val').css('display', 'block');
				typeCheck = false;				
			}
			else {				
				$('.cus_register_type_ck').css('display', 'none');
				$('.cus_register_type_val').css('display', 'none');
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
						$('.cus_register_type_imposs').css("display", "none");
						typeckCheck = true;						
					}
					else {						
						$('.cus_register_type_imposs').css("display", "inline-block");
						typeckCheck = false;						
					}					
				}			
			});
			
		}
		else {			
			$('.cus_register_type_imposs').css("display", "none");
			typeckCheck = false;			
		}
		
				
	});
	
	// Take date check & validate
	
	$('.take_input').on("propertychange change keyup paste input", function(){
		
		var take = $('.take_input').val();
		
		var takeYear = Number(take.split("-")[0]);
		var takeMonth = Number(take.split("-")[1]);
		var takeDay = Number(take.split("-")[2]);
		
		var today = new Date();		
		var todayYear = today.getFullYear();
		
		if((takeYear == 0) || (isNaN(takeMonth)) || (isNaN(takeDay))) {			
			$('.cus_register_take_ck').css('display', 'block');
			takeCheck = false;			
		}
		else {			
			if((takeYear < 1900) || (takeYear > (todayYear + 10))) {				
				$('.cus_register_take_ck').css('display', 'block');
				takeCheck = false;				
			}
			else {				
				$('.cus_register_take_ck').css('display', 'none');
				takeCheck = true;				
			}			
		}
					
	});
	
	$('.take_input, #cycle_year, #cycle_month, #cycle_week, #cycle_day').on("propertychange change keyup paste input", function(){
		
		if(takeCheck && cycleCheck) {
			
			var take = $('.take_input').val();		
			var takeYear = Number(take.split("-")[0]);
			var takeMonth = Number(take.split("-")[1]);
			var takeDay = Number(take.split("-")[2]);
				
			var cycleYear = Number($('#cycle_year').val());
			var cycleMonth = Number($('#cycle_month').val());
			var cycleWeek = Number($('#cycle_week').val());
			var cycleDay = Number($('#cycle_day').val());
			
			var date = new Date(takeYear, takeMonth - 1, takeDay);
					
			date.setYear(date.getFullYear() + cycleYear);
			date.setMonth(date.getMonth() + cycleMonth);
			date.setDate(date.getDate() + (7 * cycleWeek) + cycleDay);
					
			var newYear = String(date.getFullYear());
			
			var newMonth = date.getMonth() + 1;
			
			if(newMonth < 10) {				
				newMonth = String(newMonth);
				newMonth = "0" + newMonth;				
			}
			else newMonth = String(newMonth);
			
			var newDate = date.getDate();
			
			if(newDate < 10) {				
				newDate = String(newDate);
				newDate = "0" + newDate;				
			}
			else newDate = String(newDate);
					
			$('.poss_input').val(newYear + "-" + newMonth + "-" + newDate);

		}
		else {
			$('.poss_input').val('');
		}
		
		
	});
	
	$('#cycle_year, #cycle_month, #cycle_week, #cycle_day').on("propertychange change keyup paste input", function(){
		
		var cycleYear = $('#cycle_year').val();
		var cycleMonth = $('#cycle_month').val();
		var cycleWeek = $('#cycle_week').val();
		var cycleDay = $('#cycle_day').val();
		
		var cycleVal = /^[0-9]{1,2}$/;
		var cycleDayVal = /^[0-9]{1,3}$/;
		
		if((cycleYear == '') || (cycleMonth == '') || (cycleWeek == '') || (cycleDay == '')) {			
			$('.cus_register_cycle_val').css('display', 'block');
			$('.cus_register_cycle_ck').css('display', 'none');
			cycleValCheck = false;
			cycleCheck = false;			
		}
		else {	
			
			if(!cycleVal.test(cycleYear) || !cycleVal.test(cycleMonth) || !cycleVal.test(cycleWeek) || !cycleDayVal.test(cycleDay)) {				
				$('.cus_register_cycle_val').css('display', 'block');
				$('.cus_register_cycle_ck').css('display', 'none');
				cycleValCheck = false;
				cycleCheck = false;			
			}
			else {				
				$('.cus_register_cycle_val').css('display', 'none');
				cycleValCheck = true;				
			}		
			
		}
		
		if(cycleValCheck == true) {
			
			if((cycleYear == 0) && (cycleMonth == 0) && (cycleWeek == 0) && (cycleDay == 0)) {				
				$('.cus_register_cycle_ck').css('display', 'block');
				cycleCheck = false;				
			}
			else {				
				$('.cus_register_cycle_ck').css('display', 'none');
				cycleCheck = true;				
			}
			
		}
				
	});
	
	$('.memo_input').on("propertychange change keyup paste input", function(){
		
		var memo = $('.memo_input').val();
		var memoVal = /^[0-9a-zA-Zㄱ-힣\n\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\" ]*$/;
			
		if(!memoVal.test(memo)) {			
			$('.cus_register_memo_val').css('display', 'block');
			memoCheck = false;			
		}
		else {			
			$('.cus_register_memo_val').css('display', 'none');
			memoCheck = true;			
		}
				
	});
	
</script>

<%@include file="../includes/footer.jsp"%>