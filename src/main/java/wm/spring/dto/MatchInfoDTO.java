package wm.spring.dto;

import java.util.List;

public class MatchInfoDTO {
	private long gameEndTimestamp;
	private int mapId;
	private int queueId;
	private long gameStartTimestamp;
	private List<MatchParticipantDTO> participants;
	private String gameEndTimeString;
	private String playTimeString;
	
	public MatchInfoDTO() {}
	public MatchInfoDTO(long gameEndTimestamp, int mapId, int queueId, long gameStartTimestamp,
			List<MatchParticipantDTO> participants, String gameEndTimeString, String playTimeString) {
		super();
		this.gameEndTimestamp = gameEndTimestamp;
		this.mapId = mapId;
		this.queueId = queueId;
		this.gameStartTimestamp = gameStartTimestamp;
		this.participants = participants;
		this.gameEndTimeString = gameEndTimeString;
		this.playTimeString = playTimeString;
	}

	public long getGameEndTimestamp() {
		return gameEndTimestamp;
	}
	public void setGameEndTimestamp(long gameEndTimestamp) {
		this.gameEndTimestamp = gameEndTimestamp;
	}
	public int getMapId() {
		return mapId;
	}
	public void setMapId(int mapId) {
		this.mapId = mapId;
	}
	public int getQueueId() {
		return queueId;
	}
	public void setQueueId(int queueId) {
		this.queueId = queueId;
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
	public String getGameEndTimeString() {
		return gameEndTimeString;
	}
	public void setGameEndTimeString(String gameEndTimeString) {
		this.gameEndTimeString = gameEndTimeString;
	}
	public String getPlayTimeString() {
		return playTimeString;
	}
	public void setPlayTimeString(String playTimeString) {
		this.playTimeString = playTimeString;
	}
	
}
