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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<!-- Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<!--  summoner css -->
<link href="/resources/css/record/summoner.css" rel="stylesheet" type="text/css">
<!--  summoner js -->
<script src="/resources/js/record/summoner.js" defer></script>
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp"></c:import>
	</header>
	<main>
		<div class="container shadow p-3 mb-5 bg-body-tertiary rounded" style="margin-top:50px;">
			<form action="/record/toSearchRecord" method="get">
				<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
				<div class="inputBox input-group mb-3">
					<input class="form-control" type="text" id="summonerName" name="summonerName"
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
						<input type="hidden" id="summonerInfoName" value="${summonerInfo.name}">
						<span class="badge bg-secondary">${summonerInfo.summonerLevel}</span>
						<h3 style="font-weight: bold;">${summonerInfo.name}</h3>
					</div>
					<!-- DB에 저장하는 경우 필요 -->
					<!-- <div class="updateBox">전적갱신</div> -->
				</div>
			</div>
			<br>
			<div class="tierInfo d-md-flex flex-row mb-3">
				<div class="card rank col-12">
					<div class="card-header">솔로 랭크</div>
					<div class="card-body d-flex justify-content-between">
						<c:forEach var="i" items="${summonerTier}">
							<c:if test="${i.queueType.equals('RANKED_SOLO_5x5')}">
							<div>
								<img class="tierImage" src="/resources/tierImages/${i.tier}.png">
							</div>
							<div style="text-align:right;">
								<h5 class="card-title">${i.tier} ${i.rank}</h5>
								<p>${i.leaguePoints} LP</p>
							 	<small class="text-body-secondary">${i.wins}승 ${i.losses}패</small>
							 </div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				&nbsp;&nbsp;
				<div class="card rank col-12">
					<div class="card-header">자유 랭크</div>
					<div class="card-body d-flex justify-content-between">
						<c:forEach var="i" items="${summonerTier}">
							<c:if test="${i.queueType.equals('RANKED_FLEX_SR')}">
								<div>
									<img class="tierImage" src="/resources/tierImages/${i.tier}.png">
								</div>
								<div style="text-align:right;">
									<h5 class="card-title">${i.tier} ${i.rank}</h5>
									<p>${i.leaguePoints} LP</p>
							 		<small class="text-body-secondary">${i.wins}승 ${i.losses}패</small>
							 	</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<br>
			<div class="matchInfo">
				<p style="margin-bottom:4px;">최근 10경기 정보 보기</p>
				<c:forEach var="j" items="${matchList}">
				<div class="card matchCard mb-3">
					<div class="row g-0">
						<c:forEach var="i" items="${j.participants}">
							<c:if test="${i.summonerName eq summonerInfo.name}">
								<div class="col-4 col-md-3 col-xl-2">
									<div class="card-body matchPlayInfo">
										<c:choose>
											<c:when test="${j.queueId == 420}">
												<p class="queueType">솔로 랭크</p>
											</c:when>
											<c:when test="${j.queueId == 430}">
												<p class="queueType">일반</p>
											</c:when>
											<c:when test="${j.queueId == 440}">
												<p class="queueType">자유 랭크</p>
											</c:when>
											<c:when test="${j.queueId == 450}">
												<p class="queueType">무작위 총력전</p>
											</c:when>
											<c:otherwise>
												<p>another</p>
											</c:otherwise>
										</c:choose>
										<small class="text-body-secondary">${j.gameEndTimeString}</small>
										<hr style="margin-top:5px; margin-bottom:5px; width: 120px">
										<c:choose>
											<c:when test="${i.teamEarlySurrendered == true}">
												<small class="text-secondary">다시하기</small><br>
											</c:when>
											<c:when test="${i.win == true}">
												<small class="text-primary">승리</small><br>
											</c:when>
											<c:otherwise>
												<small class="text-danger">패배</small><br>
											</c:otherwise>
										</c:choose>
										<small class="text-body-secondary">${j.playTimeString}</small>
									</div>
								</div>
								<div class="col-6 col-md-5 col-lg-3">
									<div class="card-body matchChamInfo">
										<div>
											<img
												src="https://ddragon.leagueoflegends.com/cdn/${ddragon_ver}/img/champion/${i.championName}.png">
										</div>
										<div style="display:flex;margin-left:30px;">
											<div class="fs-5 text">${i.kills} /</div>&nbsp;
											<div class="fs-5 text" style="color:#d91a1a;">${i.deaths}</div>&nbsp;
											<div class="fs-5 text">/ ${i.assists} </div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<div class="d-none d-lg-block col-lg-4">
							<div class="card-body matchParticipants" style="display: flex;">
								<div class="team1">
									<c:forEach var="i" items="${j.participants}">
										<c:if test="${i.teamId == 100}">
											<small class="text-body-secondary">${i.summonerName}</small>
											<br>
										</c:if>
									</c:forEach>
								</div>
								<div>&nbsp;&nbsp;&nbsp;vs&nbsp;&nbsp;&nbsp;</div>
								<div class="team2">
									<c:forEach var="i" items="${j.participants}">
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
				</c:forEach>
			</div>
			<!-- 전적 추가 검색 버튼 -->
			<div class="card mb-3">
				<input type="hidden" id="summonerPuuid" value="${summonerInfo.puuid}">
  				<button type="button" id="additionalMatchBtn" class="btn" style="width:100%;height:100%;">
  					<i class="fa-solid fa-plus" style="color: #a1a1a1;"></i>
  				</button>
			</div>
		</div>
	</main>
</body>
<script>
	let start = 10;
	let count = 5;
	
	$("#additionalMatchBtn").on("click", function(){
		let summonerPuuid = $("#summonerPuuid").val();
		let summonerInfoName = $("#summonerInfoName").val();
		
		$.ajax({
			url:"/record/additionalMatch",
			type:"get",
			dataType:"json",
			data:{
				summonerPuuid : summonerPuuid,
				start : start,
				count : count
			}
		}).done(function(resp){
			let row = "";
			
			for(let j=0;j < resp.length;j++){
				row += '<div class="card matchCard mb-3">';
				row += '<div class="row g-0">';
				for(let i=0;i < resp[j].participants.length;i++){
					if(resp[j].participants[i].summonerName == summonerInfoName){
						row +=	'<div class="col-4 col-md-3 col-xl-2">';
						row +=	'<div class="card-body matchPlayInfo">';
						if(resp[j].queueId == 420){
							row += '<p class="queueType">솔로 랭크</p>';
						}else if(resp[j].queueId == 430){
							row += '<p class="queueType">일반</p>';
						}else if(resp[j].queueId == 440){
							row += '<p class="queueType">자유 랭크</p>';
						}else if(resp[j].queueId == 450){
							row += '<p class="queueType">무작위 총력전</p>';
						}else{
							row += '<p>another</p>';
						}
						row += '<small class="text-body-secondary">' + resp[j].gameEndTimeString + '</small>';
						row += '<hr style="margin-top:5px; margin-bottom:5px; width: 120px">';
						if(resp[j].participants[i].win == true){
							row += '<small class="text-primary">승리</small><br>';
						}else {
							row += '<small class="text-danger">패배</small><br>';
						}
						row += '<small class="text-body-secondary">' + resp[j].playTimeString + '</small>';
						row +=	'</div>';		
						row +=	'</div>';
						row += '<div class="col-6 col-md-5 col-lg-3">';
						row += '<div class="card-body matchChamInfo">';
						row += '<div>';
						row += '<img src="https://ddragon.leagueoflegends.com/cdn/${ddragon_ver}/img/champion/' + resp[j].participants[i].championName + '.png">';
						row += '</div>';
						row += '<div style="display:flex;margin-left:30px;">';
						row += '<div class="fs-5 text">' + resp[j].participants[i].kills + ' /</div>&nbsp;';
						row += '<div class="fs-5 text" style="color:#d91a1a;">' + resp[j].participants[i].deaths + '</div>&nbsp;';
						row += '<div class="fs-5 text">/ ' + resp[j].participants[i].assists + '</div>';
						row += '</div>';
						row += '</div>';
						row += '</div>';
					}
				}
				row += '<div class="d-none d-lg-block col-lg-4">';
				row += '<div class="card-body matchParticipants" style="display: flex;">';
				row += '<div class="team1">';
				for(let i=0;i < resp[j].participants.length;i++){
					if(resp[j].participants[i].teamId == 100){
						row += '<small class="text-body-secondary">' + resp[j].participants[i].summonerName + '</small><br>';
					}
				}
				row += '</div>';
				row += '<div>&nbsp;&nbsp;&nbsp;vs&nbsp;&nbsp;&nbsp;</div>';
				row += '<div class="team2">';
				for(let i=0;i < resp[j].participants.length;i++){
					if(resp[j].participants[i].teamId == 200){
						row += '<small class="text-body-secondary">' + resp[j].participants[i].summonerName + '</small><br>';
					}
				}
				row += '</div>';
				row += '</div>';
				row += '</div>';
				row += '</div>';
				row += '</div>';
			}
			
			$(".matchInfo").append(row);
			
			// start 값 늘려주기
			start += 5;
		})
	})
</script>
</html>