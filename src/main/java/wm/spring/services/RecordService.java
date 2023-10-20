package wm.spring.services;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import wm.spring.dto.MatchInfoDTO;
import wm.spring.dto.SummonerInfoDTO;
import wm.spring.dto.SummonerTierDTO;

@Service
public class RecordService {

	@Value("${RiotApi-Key}")
	private String riotApiKey;
	
	@Autowired
	private Gson gson;
	
	// 서버 지역 - kr
	private String krServerUrl = "https://kr.api.riotgames.com";
	
	// 서버 지역 - Asia
	private String asiaServerUrl = "https://asia.api.riotgames.com";
	
	// 소환사 이름 검색 정보 가져오기
	public SummonerInfoDTO callAPISummonerByName(String summonerName) {
		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(krServerUrl + "/lol/summoner/v4/summoners/by-name/" + summonerName + "?api_key=" + riotApiKey);

			System.out.println("Executing request " + httpGet.getRequestLine());
			ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

				@Override
				public String handleResponse(
						final HttpResponse response) throws ClientProtocolException, IOException {
					int status = response.getStatusLine().getStatusCode();
					if (status >= 200 && status < 300) {
						HttpEntity entity = response.getEntity();
						return entity != null ? EntityUtils.toString(entity) : null;
					} else {
						throw new ClientProtocolException("Unexpected response status: " + status);
					}
				}

			};
			String responseBody = httpClient.execute(httpGet, responseHandler);

			SummonerInfoDTO summonerInfoDTO = gson.fromJson(responseBody, SummonerInfoDTO.class);

			System.out.println(responseBody);

			return summonerInfoDTO;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 소환사 티어 정보 불러오기
	public List<SummonerTierDTO> callAPIRankById(String summonerId) {
		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(krServerUrl + "/lol/league/v4/entries/by-summoner/" + summonerId + "?api_key=" + riotApiKey);
			
			 System.out.println("Executing request " + httpGet.getRequestLine());
			 ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

	                @Override
	                public String handleResponse(
	                        final HttpResponse response) throws ClientProtocolException, IOException {
	                    int status = response.getStatusLine().getStatusCode();
	                    if (status >= 200 && status < 300) {
	                        HttpEntity entity = response.getEntity();
	                        return entity != null ? EntityUtils.toString(entity) : null;
	                    } else {
	                        throw new ClientProtocolException("Unexpected response status: " + status);
	                    }
	                }

	            };
	            String responseBody = httpClient.execute(httpGet, responseHandler);
	            
	            // TypeToken 방식
	            Type listType = new TypeToken<ArrayList<SummonerTierDTO>>(){}.getType();
	            List<SummonerTierDTO> summonerTierDTO = gson.fromJson(responseBody, listType);
	            
	            System.out.println(responseBody);
	            
	            return summonerTierDTO;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 소환사 최근 매치 10개의 ID 불러오기
	public JsonArray callAPIMatchIdByPuuid(String summonerPuuid) {
		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(asiaServerUrl + "/lol/match/v5/matches/by-puuid/" + summonerPuuid + "/ids?start=0&count=10&api_key=" + riotApiKey);
			
			 System.out.println("Executing request " + httpGet.getRequestLine());
			 ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

	                @Override
	                public String handleResponse(
	                        final HttpResponse response) throws ClientProtocolException, IOException {
	                    int status = response.getStatusLine().getStatusCode();
	                    if (status >= 200 && status < 300) {
	                        HttpEntity entity = response.getEntity();
	                        return entity != null ? EntityUtils.toString(entity) : null;
	                    } else {
	                        throw new ClientProtocolException("Unexpected response status: " + status);
	                    }
	                }

	            };
	            String responseBody = httpClient.execute(httpGet, responseHandler);
	            
	            // String to JSONArray
	            JsonParser parser = new JsonParser();
	    		JsonArray array = parser.parse(responseBody).getAsJsonArray();
	            
	            return array;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 소환사 최근 매치 10개의 세부 정보 불러오기
	public MatchInfoDTO callAPIMatchById(JsonElement summonerMatchId) {
		try {
			// summonerMatchId에 포함된 큰따옴표 제거
			String str = gson.toJson(summonerMatchId).replace("\"", "");
			
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(asiaServerUrl + "/lol/match/v5/matches/" + str + "?api_key=" + riotApiKey);
			
			 System.out.println("Executing request " + httpGet.getRequestLine());
			 ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

	                @Override
	                public String handleResponse(
	                        final HttpResponse response) throws ClientProtocolException, IOException {
	                    int status = response.getStatusLine().getStatusCode();
	                    if (status >= 200 && status < 300) {
	                        HttpEntity entity = response.getEntity();
	                        return entity != null ? EntityUtils.toString(entity) : null;
	                    } else {
	                        throw new ClientProtocolException("Unexpected response status: " + status);
	                    }
	                }

	            };
	            String responseBody = httpClient.execute(httpGet, responseHandler);
	            System.out.println(responseBody);
	            
	            // JSON 형태로 변환해 "info"에 해당하는 데이터만 추출
	            JsonParser parser = new JsonParser();
	            JsonElement jsonElement = parser.parse(responseBody);
	            JsonObject jsonObject = jsonElement.getAsJsonObject();
	            String info = jsonObject.get("info").toString();
	            
	            MatchInfoDTO matchInfoDTO = gson.fromJson(info, MatchInfoDTO.class);
	            System.out.println(matchInfoDTO.getParticipants().get(0).getAssists());
	            
	            return matchInfoDTO;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
