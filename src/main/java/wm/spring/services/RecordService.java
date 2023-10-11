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
import com.google.gson.reflect.TypeToken;

import wm.spring.dto.SummonerInfoDTO;
import wm.spring.dto.SummonerTierDTO;

@Service
public class RecordService {

	@Value("${RiotApi-Key}")
	private String riotApiKey;
	
	@Autowired
	private Gson gson;
	
	public String callAPISummonerByName(String summonerName) {
		
		String serverUrl = "https://kr.api.riotgames.com";

		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(serverUrl + "/lol/summoner/v4/summoners/by-name/" + summonerName + "?api_key=" + riotApiKey);

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

			SummonerInfoDTO sName = gson.fromJson(responseBody, SummonerInfoDTO.class);

			System.out.println(responseBody);

			return responseBody;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<SummonerTierDTO> callAPIRankById(String summonerId) {
		
		String serverUrl = "https://kr.api.riotgames.com";
		
		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(serverUrl + "/lol/league/v4/entries/by-summoner/" + summonerId + "?api_key=" + riotApiKey);
			
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
	            System.out.println("배열 0번 큐타입 : " + summonerTierDTO.get(0).getQueueType());
	            System.out.println(summonerTierDTO.get(0).getTier());
	            
	            return summonerTierDTO;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
