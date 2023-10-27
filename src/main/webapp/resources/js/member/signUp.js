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
			birthdayValidFlag = false;
			return false;
				
		} else if (month < 1 || month > 12) {
			$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 월을 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
			birthdayValidFlag = false;
			return false;
				
		} else if (day < 1 || day > 31) {
			$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 일을 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
			birthdayValidFlag = false;
			return false;
				
		} else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 일을 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
			birthdayValidFlag = false;
			return false;
				
		} else if (month == 2) {
			let isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>29 || (day==29 && !isleap)) {
				$(".birthdayValidCheck").html("<i class='bi bi-exclamation-circle'></i> 일을 정확하게 입력해 주세요").css({"color":"red", "font-size":"small"});
				birthdayValidFlag = false;
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
		birthdayValidFlag = false;
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
	
	