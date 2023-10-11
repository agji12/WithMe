package wm.spring.services;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import wm.spring.dto.SummonerInfoDTO;

@Service
public class TestService {
	
	@Value("${RiotApi-Key}")
	private String riotApiKey;
	
	Gson gson = new Gson();
	
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
	
	public String callAPIRankById(String summonerId) {
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
	            
	            //SummonerName sName = gson.fromJson(responseBody, SummonerName.class);
	            
	            System.out.println(responseBody);
	            
	            return responseBody;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
}
