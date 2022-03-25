<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<button class="btn btn-info btn-bottom-margin" onclick="location.href='/medical/info'">이전 화면</button>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>사용 설명서</b>
				</div>
				<!-- /.panel-heading -->			
				<div class="panel-body">
																																
					<div class="form-group">
						<textarea class="manual-textarea mobile_textarea_text" rows="13" cols="70" readonly="readonly"><c:out value="${manual}"/></textarea>
					</div>
			     		     	
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

<%@include file="../includes/footer.jsp"%>