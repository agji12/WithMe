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