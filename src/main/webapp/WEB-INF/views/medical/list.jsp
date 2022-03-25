<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<div class="panel-body" style="padding-top: 0px;">
		<button id="userBtn" type="button" class="btn btn-primary pull-right" onclick="location.href='/medical/info'">계정</button>
	</div>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
			
					<b>개인 일정 목록</b>
					
					<div class="btn-group pull-right" style="margin-top:-8px;">
						<button class="btn">등록</button>
						<button class="btn dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-right">
							<li id="regBtn"><a href="#" style="line-height: 200%;">일반 일정 등록</a></li>
							<li id="cusRegBtn"><a href="#" style="line-height: 200%;">커스텀 일정 등록</a></li>
							<li id="simRegBtn"><a href="#" style="line-height: 200%;">단순 일정 등록</a></li>
						</ul>
					</div>	
												
				</div>
				<!-- /.panel-heading -->
						
				<div class="panel-body">	
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="mobile_text" style='text-align: center'>종류</th>
								<th class="mobile_text" style='text-align: center'>검사/복용 일자</th>
								<th class="mobile_text" style='text-align: center'>다음 일자</th>
							</tr>
						</thead>
						
						<c:forEach items="${list}" var="list">
							<tr>
								<td class="mobile_text">
									<a class="move" href='<c:out value="${list.schType}" />'>
										<c:out value="${list.schType}" />							
									</a>
								</td>
								<td class="mobile_text" style='text-align: center'>
									<fmt:parseDate value="${list.takeDate}" pattern="yyyy-MM-dd" var="parsedTakeTime" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedTakeTime}" />
								</td>
								<td class="mobile_text" style='text-align: center'>
									<c:if test="${list.regType ne 'simple'}">
										<fmt:parseDate value="${list.possDate}" pattern="yyyy-MM-dd" var="parsedPossTime" type="both" />
										<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedPossTime}" />
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
					
					<div class='row'>
						<div class="col-lg-12">
						
							<form id='searchForm' action="/medical/list" method='get'>
							
								<select name='type'>
									<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}" />>
										종류
									</option>
								</select> 
								
								<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />' size="15em" />
								<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
								<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
								
								<button class='btn btn-default'>검색</button>
								
							</form>
							
						</div>
					</div>
					
					
					<div class='pull-right'>
						<ul class="pagination">
	
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage - 1}">이전</a>
								</li>
							</c:if>
	
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""}" >
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>
	
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage + 1}">다음</a>
								</li>
							</c:if>
	
						</ul>
					</div>
					<!--  end Pagination -->
					
					<form id='actionForm' action="/medical/list" method='get'>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}" />'>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}" />'>
						<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />'>
						<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />'>
					</form>
																				
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<!-- Modal : jQuery -->
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#regBtn").on("click", function() {
			self.location = "/medical/register";
		});
		
		$("#cusRegBtn").on("click", function() {
			self.location = "/medical/cusRegister";
		});
		
		$("#simRegBtn").on("click", function() {
			self.location = "/medical/simRegister";
		});
		
		// For paging
		
		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {			
					e.preventDefault();
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();					
		});
		
		// For list page <-> (get) one board page
		
		$(".move").on("click",function(e) {		
					e.preventDefault();
					actionForm.append("<input type='hidden' name='schType' value='"+ $(this).attr("href")+ "'>");
					actionForm.attr("action", "/medical/get");
					actionForm.submit();				
		});
		
		// For search
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
	 
			if(!searchForm.find("input[name='keyword']").val()) {			
				alert("키워드를 입력하세요");
				return false;				
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();

			searchForm.submit();

		});

	});
	
</script>

<%@include file="../includes/footer.jsp"%>


