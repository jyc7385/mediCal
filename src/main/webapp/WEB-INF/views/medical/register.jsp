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
																										
						<label>분류 :</label>&nbsp;
						
						<select name='type' class="select_type">
							<option value="" selected>선택하세요</option>
							<option value="medical">의료</option>
							<option value="medicine">의약</option>
							<option value="vaccine">백신</option>
						</select> 
																													
						<table class="table table-striped table-bordered table-hover">
						
							<colgroup>
								<col class="table-select">
								<col class="table-type">
							</colgroup>
							
							<thead>
								<tr>
									<th class="hidden-col">분류</th>
									<th>선택</th>
									<th>종류</th>
								</tr>
							</thead>
						
							<c:forEach items="${medilist}" var="li">
								<tr class="${li.category}">
									<td class="hidden-col"><c:out value="${li.category}" /></td>
									<td style="text-align:center"><input type="radio" class="mediradio" name="medi" data-type="${li.schType}" data-year="${li.cycleYear}" data-month="${li.cycleMonth}" data-week="${li.cycleWeek}" data-day="${li.cycleDay}"></td>
									<td><c:out value="${li.schType}" /></td>
								</tr>
							</c:forEach>
					
						</table>
												
						<div class="form-group">
							<label>선택된 종류</label> <input class="form-control type_input" name='schType' readonly="readonly">
							<span class="register_type_ck mobile_text">위의 표에서 종류를 선택해주세요.</span>
							<span class="register_type_imposs mobile_text">이미 존재하는 종류 명입니다. 다른 종류 명을 선택하세요.</span>
						</div>
																							
						<div class="form-group">
							<label>검사/복용 일자</label> <input class="form-control take_input" type="date" name='takeDate'>
							<span class="register_take_ck mobile_text">검사/복용 일자를 알맞게 입력해주세요. (이번 해 + 10년까지만 적용 가능합니다.)</span>
						</div>
						
						<div class="form-group">
							<div class="cycle-form-group">				
								<label>주기</label><br>
								<input id="cycle_year" name="cycleYear" size="3" maxlength="2" value=<c:out value="0" /> readonly="readonly" />
								<label for="cycle_year">년&nbsp;&nbsp;</label>
								<input id="cycle_month" name="cycleMonth" size="3" maxlength="2" value=<c:out value="0" /> readonly="readonly" />
								<label for="cycle_month">개월&nbsp;&nbsp;</label>
								<br>
								<input id="cycle_week" name="cycleWeek" size="3" maxlength="2" value=<c:out value="0" /> readonly="readonly" />
								<label for="cycle_week">주&nbsp;&nbsp;</label>
								<input id="cycle_day" name="cycleDay" size="3" maxlength="3" value=<c:out value="1" /> readonly="readonly" />
								<label for="cycle_day">일&nbsp;&nbsp;</label>							
							</div>
						</div>
											    
						<div class="form-group">
							<label>다음 일자</label> <input class="form-control poss_input" type="date" name='possDate' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>메모</label>
							<textarea class="form-control memo_input" name="memo" rows="3" maxlength="150" style="resize: none;"></textarea>
							<span class="register_memo_val mobile_text">사용할 수 없는 문자가 있습니다.</span>
						</div>
			     		     
						<button type="submit" class="btn btn-default pull-right submit_button">등록</button>
			    		     
			    		<input type="hidden" class="form-control id_input" name='id' value='<sec:authentication property="principal.username" />'>
						<input type="hidden" name='regType' value=<c:out value="normal" /> />
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
	var takeCheck = false;
	var typeckCheck = false;
	var memoCheck = true;
	
	$('.medical').css("display", "none");
	$('.medicine').css("display", "none");
	$('.vaccine').css("display", "none");
	
	$('.select_type').change(function() {
		
		var type = this.value;
		
		if(type == "") {		
			$('.medical').css("display", "none");
			$('.medicine').css("display", "none");
			$('.vaccine').css("display", "none");			
		}
		
		if(type == "medical") {			
			$('.medical').css("display", "");
			$('.medicine').css("display", "none");
			$('.vaccine').css("display", "none");			
		}
		else if(type == "medicine") {			
			$('.medical').css("display", "none");
			$('.medicine').css("display", "");
			$('.vaccine').css("display", "none");		
		}
		else if (type == "vaccine") {		
			$('.medical').css("display", "none");
			$('.medicine').css("display", "none");
			$('.vaccine').css("display", "");		
		}
		
	});
	
	$('.submit_button').click(function() {
		
		if(typeCheck && typeckCheck && takeCheck && memoCheck) {			
			$("#register_form").submit();			
		}
		else {			
			if(!typeCheck) $('.register_type_ck').css('display', 'block');
			if(!takeCheck) $('.register_take_ck').css('display', 'block');			
		}
		
		return false;
		
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
			$('.register_take_ck').css('display', 'block');
			takeCheck = false;		
		}
		else {
			
			if((takeYear < 1900) || (takeYear > (todayYear + 10))) {			
				$('.register_take_ck').css('display', 'block');
				takeCheck = false;			
			}
			else {			
				$('.register_take_ck').css('display', 'none');
				takeCheck = true;			
			}
			
		}
						
	});
		
	$('.take_input').on("propertychange change keyup paste input", function(){
		
		next();
		
	});
		
	$('.mediradio').click(function() {
		
		var $radioChecked = $('input[name="medi"]:checked');
		
		$('.type_input').val($radioChecked.attr('data-type'));
		
		$('#cycle_year').val($radioChecked.attr('data-year'));
		$('#cycle_month').val($radioChecked.attr('data-month'));
		$('#cycle_week').val($radioChecked.attr('data-week'));
		$('#cycle_day').val($radioChecked.attr('data-day'));
		
		typeCheck = true;
		
		$(".register_type_ck").css("display", "none");
		
		next();
		
		var id = $('.id_input').val();
		var type = $('.type_input').val();
		
		var data = {id : id, schType : type};
		
		if(typeCheck == true) {
			
			$.ajax({			
				type : "get",
				url : "/medical/schTypeChk",
				data : data,
				success : function(result){				
					if(result != "fail") {					
						$('.register_type_imposs').css("display", "none");
						typeckCheck = true;					
					}
					else {					
						$('.register_type_imposs').css("display", "inline-block");
						typeckCheck = false;					
					}
				}	
			});
			
		}
		
	});
	
	function next() {
		
		if(typeCheck && takeCheck) {
			
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
	
	}
	
	$('.memo_input').on("propertychange change keyup paste input", function(){
		
		var memo = $('.memo_input').val();
		var memoVal = /^[0-9a-zA-Zㄱ-힣\n\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\" ]*$/;
			
		if(!memoVal.test(memo)) {
			$('.register_memo_val').css('display', 'block');
			memoCheck = false;
		}
		else {
			$('.register_memo_val').css('display', 'none');
			memoCheck = true;
		}
				
	});
		
</script>

<%@include file="../includes/footer.jsp"%>