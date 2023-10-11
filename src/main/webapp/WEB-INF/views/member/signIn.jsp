<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- jQeury -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
</head>
<style>
	.mainContainer{margin-top:50px; width:70%;}
	.btnDiv{text-align:center;}
	.label{font-weight:bold;}
</style>

<body>
	<header>
		<c:import url="../commons/gnb.jsp"></c:import>
	</header>
	<main>
		<div class="mainContainer container-fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<h1>With Me 로그인</h1>
			<form action="/member/signIn" method="post">
				<div class="col-12 col-lg-8 mb-3">
					<label for="exampleFormControlInput1" class="form-label label">이메일 주소</label>
					<input type="text" id="email" name="email" class="form-control" placeholder="name@example.com">
					<div class="emailValidCheck"></div>
				</div>
				<div class="col-12 col-lg-8 mb-3">
					<label for="inputPassword5" class="form-label label">비밀번호</label>
					<input type="password" id="password" name="password" class="form-control password" placeholder="********" aria-describedby="passwordHelpBlock">
					<a href="#" class="link-primary" style="font-size:small;">비밀번호 찾기</a>
				</div>
				<div class="col-12 col-lg-8 mb-3 btnDiv">
					<button id="signInBtn" class="btn btn-primary">로그인</button>
				</div>
				<div class="mb-3">
					<a class="icon-link icon-link-hover" href="/member/toSignUp">
 				 		지금 바로 회원 가입하러 가기<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
						</svg>
					</a>
				</div>
			</form>
		</div>
	</main>
</body>
<script>
	//이메일 유효성 검사
	$("#email").on("keyup", function(){
		let regexEmail = /.+?@.+?\.com/;
		let email = $("#email").val();
	
		let resultEmail = regexEmail.exec(email);
	
		if(resultEmail){
			$(".emailValidCheck").html("");
			$("#sendMailBtn").attr("disabled", false);
		}else {
			$(".emailValidCheck").html("<i class='bi bi-exclamation-circle'></i>이메일의 형식이 일치하지 않습니다.").css({"color":"red", "font-size":"small"});
			$("#sendMailBtn").attr("disabled", true);
		}
	})

	// 로그인 정보가 일치하지 않을 때
	if(${signInSuccess == "false"}){
		alert("이메일과 비밀번호를 다시 확인하여 주시기 바랍니다!");
	}
	
</script>
</html>