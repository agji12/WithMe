<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>듀오 찾기</title>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
</head>
<style>
.mainContainer {
	margin-top: 50px;
	width: 1400px;
}

.btnDiv {
	text-align: right;
}

.writeBtnDiv {
	text-align: center;
}

.selectBox {
	display: flex;
}

.selectImg{
	width:25px;
	height:25px;
}

#toAlert {
	display: none;
}
/* 글 리스트 */
textarea{
	resize: none;
}

.duoSearcingList{
	display:flex;
	flex-direction : row;
	flex-wrap : wrap;
}

.positionImage{
	width:30px;
	height:30px;
}

.tierImage{
	width:30px;
	height:30px;
}

.fontBold {
	font-weight:bold;
}
/* 댓글 리스트 */
.dashedHr {
	border-style: dashed;
	margin-bottom: 8px;
}

.duoReplyList{
	height: 73px;
	overflow-y:auto;
}

</style>
<body>
	<header>
		<c:import url="../commons/gnb.jsp"></c:import>
	</header>
	<main>
		<div
			class="mainContainer container-fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<h1 class="mb-3">듀오 찾기</h1>
			<!-- Modal -->
			<form action="/duo/insertDuoSearch" method="post">
				<div class="modal fade" id="modal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">듀오 찾기</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="summonerName"
										name="summonerName" placeholder="abc"> <label
										for="floatingInput">소환사 이름</label>
								</div>
								<div class="selectBox mb-3">
									<select class="form-select" id="queueCode" name="queueCode"
										aria-label="Default select example">
										<option value="0" selected disabled hidden>큐 타입</option>
										<option value="1001">일반</option>
										<option value="1002">솔로 랭크</option>
										<option value="1003">자유 랭크</option>
										<option value="1004">무작위 총력전</option>
									</select> <select class="form-select" id="tierCode" name="tierCode"
										aria-label="Default select example">
										<option value="0" selected disabled hidden>본인
											티어(솔랭기준)</option>
										<option value="101">UNRANK</option>
										<option value="102">아이언</option>
										<option value="103">브론즈</option>
										<option value="104">실버</option>
										<option value="105">골드</option>
										<option value="106">플래티넘</option>
										<option value="107">에매랄드</option>
										<option value="108">다이아몬드</option>
										<option value="109">마스터</option>
										<option value="110">그랜드마스터</option>
										<option value="111">챌린저</option>
									</select>
								</div>
								<small class="text-body-secondary">나의 포지션</small><br>
								<div class="btn-group mb-3" role="group"
									aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="myPositionCode" id="btnradio1" autocomplete="off" value="0">
									<label class="btn btn-outline-secondary" for="btnradio1">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-fill.png">
									</label>

									<input type="radio" class="btn-check" name="myPositionCode" id="btnradio2" autocomplete="off" value="1">
									<label class="btn btn-outline-secondary" for="btnradio2">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-top.png">
									</label>

									<input type="radio" class="btn-check" name="myPositionCode" id="btnradio3" autocomplete="off" value="2">
									<label class="btn btn-outline-secondary" for="btnradio3">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-jungle.png">	
									</label>

									<input type="radio" class="btn-check" name="myPositionCode" id="btnradio4" autocomplete="off" value="3">
									<label class="btn btn-outline-secondary" for="btnradio4">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-middle.png">	
									</label>

									<input type="radio" class="btn-check" name="myPositionCode" id="btnradio5" autocomplete="off" value="4">
									<label class="btn btn-outline-secondary" for="btnradio5">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-bottom.png">
									</label>
									
									<input type="radio" class="btn-check" name="myPositionCode" id="btnradio6" autocomplete="off" value="5">
									<label class="btn btn-outline-secondary" for="btnradio6">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-utility.png">
									</label>
								</div>
								<br> <small class="text-body-secondary">찾는 포지션</small><br>
								<div class="btn-group mb-3" role="group" aria-label="Basic checkbox toggle button group">
									<input type="checkbox" class="btn-check" name="searchingPosition" id="btncheck1" autocomplete="off" value="0">
									<label class="btn btn-outline-secondary" for="btncheck1">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-fill.png">
									</label>
									 
									<input type="checkbox" class="btn-check" name="searchingPosition" id="btncheck2" autocomplete="off" value="1">
									<label class="btn btn-outline-secondary" for="btncheck2">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-top.png">
									</label>

									<input type="checkbox" class="btn-check" name="searchingPosition" id="btncheck3" autocomplete="off" value="2">
									<label class="btn btn-outline-secondary" for="btncheck3">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-jungle.png">
									</label>
									
									<input type="checkbox" class="btn-check" name="searchingPosition" id="btncheck4" autocomplete="off" value="3">
									<label class="btn btn-outline-secondary" for="btncheck4">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-middle.png">
									</label>

									<input type="checkbox" class="btn-check" name="searchingPosition" id="btncheck5" autocomplete="off" value="4">
									<label class="btn btn-outline-secondary" for="btncheck5">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-bottom.png">
									</label>
									
									<input type="checkbox" class="btn-check" name="searchingPosition" id="btncheck6" autocomplete="off" value="5">
									<label class="btn btn-outline-secondary" for="btncheck6">
										<img class="selectImg" src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-utility.png">
									</label>
								</div>
								<div class="form-floating mb-3">
									<textarea class="form-control" name="memo"
										placeholder="Leave a comment here" style="height: 100px"></textarea>
									<label for="floatingTextarea2">메모</label>
								</div>
								<div class="form-check form-switch">
									<label class="form-check-label" for="flexSwitchCheckDefault">마이크
										여부</label> <input class="form-check-input" type="checkbox"
										role="switch" id="microphone" name="microphone">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button class="btn btn-primary" id="writeBtn">글 등록하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="mb-5 btnDiv">
				<button type="button" data-bs-toggle="modal" data-bs-target="#modal"
					class="btn btn-primary" id="toModal">글 쓰기</button>
				<button type="button" class="btn btn-primary" id="toAlert">글
					쓰기</button>
			</div>
			<!-- 글 List -->
			<div class="duoSearcingList">
			<c:forEach var="i" items="${duoList}">
				<div class="col-3 mb-3">
					<div class="card" style="width: 318px;">
						<div class="card-body">
							<h6 class="fontBold"><span class="badge bg-secondary">${i.queueName}</span> ${i.searchingPosition} 구해요</h6>
							<div class="mb-2">
								<c:choose>
									<c:when test="${i.tierName.equals('UNRANK')}">
										<img class="tierImage" src="/resources/tierImages/none-disabled.png"> <small class="fontBold">${i.tierName}</small>
									</c:when>
									<c:otherwise>
										<img class="tierImage" src="/resources/tierImages/${i.tierName}.png"> <small class="fontBold">${i.tierName}</small>
									</c:otherwise>
								</c:choose>
								<br>
								<img class="positionImage" src="/resources/positionImages/${i.positionName}.png">
								<small class="text-body">${i.summonerName} (${i.nickname})</small>
								<c:choose>
									<c:when test="${i.microphone.equals('T')}">
										<i class="bi bi-mic-fill"></i>
									</c:when>
									<c:otherwise>
										<i class="bi bi-mic-mute-fill"></i>
									</c:otherwise>
								</c:choose>
							</div>
							<textarea class="form-control" placeholder="Leave a comment here" readonly style="height: 150px; font-size:small;">${i.memo}</textarea>
							<hr>
							<!-- 댓글 List -->
							<form action="/duo/insertDuoReply" method="post" class="row g-3">
  								<div class="col-auto">
  									<input type="hidden" name="duoCode" value="${i.duoCode}">
  									<input type="hidden" name="memberCode" value="${i.memberCode}">
    								<input type="text" class="form-control" name="content" placeholder="로그인 후 이용해 주세요">
  								</div>
  								<div class="col-auto">
   									<button type="submit" class="btn btn-primary">입력</button>
								</div>
							</form>
							<hr class="dashedHr">
							<div class="duoReplyList">
								<c:forEach var="j" items="${duoReplyList}">
									<c:if test="${j.duoCode == i.duoCode}">
										<small>${j.nickname}</small> <small class="text-body-secondary">${j.content}</small><br>
									</c:if>
								</c:forEach>
							</div>
						</div>						
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</main>
</body>
<script>
	
	// 로그인한 경우에만 글 작성 modal 보이도록 설정
	$(document).ready(function(){
		let memberCode = '<%=session.getAttribute("memberCode")%>';

		if (memberCode == "null") {
			$("#toModal").hide();
			$("#toAlert").show();
		}
	})

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

				console.log($("#microphone").is(":checked"));
				let check = $("#microphone").is(":checked")
				$("#microphone").val(check);

				return writeFlag;
			})
	
	// 찾는 포지션 입력
	function valueTest(v){
		console.log("aa");
	}
	

			
</script>
</html>