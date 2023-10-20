<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소환사 정보</title>
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
</head>
<style>
container {
	background-color: blue;
}

.iconBox {
	width: 175px;
	height: 100%;
}

.summonerBox {
	height: 100%;
}

.iconBox>img {
	width: 150px;
	height: 150px;
}

.soloRank {
	width: 50%;
}

.freeRank {
	width: 50%;
}
</style>
<body>
	<header>
		<c:import url="../commons/gnb.jsp"></c:import>
	</header>
	<main>
		<div
			class="container container-fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<div class="inputBox input-group mb-3">
				<input class="form-control" type="text" name="summonerName"
					placeholder="소환사명을 입력해 주세요" aria-label="default input example">
				<button class="btn btn-outline-secondary" id="searchBtn">Button</button>
			</div>
			<div class="summonerInfo d-flex flex-row mb-3">
				<div class="iconBox">
					<img
						src="http://ddragon.leagueoflegends.com/cdn/13.18.1/img/profileicon/${summonerInfo.profileIconId}.png">
				</div>
				<div class="summonerBox">
					<div class="nameBox">
						<span class="badge bg-secondary">${summonerInfo.summonerLevel}</span>
						<h3 style="font-weight: bold;">${summonerInfo.name}</h3>
					</div>
					<!-- DB에 저장하는 경우 필요 -->
					<!-- <div class="updateBox">전적갱신</div> -->
				</div>
			</div>
			<br>
			<div class="tierInfo d-flex flex-row mb-3">
				<div class="card soloRank">
					<div class="card-header">솔로 랭크</div>
					<div class="card-body">
						<c:forEach var="i" items="${summonerTier}">
							<c:if test="${i.queueType.equals('RANKED_SOLO_5x5')}">
								<h5 class="card-title">${i.tier}${i.rank}</h5>
								${i.leaguePoints}점
							 	${i.wins}승 ${i.losses}패
							</c:if>
						</c:forEach>
					</div>
				</div>
				&nbsp;&nbsp;
				<div class="card freeRank">
					<div class="card-header">자유 랭크</div>
					<div class="card-body">
						<c:forEach var="i" items="${summonerTier}">
							<c:if test="${i.queueType.equals('RANKED_FLEX_SR')}">
								<h5 class="card-title">${i.tier}${i.rank}</h5>
								${i.leaguePoints}점
							 	${i.wins}승 ${i.losses}패
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<br>
			<div class="matchInfo">
				최근 10경기 정보 보기 ...
				<div class="card mb-3" style="max-width: 540px;">
					<div class="row g-0">
						<div class="col-4">
							${matchList[0].participants[0].summonerName}
						</div>
						<div class="col-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-body-secondary">Last updated 3 mins
										ago</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				${matchList[0].participants}
				
			</div>
		</div>
	</main>

</body>

</html>