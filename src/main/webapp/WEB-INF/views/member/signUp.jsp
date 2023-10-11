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
</head>
<style>
	.mainContainer{margin-top:50px; width:70%;}
	.btnDiv{text-align:center;}
	#authBtn{display:none;}
	.authBox{display:none;}
	.secondPage{display:none;}
	.thirdPage{display:none;}
	.emailCheckPage{display:none;}
	.signInSuccessPage{display:none;}
	.label{font-weight:bold;}
	.birthdayBox{display:flex;}
</style>
<body>
	<header>
		<c:import url="../commons/gnb.jsp"></c:import>
	</header>
	<main>
		<div class="mainContainer container-fluid shadow p-3 mb-5 bg-body-tertiary rounded">
		<form action="/member/signUp" method="post">
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
	// 이메일 인증 번호 담을 변수
	let authNumber;
	
	// 이메일 유효성 검사
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
	
	// 이메일 전송
	$("#sendMailBtn").on("click", function(){
		let email = $("#email").val();
				
		$.ajax({
			url:"/member/toMailSend",
			type:"post",
			async: false,
			dataType:"json",
			data:{
				email:email
			}
		}).done(function(resp){
			if(resp){
				authNumber = resp;
				
				// 숫자 인증 칸 보여주기
				$("#email").attr("disabled", true);
				$(".authBox").show();
				$("#sendMailBtn").hide();
				$("#authBtn").show();
			}
		})
	})
	
	// 인증 메일 일치 여부 확인
	$("#authBtn").on("click", function(){
		let email = $("#email").val();
		let authInput = $("#authInput").val();
		
		// 이메일 중복 검사
		$.ajax({
			url:"/member/emailCheck",
			type:"post",
			dataType:"json",
			data:{
				email:email
			}
		}).done(function(resp){
			if(authInput == authNumber && resp == false){
				$("#email").attr("disabled", false); // disabled를 풀어줘야 form에서 값이 넘어감
				$(".firstPage").hide();
				$(".secondPage").show();
			}else if(authInput == authNumber && resp == true){
				$(".firstPage").hide();
				$(".emailCheckPage").show();
			}else{
				alert("인증 번호가 일치하지 않습니다.\n다시 입력하여 주시기 바랍니다!");
				$("#authInput").val("");
			}
		})
		
	})
	
	// 비밀번호 유효성 검사
	$(".password").on("keyup", function(){
		let regexPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		let pw = $("#password").val();
		let pwCheck = $("#passwordCheck").val();
		
		let resultPw = regexPw.exec(pw);
		
		if(resultPw){
			$(".passwordValidCheck").html("");
		}else{
			$(".passwordValidCheck").html("<i class='bi bi-exclamation-circle'></i> 비밀번호의 형식이 일치하지 않습니다.").css({"color":"red", "font-size":"small"});
		}
		
		// 비밀번호, 재입력 일치 여부 확인
		if(pw == pwCheck && resultPw != null){
			$("#nextBtn").attr("disabled", false);
		}else{
			$("#nextBtn").attr("disabled", true);
		}
	})
	
	// 비밀번호 설정 후 세번째 페이지로 이동
	$("#nextBtn").on("click", function(){
		$(".secondPage").hide();
		$(".thirdPage").show();
		// 다른 페이지에서 엔터 누르면 signUpBtn이 눌려서 disabled 설정해둠
		$("#signUpBtn").attr("disabled", false);
	})
	
	// 닉네임 유효성 검사
	let nicknameValidFlag = false;
	
	$("#nickname").on("keyup", function(){
		let regexNick = /^[A-Za-z가-힣ㄱ-ㅎ0-9]{2,12}$/;
		let nickname = $("#nickname").val();
		
		let resultNick = regexNick.exec(nickname);
		
		// 닉네임 중복 검사
		$.ajax({
			url:"/member/nicknameCheck",
			type:"post",
			dataType:"json",
			data:{
				nickname : nickname
			}
		}).done(function(resp){
			if(resultNick != null && resp == false){
				$(".nicknameValidCheck").html("");
				nicknameValidFlag = true;
			}else if(resultNick != null && resp == true){
				$(".nicknameValidCheck").html("<i class='bi bi-exclamation-circle'></i> 이미 존재하는 닉네임입니다.").css({"color":"red", "font-size":"small"});
				nicknameValidFlag = false;
			}else{
				$(".nicknameValidCheck").html("<i class='bi bi-exclamation-circle'></i> 닉네임의 형식이 일치하지 않습니다.").css({"color":"red", "font-size":"small"});
				nicknameValidFlag = false;
			}
		})
	})
	
	// 생년월일 숫자만 입력할 수 있도록 설정
	function inputOnlyNumber(birthday){
		birthday.value = birthday.value.replace(/[^0-9]/g, '');
	}
	
	// 생년월일 유효성 검사
	let birthdayValidFlag = false;
	
	$("#birthday").on("keyup", function(){
		let birthday = $("#birthday").val();
		
		let year = Number(birthday.substr(0,4)); // 년 추출
		let month = Number(birthday.substr(4,2)); // 월 추출
		let day = Number(birthday.substr(6,2)); // 일 추출
		
		let today = new Date();
		let todayYear = today.getFullYear(); // 올해 연도
		
		if (birthday.length == 8) {
			// 연도의 경우 1950 보다 작거나 todayYear 보다 크다면 false를 반환합니다.
			if (year < 1950 || year > todayYear){
				$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 연도를 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
				return false;
				
			} else if (month < 1 || month > 12) {
				$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 월을 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
				return false;
				
			} else if (day < 1 || day > 31) {
				$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 일을 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
				return false;
				
			} else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 일을 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
				return false;
				
			} else if (month == 2) {
				let isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if (day>29 || (day==29 && !isleap)) {
					$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 일을 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
					return false;
				} else {
					birthdayValidFlag = true;
					$(".birthdayValidCheck").html("");
					return true;
				}
			} else {
				birthdayValidFlag = true;
				$(".birthdayValidCheck").html("");
				return true;
			}
		}else{
			$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 생년월일의 형식이 일치하지 않습니다.").css({"color":"red", "font-size":"small"});			
		}
	})
	
	// 가입 버튼 눌렀을 때
	$("#signUpBtn").on("click", function(){
		if(nicknameValidFlag == true && birthdayValidFlag == true){
			return true;
		}else{
			alert("닉네임과 생년월일을 정확하게 입력해 주세요!");
			return false;
		}
	})
	
	// 회원 가입 완료 시
	if(${signUpSuccess == "true"}) {
		$(".firstPage").hide();
		$(".signInSuccessPage").show();
	}
	
</script>
</html>