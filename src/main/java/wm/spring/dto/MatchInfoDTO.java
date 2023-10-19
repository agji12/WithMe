package wm.spring.dto;

import java.util.List;

public class MatchInfoDTO {
	private long gameEndTimestamp;
	private String gameMode;
	private long gameStartTimestamp;
	private List<MatchParticipantDTO> participants;
	
	public MatchInfoDTO() {}
	public MatchInfoDTO(long gameEndTimestamp, String gameMode, long gameStartTimestamp,
			List<MatchParticipantDTO> participants) {
		super();
		this.gameEndTimestamp = gameEndTimestamp;
		this.gameMode = gameMode;
		this.gameStartTimestamp = gameStartTimestamp;
		this.participants = participants;
	}
	
	public long getGameEndTimestamp() {
		return gameEndTimestamp;
	}
	public void setGameEndTimestamp(long gameEndTimestamp) {
		this.gameEndTimestamp = gameEndTimestamp;
	}
	public String getGameMode() {
		return gameMode;
	}
	public void setGameMode(String gameMode) {
		this.gameMode = gameMode;
	}
	public long getGameStartTimestamp() {
		return gameStartTimestamp;
	}
	public void setGameStartTimestamp(long gameStartTimestamp) {
		this.gameStartTimestamp = gameStartTimestamp;
	}
	public List<MatchParticipantDTO> getParticipants() {
		return participants;
	}
	public void setParticipants(List<MatchParticipantDTO> participants) {
		this.participants = participants;
	}
	
}
