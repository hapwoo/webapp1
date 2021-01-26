<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
						<div class="alert alert-secondary" role="alert">
							로그인
						</div>
						<form class="loginform" onsubmit="login()" style="width:200px">
							<div class="form-group">
							    <label for="bwriter">ID</label>
							    <input type="text" class="form-control" id="mid" name="mid" placeholder="아이디를 입력하세요.">
								<small id="errorMid" class="form-text text-danger"></small>
							</div>
							
							<div class="form-group">
							   	<label for="mpassword">password</label>
							   	<input type="password" class="form-control" id="mpassword" name="mpassword" placeholder="비밀번호를 입력하세요.">
								<small id="errorMpassword" class="form-text text-danger"></small>
							</div> <br/>
						  <button type="submit" class="btn btn-light">로그인</button>
						  <a class="btn btn-light" href="boardlist2">취소</a>
						</form>
						<script>
							function login() {
								//<form>태그의 기본 이동 기능을 취소
								event.preventDefault();
								//에러 초기화
								$("#errorMid").html("");
								$("#errorMpassword").html("");
								//입력값 받기
								const mid2 = $("#mid").val();
								
								var validation = true;
								
								if(mid2 === "") {
									$("#errorMid").html("필수 입력 사항입니다.");
									validation = false;
								}
								
								const mpassword2 = $("#mpassword").val();
								if(mpassword2 === "") {
									$("#errorMpassword").html("필수 입력 사항입니다.");
									validation = false;
								}
								
								if(!validation) {
									return;
								}
								
								//Ajax 통신
								$.ajax({
									url: "login",
									method: "post",
									data: {mid:mid2, mpassword:mpassword2},
									success: function(data) {
										//{"result":"success"|wrongMid|wrongMpassword"}
										if(data.result === "success") {
											alert("로그인 성공");
											location.href = "boardlist2";
										} else if(data.result ==="wrongMid") {
											$("#errorMid").html("아이디가 존재하지 않습니다.")
										} else {
											$("#errorMpassword").html("비밀번호가 맞지 않습니다.")
										}
									}
								}); 
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>