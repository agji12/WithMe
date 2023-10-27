//소환사명 공백 입력 못하도록
$("#searchBtn").on("click", function(){
	if($("#summonerName").val() == ''){
		alert("소환사명을 입력해 주세요");
		return false;
	}
})