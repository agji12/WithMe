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
</head>
<style>
	.titleBox{text-align:center;}
</style>
<body>
	<header>
		<c:import url="commons/gnb.jsp"></c:import>
	</header>
	<main>
		<form action="/record/toSearchRecord" method="post">
			<div class="container">
				<div class="titleBox">
					<h1>With Me</h1>
				</div>
				<div class="inputBox input-group mb-3">
					<input class="form-control" type="text" name="summonerName" placeholder="소환사명을 입력해 주세요" aria-label="default input example">
					<button class="btn btn-outline-secondary" id="searchBtn">Button</button>
				</div>
			</div>
		</form>
	</main>
</body>
</html>
