// 로그인한 경우에만 글 작성 modal 보이도록 설정
$("#toAlert").on("click", function() {
	alert("로그인 후 진행해 주시기 바랍니다!");
})

// 듀오 찾기 글 유효성 검사
$("#writeBtn").on("click", function() {
	let writeFlag = true;
	let summonerName = document.getElementById("summonerName");
	let queueCode = document.getElementById("queueCode");
	let tierCode = document.getElementById("tierCode");

	if (summonerName.value == "") {
		summonerName.className = "form-control is-invalid";
		writeFlag = false;
	} else {
		summonerName.className = "form-control";
		writeFlag = true;
	}

	if (queueCode.value == 0) {
		queueCode.className = "form-select is-invalid";
		writeFlag = false;
	} else {
		queueCode.className = "form-select";
		writeFlag = true;
	}

	if (tierCode.value == 0) {
		tierCode.className = "form-select is-invalid";
		writeFlag = false;
	} else {
		tierCode.className = "form-select";
		writeFlag = true;
	}

	// 주 포지션 체크 확인
	let btnradio1 = $("#btnradio1").is(":checked");
	let btnradio2 = $("#btnradio2").is(":checked");
	let btnradio3 = $("#btnradio3").is(":checked");
	let btnradio4 = $("#btnradio4").is(":checked");
	let btnradio5 = $("#btnradio5").is(":checked");
	let btnradio6 = $("#btnradio6").is(":checked");

	if (!btnradio1 && !btnradio2 && !btnradio3 && !btnradio4
			&& !btnradio5 && !btnradio6) {
		writeFlag = false;
	}

	// 찾는 포지션 체크 확인
	let btncheck1 = $("#btncheck1").is(":checked");
	let btncheck2 = $("#btncheck2").is(":checked");
	let btncheck3 = $("#btncheck3").is(":checked");
	let btncheck4 = $("#btncheck4").is(":checked");
	let btncheck5 = $("#btncheck5").is(":checked");
	let btncheck6 = $("#btncheck6").is(":checked");

	if (!btncheck1 && !btncheck2 && !btncheck3 && !btncheck4
			&& !btncheck5 && !btncheck6) {
		writeFlag = false;
	}

	let check = $("#microphone").is(":checked")
	$("#microphone").val(check);

		return writeFlag;
})