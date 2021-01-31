<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			<%--공통 헤더--%>
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
			
			<%--내용--%>
			<div class="mainCenter">
				<%--공통메뉴--%>
				<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
				
				<div class="content">
					<div class="sector">
						<h5>연결 테스트</h5>
						<div>
							<a class="btn btn-success btn-sm" href="javascript:conntest()">연결 테스트</a>
							<script>
							const conntest = () => {
								$.ajax({
									url: "conntest",
									method: "get",
									success: function(data){
									 	$("#result1").html(data);
									}
								});
							};
							</script>
							<div id="result1"></div>
						</div>
					</div>
					
					<div class="sector">
						<h5>Json 응답 받기</h5>
						<div>
							<a class="btn btn-success btn-sm" href="javascript:jsonresponse1()">객체 {} 받기</a>
							<script>
								const jsonresponse1 = () => {
									$.ajax({
										url: "jsonresponse1",
										method: "get",
										success: function(data){
										 	console.log(data);
										 	$("#name").html(data.name)
										 	$("#age").html(data.age)
										 	$("#car_kind").html(data.car.kind)
										 	$("#car_color").html(data.car.color)
										 	
										 	for(var i=0; i<data.hobby.length; i++) {
										 		var h = data.hobby;
										 		$("#hobby").append(h +",") 
										 	}
										}
									});
								};
								
							</script>
							<div id="result2">
								<div id="name"></div>
								<div id="age"></div>
								<div id="car_kind"></div>
								<div id="car_color"></div>
								<div id="hobby"></div>
							</div>
							
							<a class="btn btn-success btn-sm" href="javascript:jsonresponse2()">배열 [] 받기</a>
							<script>
								function jsonresponse2() {
									$.ajax({
										url: "jsonresponse2",
										success: function(data) {
											console.log(data);
											for(var i=0; i<data.length; i++) {
												var board = data[i];
												$("#result3 tbody").append("<tr>");
												$("#result3 tbody").append("<td>" + board.bno + "</td>");
												$("#result3 tbody").append("<td>" + board.btitle + "</td>");
												$("#result3 tbody").append("<td>" + board.bwriter + "</td>");
												$("#result3 tbody").append("</tr>");
											}
										}
									});
								};
							</script>
							<div id="result3">
								<table>
									<thead>
										<tr>
											<td>번호</td>
											<td>제목</td>
											<td>글쓴이</td>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
			<!-- 		<div class="sector">
						<h5>PK로 검색하기</h5>
						<div>
							<a class="btn btn-success btn-sm" href="employee?employee_id=100">사번 = 100 정보 가져오기</a>
							<a class="btn btn-success btn-sm" href="employee?employee_id=101">사번 = 101 정보 가져오기</a>
						</div>
					</div> -->
					
					<div class="sector">
						<h5>PK로 검색하기</h5>
						<div>
							<a class="btn btn-success btn-sm" href="javascript:getEmployee(100)">사번 = 100 정보 가져오기</a>
							<a class="btn btn-success btn-sm" href="javascript:getEmployee(101)">사번 = 101 정보 가져오기</a>
							<script>
							const getEmployee = () => {
								$.ajax ({
									url: "employee",
									data: {employee_id: eid},
									success: data => {
										console.log(data);
										$("#eno").html(data.employee_id);
										$("#first").html(data.first_name);
										$("#last").html(data.last_name);
									}
								});
							};
						
							</script>
						
							<div id="result4">
								사번: <span id="eno"></span> <br/>
								이름: <span id="first"></span> <br/>
								성: <span id="last"></span> <br/>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</body>
</html>