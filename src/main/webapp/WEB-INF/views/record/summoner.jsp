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
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<style>
container {
	background-color: blue;
}

.iconBox {
	width: 155px;
	height: 100%;
}

.summonerBox {
	height: 100%;
}

.iconBox>img {
	width: 130px;
	height: 130px;
}

.soloRank {
	width: 50%;
}

.freeRank {
	width: 50%;
}

.matchInfo>.matchCard {
	/*max-width: 2000px;*/
	max-height: 150px;
	over-flow: hidden;
}

.matchPlayInfo > p {margin:auto;}

.matchChamInfo {
	display: flex;
}

.matchChamInfo>div>img {
	width: 70px;
	height: 70px;
}
</style>
<body>
	<header>
		<c:import url="../commons/gnb.jsp"></c:import>
	</header>
	<main>
		<div
			class="container container-fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<form action="/record/toSearchRecord" method="post">
				<div class="inputBox input-group mb-3">
					<input class="form-control" type="text" name="summonerName"
						placeholder="소환사명을 입력해 주세요" aria-label="default input example">
					<button class="btn btn-outline-secondary" id="searchBtn">Button</button>
				</div>
			</form>
			<div class="summonerInfo d-flex flex-row mb-3">
				<div class="iconBox">
					<img
						src="http://ddragon.leagueoflegends.com/cdn/${ddragon_ver}/img/profileicon/${summonerInfo.profileIconId}.png">
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
				<div class="card matchCard mb-3">
					<div class="row g-0">
						<c:forEach var="i" items="${matchList[0].participants}">
							<c:if test="${i.summonerName eq summonerInfo.name}">
								<div class="col-4 col-md-3 col-xl-2">
									<div class="card-body matchPlayInfo">
										<c:choose>
											<c:when test="${matchList[0].queueId == 420}">
												<p class="queueType">솔로 랭크</p>
											</c:when>
											<c:when test="${matchList[0].queueId == 430}">
												<p class="queueType">일반</p>
											</c:when>
											<c:when test="${matchList[0].queueId == 440}">
												<p class="queueType">자유 랭크</p>
											</c:when>
											<c:when test="${matchList[0].queueId == 450}">
												<p class="queueType">무작위 총력전</p>
											</c:when>
											<c:otherwise>
												<p>another</p>
											</c:otherwise>
										</c:choose>
										<small class="text-body-secondary">${matchList[0].gameEndTimeString}</small>
										<hr style="margin-top:5px; margin-bottom:5px; width: 120px">
										<c:choose>
											<c:when test="${i.win == true}">
												<small class="text-primary">승리</small><br>
											</c:when>
											<c:otherwise>
												<small class="text-danger">패배</small><br>
											</c:otherwise>
										</c:choose>
										<small class="text-body-secondary">${matchList[0].playTimeString}</small>
									</div>
								</div>
								<div class="col-6 col-md-4 col-lg-3">
									<div class="card-body matchChamInfo">
										<div>
											<img
												src="https://ddragon.leagueoflegends.com/cdn/${ddragon_ver}/img/champion/${i.championName}.png">
										</div>
										<div>
											<p>${i.kills}/ ${i.deaths} / ${i.assists}</p>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<div class="d-none d-lg-block col-md-5 col-lg-4">
							<div class="card-body matchParticipants" style="display: flex;">
								<div class="team1">
									<c:forEach var="i" items="${matchList[0].participants}">
										<c:if test="${i.teamId == 100}">
											<small class="text-body-secondary">${i.summonerName}</small>
											<br>
										</c:if>
									</c:forEach>
								</div>
								<div>&nbsp;&nbsp;&nbsp;vs&nbsp;&nbsp;&nbsp;</div>
								<div class="team2">
									<c:forEach var="i" items="${matchList[0].participants}">
										<c:if test="${i.teamId == 200}">
											<small class="text-body-secondary">${i.summonerName}</small>
											<br>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 갱신 버튼 -->
				<div class="card mb-3">
  					<button type="button" class="btn" style="width:100%;height:100%;">
  						<i class="fa-solid fa-plus" style="color: #a1a1a1;"></i>
  					</button>
				</div>
			</div>
		</div>
	</main>
</body>
</html>