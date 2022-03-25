<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<button data-oper="list" class="btn btn-info btn-bottom-margin">목록</button>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			
				<div class="panel-heading">
					<b>일정 조회</b>
					<b class="show_regtype"></b>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
			
					<div class="form-group">
						<label>종류</label>
						<input class="form-control" name="schType" value='<c:out value="${list.schType}"/>' readonly="readonly">
					</div>
		        
					<div class="form-group">
						<label>검사/복용 일자</label>
						<input class="form-control" name="takeDate" value='<c:out value="${list.takeDate}"/>' readonly="readonly">
					</div>
					
					<div class="simple_register_display">
					
						<div class="form-group">
							<div class="cycle-form-group">						
								<label>주기</label><br>
								<input id="cycle_year" size="3" maxlength="2" value='<c:out value="${list.cycleYear}"/>' readonly="readonly" style="text-align:center;" />
								<label for="cycle_year">년&nbsp;&nbsp;</label>
								<input id="cycle_month" size="3" maxlength="2" value='<c:out value="${list.cycleMonth}"/>' readonly="readonly" style="text-align:center;" />
								<label for="cycle_month">개월&nbsp;&nbsp;</label>
								<br>
								<input id="cycle_week" size="3" maxlength="2" value='<c:out value="${list.cycleWeek}"/>' readonly="readonly" style="text-align:center;" />
								<label for="cycle_week">주&nbsp;&nbsp;</label>
								<input id="cycle_day" size="3" maxlength="3" value='<c:out value="${list.cycleDay}"/>' readonly="readonly" style="text-align:center;" />
								<label for="cycle_day">일&nbsp;&nbsp;</label>							
							</div>
						</div>
			                                 
						<div class="form-group">
							<label>다음 일자</label>
							<input class="form-control" name="possDate" value='<c:out value="${list.possDate}"/>' readonly="readonly">
						</div>
					
					</div>
					
					<div class="form-group">
						<label>메모</label>
						<textarea class="form-control" name="memo" rows="3" maxlength="150" readonly="readonly" style="resize: none;"><c:out value="${list.memo}"/></textarea>
					</div>
		          
					<button data-oper="modify" class="btn btn-default pull-right">변경</button>
	
					<form id="operForm" action="/medical/modify" method="get">
						<input type='hidden' id='schType' name='schType' value='<c:out value="${list.schType}"/>'>
						<input type="hidden" class="regtype_input" name="regType" value="${list.regType}">						
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>	
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
						<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>		
					</form>
	
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
	
	var regType = $('.regtype_input').val();

	if(regType == "simple") $('.simple_register_display').css('display', 'none');
		
	if(regType == "normal") $('.show_regtype').text("[일반 일정]");
	else if(regType == "custom") $('.show_regtype').text("[커스텀 일정]");
	else $('.show_regtype').text("[단순 일정]");
	
	$(document).ready(function() {
  
		var operForm = $("#operForm"); 
  
		$("button[data-oper='modify']").on("click", function(e) { 
			operForm.attr("action", "/medical/modify").submit();   
		});
   
		$("button[data-oper='list']").on("click", function(e) {  
			operForm.find("#schType").remove();
			operForm.attr("action", "/medical/list")
			operForm.submit();   
		});  

	});

</script>

<%@include file="../includes/footer.jsp"%>