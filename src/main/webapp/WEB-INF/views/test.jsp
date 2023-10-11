<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	Hello
	<br>
	<input type="text" name="summonerName" id="summonerName">
	<input type="submit" value="button" id="btn">
	<fieldset>
		<legend>소환사 정보</legend>
		<div id="name">이름 : </div>
		<div id="profileIconId">아이콘 : </div>
		<div id="revisionDate">업데이트 날짜 : </div>
		<div id="summonerLevel">레벨 : </div>
	</fieldset>
	<fieldset>
		<legend>티어 정보</legend>
		<div id="soloRank">솔로 랭크 : <input name="sysname" value="${summonerTier}"></div>
		<div id="freeRank">자유 랭크 : </div>
	</fieldset>
</body>
<script>
	$("#btn").on("click", function(){
		$.ajax({
			url:"/test/summoner",
			dataType:"json",
			data:{
				summonerName:$("#summonerName").val()
			}
		}).done(function(resp){
			console.log(resp);
			console.log(resp.name);
			$("#name").append(resp.name);
			//$("#profileIconId").append(<img src="http://ddragon.leagueoflegends.com/cdn/13.18.1/img/profileicon/" + resp.profileIconId + ".png">);
			$("#revisionDate").append(resp.revisionDate);
			$("#summonerLevel").append(resp.summonerLevel);
			
			const img = new Image();
			img.src = "http://ddragon.leagueoflegends.com/cdn/13.18.1/img/profileicon/" + resp.profileIconId + ".png";
			
			$("#profileIconId").append(img);
		})
	})
</script>
</html>