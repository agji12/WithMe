package wm.spring.dto;

public class MatchParticipantDTO {
	private int assists;
	private int champLevel;
	private int championId;
	private String championName;
	private int deaths;
	private int kills;
	private int summonerLevel;
	private String summonerName;
	private int teamId;
	private boolean win;
	
	public MatchParticipantDTO() {}
	public MatchParticipantDTO(int assists, int champLevel, int championId, String championName, int deaths, int kills,
			int summonerLevel, String summonerName, int teamId, boolean win) {
		super();
		this.assists = assists;
		this.champLevel = champLevel;
		this.championId = championId;
		this.championName = championName;
		this.deaths = deaths;
		this.kills = kills;
		this.summonerLevel = summonerLevel;
		this.summonerName = summonerName;
		this.teamId = teamId;
		this.win = win;
	}
	
	public int getAssists() {
		return assists;
	}
	public void setAssists(int assists) {
		this.assists = assists;
	}
	public int getChampLevel() {
		return champLevel;
	}
	public void setChampLevel(int champLevel) {
		this.champLevel = champLevel;
	}
	public int getChampionId() {
		return championId;
	}
	public void setChampionId(int championId) {
		this.championId = championId;
	}
	public String getChampionName() {
		return championName;
	}
	public void setChampionName(String championName) {
		this.championName = championName;
	}
	public int getDeaths() {
		return deaths;
	}
	public void setDeaths(int deaths) {
		this.deaths = deaths;
	}
	public int getKills() {
		return kills;
	}
	public void setKills(int kills) {
		this.kills = kills;
	}
	public int getSummonerLevel() {
		return summonerLevel;
	}
	public void setSummonerLevel(int summonerLevel) {
		this.summonerLevel = summonerLevel;
	}
	public String getSummonerName() {
		return summonerName;
	}
	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public boolean isWin() {
		return win;
	}
	public void setWin(boolean win) {
		this.win = win;
	}
	
}
