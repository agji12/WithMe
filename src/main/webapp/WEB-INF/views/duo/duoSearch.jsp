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
	width: 70%;
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

</style>
<body>
	<header>
		<c:import url="../commons/gnb.jsp"></c:import>
	</header>
	<main>
		<div
			class="mainContainer container-fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<h1 class="mb-3">듀오 찾기</h1>
			<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="form-floating mb-3">
 								<input type="text" class="form-control" placeholder="abc">
  								<label for="floatingInput">소환사 이름</label>
							</div>
							<div class="selectBox mb-3">
								<select class="form-select" aria-label="Default select example">
									<option selected>큐 타입</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
								<select class="form-select" aria-label="Default select example">
									<option selected>티어(솔랭기준)</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
							<div class="btn-group mb-3" role="group" aria-label="Basic radio toggle button group">
  								<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btnradio1"> * </label>

  								<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
 								<label class="btn btn-outline-secondary" for="btnradio2">Top</label>

  								<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btnradio3">Jug</label>
  								
  								<input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btnradio4">Mid</label>
  								
  								<input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btnradio5">AD</label>
  								
  								<input type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btnradio6">Sup</label>
							</div>
							<div class="btn-group mb-3" role="group" aria-label="Basic checkbox toggle button group">
  								<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btncheck1"> * </label>

								<input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btncheck2">Top</label>

  								<input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btncheck3">Jug</label>
  								
  								<input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btncheck4">Mid</label>
  								
  								<input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btncheck5">AD</label>
  								
  								<input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
  								<label class="btn btn-outline-secondary" for="btncheck6">Sup</label>
							</div>
							<div class="form-floating mb-3">
								<textarea class="form-control" placeholder="Leave a comment here" style="height: 100px"></textarea>
								<label for="floatingTextarea2">메모</label>
							</div>
							<div class="form-check form-switch">
  								<label class="form-check-label" for="flexSwitchCheckDefault">마이크 여부</label>
  								<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary">글 등록하기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="mb-3 btnDiv">
				<button type="button" data-bs-toggle="modal"
					data-bs-target="#modal" class="btn btn-primary">글 쓰기</button>
			</div>
			<div class="col-12 col-lg-8 mb-3">글들 모음 ..</div>
		</div>
	</main>
</body>
<script>
	$("#toPopupBtn").on("click", function() {
		$(".modalWrap").show();
	})

	$("#modalCloseBtn").on("click", function() {
		$(".modalWrap").hide();
	})
</script>
</html>