<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Me</title>
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
<!--  home css -->
<link href="/resources/css/home.css" rel="stylesheet" type="text/css">
<!--  home js -->
<script src="/resources/js/home.js" defer></script>
</head>
<body>
	<header>
		<c:import url="commons/gnb.jsp"></c:import>
	</header>
	<main>
		<form action="/record/toSearchRecord" method="get">
			<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
			<div class="container" style="margin-top:50px;">
				<div style="text-align:center; color:red;">${errMsg}</div>
				<div class="titleBox m-3">
					<h1 style="font-weight:bold;">With Me</h1>
				</div>
				<div class="inputBox input-group">
					<input class="form-control" type="text" id="summonerName" name="summonerName" placeholder="소환사명을 입력해 주세요" aria-label="default input example">
					<button class="btn btn-outline-secondary" id="searchBtn">Button</button>
				</div>
				<small class="text-body-secondary"><i class="bi bi-info-circle-fill"></i> 한글 이름의 경우 띄어쓰기를 꼭 해주세요!</small>
			</div>
		</form>
	</main>
</body>
</html>
