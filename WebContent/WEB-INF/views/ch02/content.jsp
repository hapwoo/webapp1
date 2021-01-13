<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css">
	</head>

	<body>
		<div class="wrap">
			<%-- 공통 헤더 --%>
			<jsp:include page="/WEB-INF/views/include/header.jsp"/> <%-- 얘는 실행해서 붙여 넣음 --%>
	
			
			<%-- 내용 --%>
			<div class="mainCenter">
				<%-- 공통메뉴 --%>
				<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
			
				<div class="content">
				
					<div class="sector">
						<h5>요청 맵핑</h5>
						<div>
							GET 방식: <a class="btn btn-info btn-sm" style="display:inline-block;" href="getMethod_">request1</a> <!-- get 방식 -->
							<br/>
							<br/>
							POST 방식:
							<form method="post" action="postMethod_" style="display:inline-block;">
								<button class="btn btn-info btn-sm">request1</button>
							</form>
						</div>
					</div>
					
					<div class="sector">
						<h5>요청 방식별 회원 가입 처리</h5>
						<div>
							GET 방식: <a class="btn btn-info btn-sm" style="display:inline-block;"
							href="join">회원가입</a> <!-- get 방식 -->
						</div>
					</div>
					
					<div class="sector">
						<h5>비동기 처리</h5>
						<div>
							GET 방식: <a class="btn btn-info btn-sm" style="display:inline-block;" href="javascript:fun1()">회원가입</a>
							<script>
								const fun1 = function() {
									$.ajax({
										url: "joinAsync",
										method: "get",
										success: function(data) {
											$("#joinForm").html(data);
										}
									});
								};
							</script>
							<div id="joinForm" style="margin-top:10px"></div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>