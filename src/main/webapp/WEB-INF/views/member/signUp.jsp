<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jQeury -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
<!-- Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<!--  signUp css -->
<link href="/resources/css/member/signUp.css" rel="stylesheet" type="text/css">
<!--  signUp js -->
<script src="/resources/js/member/signUp.js" defer></script>
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp"></c:import>
	</header>
	<main>
		<div class="container shadow p-3 mb-5 bg-body-tertiary rounded" style="margin-top:50px;">
		<form action="/member/signUp" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="mb-3">
				<h1 style="font-weight:bold;">With Me 회원 가입</h1>
			</div>
			<div class="firstPage">
				<div class="col-12 col-lg-8 mb-3 emailBox">
					<label for="exampleFormControlInput1" class="form-label label">이메일 주소</label>
					<input type="text" class="form-control" id="email" name="email" placeholder="name@example.com">
					<div class="emailValidCheck"></div>
				</div>
				<div class="col-12 col-lg-8 mb-3 authBox">
					<label for="exampleFormControlInput1" class="form-label label">인증 번호</label>
					<input type="text" class="form-control" id="authInput" placeholder="6자리 인증 번호를 입력해 주세요" aria-label="default input example">
				</div>
				<div class="col-12 col-lg-8 mb-3 btnDiv">
					<button type="button" id="sendMailBtn" class="btn btn-primary" disabled>다음</button>
					<button type="button" id="authBtn" class="btn btn-primary">인증하기</button>
				</div>
			</div>
			<div class="secondPage">
				<div class="col-12 col-lg-8 mb-3">
					<label for="inputPassword5" class="form-label label">비밀번호</label>
					<input type="password" id="password" name="password" class="form-control password" aria-describedby="passwordHelpBlock">
					<div id="passwordHelpBlock" class="form-text">
						영문, 숫자, 특수문자가 적어도 1개씩 포함된 8~15자로 입력해 주세요!
					</div>
					<div class="passwordValidCheck"></div>
				</div>
				<div class="col-12 col-lg-8 mb-3">
					<label for="inputPassword5" class="form-label label">비밀번호 재입력</label>
					<input type="password" id="passwordCheck" class="form-control password" aria-describedby="passwordHelpBlock">
				</div>
				<div class="col-12 col-lg-8 mb-3 btnDiv">
					<button type="button" id="nextBtn" class="btn btn-primary" disabled>다음</button>
				</div>
			</div>
			<div class="thirdPage">
				<div class="col-12 col-lg-8 mb-3">
  					<label for="exampleFormControlInput1" class="form-label label">닉네임</label>
 					<input type="text" class="form-control" id="nickname" name="nickname">
 					<div id="passwordHelpBlock" class="form-text">
						특수문자를 제외한 2~12자로 입력해 주세요!
					</div>
					<div class="nicknameValidCheck"></div>
				</div>
				<div class="col-12 col-lg-8 mb-3">
  					<label for="exampleFormControlInput1" class="form-label label">생년월일</label>
  					<input type="text" class="form-control" id="birthday" name="birthday" maxlength="8" oninput="inputOnlyNumber(this)">
  					<div id="passwordHelpBlock" class="form-text">
						연도/월/일 순으로 입력해 주세요!
					</div>
  					<div class="birthdayValidCheck"></div>
				</div>
				<div class="col-12 col-lg-8 mb-3 btnDiv">
					<button type="submit" id="signUpBtn" class="btn btn-primary" disabled>가입하기</button>
				</div>
			</div>
			<div class="emailCheckPage mb-3">
				<h3>이미 존재하는 이메일입니다.</h3>
				아래의 링크를 통해 로그인을 할 수 있습니다!
			</div>
			<div class="signInSuccessPage mb-3">
				<h3>회원 가입을 축하합니다! <i class="bi bi-emoji-smile"></i></h3>
				아래의 링크를 통해 로그인을 할 수 있습니다!
			</div>
			<div class="toSignInBox mb-3">
				<a class="icon-link icon-link-hover" href="/member/toSignIn">
 			 		다시 로그인하러 가기<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
					</svg>
				</a>
			</div>
		</form>
		</div>
	</main>
</body>
<script>
	// 회원 가입 완료 시
	if(${signUpSuccess == "true"}) {
		$(".firstPage").hide();
		$(".signInSuccessPage").show();
	}	
</script>
</html>