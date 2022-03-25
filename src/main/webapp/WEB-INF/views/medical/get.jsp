<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<button type="submit" class="btn btn-info btn-bottom-margin list_button">목록</button>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>
						<b>일정 조회/변경/삭제</b>
						<b class="show_regtype get_panel_head_text"></b>
						<button type="submit" class="btn btn-danger pull-right remove_button get_panel_content_hidden">삭제</button>
					</p>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body get_panel_content_hidden">
				
					<form role="form" action="/medical/modify" method="post">
					
						<%-- For paging with pageNum and amount --%>
						<input type='hidden' class="pagenum_input" name='pageNum' value='<c:out value="${cri.pageNum}" />'>
						<input type='hidden' class="amount_input" name='amount' value='<c:out value="${cri.amount}" />'>
						<input type='hidden' class="type_input" name='type' value='<c:out value="${cri.type}" />'>
						<input type='hidden' class="keyword_input" name='keyword' value='<c:out value="${cri.keyword}" />'>
								
						<div class="form-group">
							<label>종류</label>
							<input class="form-control schtype_input" name="schType" value='<c:out value="${list.schType}"/>' readonly="readonly">
						</div>
		        
						<div class="form-group">
							<label>검사/복용 일자</label>
							<input class="form-control take_input" type="date" name="takeDate" value=
								'<fmt:parseDate value="${list.takeDate}" pattern="yyyy-MM-dd" var="parsedTakeTime" type="both" /><fmt:formatDate pattern="yyyy-MM-dd" value="${parsedTakeTime}" />'>
							<span class="get_take_ck mobile_text">검사/복용 일자를 알맞게 입력해주세요. (이번 해 + 10년까지만 적용 가능합니다.)</span>
						</div>
						
						<div class="simple_register_display">
						
							<div class="form-group">
								<div class="cycle-form-group">						
									<label>주기</label><br>
									<input id="cycle_year" name="cycleYear" size="3" maxlength="2" value='<c:out value="${list.cycleYear}"/>' readonly="readonly" style="text-align:center;" />
									<label for="cycle_year">년&nbsp;&nbsp;</label>
									<input id="cycle_month" name="cycleMonth" size="3" maxlength="2" value='<c:out value="${list.cycleMonth}"/>' readonly="readonly" style="text-align:center;" />
									<label for="cycle_month">개월&nbsp;&nbsp;</label>
									<br>
									<input id="cycle_week" name="cycleWeek" size="3" maxlength="2" value='<c:out value="${list.cycleWeek}"/>' readonly="readonly" style="text-align:center;" />
									<label for="cycle_week">주&nbsp;&nbsp;</label>
									<input id="cycle_day" name="cycleDay" size="3" maxlength="3" value='<c:out value="${list.cycleDay}"/>' readonly="readonly" style="text-align:center;" />
									<label for="cycle_day">일&nbsp;&nbsp;</label>							
								</div>
							</div>
			           			                                 
							<div class="form-group">
								<label>다음 일자</label>
								<input class="form-control poss_input" type="date" name="possDate" readonly="readonly" value=
									'<fmt:parseDate value="${list.possDate}" pattern="yyyy-MM-dd" var="parsedPossTime" type="both" /><fmt:formatDate pattern="yyyy-MM-dd" value="${parsedPossTime}" />'>
							</div>
						
						</div>
						
						<div class="form-group">
							<label>메모</label>
							<textarea class="form-control memo_input" name="memo" rows="3" maxlength="150" style="resize: none;"><c:out value="${list.memo}"/></textarea>
							<span class="get_memo_val mobile_text">사용할 수 없는 문자가 있습니다.</span>
						</div>
		          
						<button type="submit" data-oper="modify" class="btn btn-default pull-right modify_button">적용</button>
	
						<input type="hidden" class="id_input" name="id" value='<sec:authentication property="principal.username"/>'>
						<input type="hidden" class="regtype_input" name="regType" value="${list.regType}">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
					</form>
	
				</div>
				<!--  end panel-body -->
				
				<div class="panel-body get_panel_content_display">
					삭제 등의 이유로 존재하지 않는 일정입니다.
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

<script type="text/javascript">

	var formObj = $("form");

	var regType = $('.regtype_input').val();

	if(regType == "simple") $('.simple_register_display').css('display', 'none');
		
	if(regType == "normal") $('.show_regtype').text("[일반 일정]");
	else if(regType == "custom") $('.show_regtype').text("[커스텀 일정]");
	else $('.show_regtype').text("[단순 일정]");
	
	$(document).ready(function() {
		
		var schType = $('.schtype_input').val();
		
		if(schType == '') {
			$('.get_panel_content_hidden').css('display', 'none');
			$('.get_panel_content_display').css('display', 'block');
			$('.get_panel_head_text').css('display', 'none');
		}
		
		$('.list_button').on("click", function(e){
		    
			e.preventDefault(); 
		    
			formObj.attr("action", "/medical/list").attr("method", "get");
		      
			// For remember page
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			// For search
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();    
						      
			formObj.empty(); 
		      
			// For remember page
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			
			// For search
			formObj.append(keywordTag);
			formObj.append(typeTag);     
			
			formObj.submit();
		
		});
		
		$('.remove_button').on("click", function(e){
		    
			if(confirm("정말 삭제하시겠습니까?") == true) {				
				e.preventDefault();   			 
				formObj.attr("action", "/medical/remove");				
				formObj.submit();				
			}
			else return;
		
		});
				
	});
	
	var takeCheck = true;
	var memoCheck = true;
	
	$('.modify_button').click(function() {
		
		if(takeCheck && memoCheck) {			
			formObj.submit();			
		}
		else {			
			if(!takeCheck) $('.modify_take_ck').css('display', 'block');			
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
		
		var poss = $('.poss_input').val();		
		var possYear = Number(poss.split("-")[0]);
		var possMonth = Number(poss.split("-")[1]);
		var possDay = Number(poss.split("-")[2]);
		
		if((takeYear == 0) || (isNaN(takeMonth)) || (isNaN(takeDay))) {			
			$('.get_take_ck').css('display', 'block');
			takeCheck = false;			
		}
		else {
			
			if(takeYear < 1900 || takeYear > (todayYear + 10)) {				
				$('.get_take_ck').css('display', 'block');
				takeCheck = false;				
			}
			else {				
				$('.get_take_ck').css('display', 'none');
				takeCheck = true;				
			}
			
		}
		
		if(regType == "simple") {
			
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
			
		}		
		else next();
		
	});
	
	function next() {
		
		if(takeCheck) {
			
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
			$('.get_memo_val').css('display', 'block');
			memoCheck = false;
		}
		else {
			$('.get_memo_val').css('display', 'none');
			memoCheck = true;
		}
				
	});
	
</script>

<%@include file="../includes/footer.jsp"%>