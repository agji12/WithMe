package wm.spring.dto;

import java.sql.Timestamp;

public class SummonerTierDTO {
	
	private String leagueId;
	private String summonerId;
	private String summonerName;
	private String queueType;
	private String tier;
	private String rank;
	private int leaguePoints;
	private int wins;
	private int losses;
	
	public SummonerTierDTO() {}	
	public SummonerTierDTO(String leagueId, String summonerId, String summonerName, String queueType, String tier,
			String rank, int leaguePoints, int wins, int losses) {
		super();
		this.leagueId = leagueId;
		this.summonerId = summonerId;
		this.summonerName = summonerName;
		this.queueType = queueType;
		this.tier = tier;
		this.rank = rank;
		this.leaguePoints = leaguePoints;
		this.wins = wins;
		this.losses = losses;
	}

	public String getLeagueId() {
		return leagueId;
	}
	public void setLeagueId(String leagueId) {
		this.leagueId = leagueId;
	}
	public String getSummonerId() {
		return summonerId;
	}
	public void setSummonerId(String summonerId) {
		this.summonerId = summonerId;
	}
	public String getSummonerName() {
		return summonerName;
	}
	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}
	public String getQueueType() {
		return queueType;
	}
	public void setQueueType(String queueType) {
		this.queueType = queueType;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public int getLeaguePoints() {
		return leaguePoints;
	}
	public void setLeaguePoints(int leaguePoints) {
		this.leaguePoints = leaguePoints;
	}
	public int getWins() {
		return wins;
	}
	public void setWins(int wins) {
		this.wins = wins;
	}
	public int getLosses() {
		return losses;
	}
	public void setLosses(int losses) {
		this.losses = losses;
	}
	
}
