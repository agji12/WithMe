package wm.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import wm.spring.dto.SummonerInfoDTO;
import wm.spring.services.TestService;

@Controller
@RequestMapping("/test/")
public class TestController {
	
	@Autowired
	private TestService testService;
	
	Gson gson = new Gson();
	
	@RequestMapping("summoner")
	@ResponseBody
	public String test(String summonerName, Model model) {
		
		System.out.println(summonerName);
		// 소환사 이름 검색 정보 (닉네임, 레벨, 아이콘ID)
		String result = testService.callAPISummonerByName(summonerName);
		SummonerInfoDTO sName = gson.fromJson(result, SummonerInfoDTO.class);
		String summonerId = sName.getId();
		
		// 소환사 이름 티어 정보
		String result2 = testService.callAPIRankById(summonerId);
		
		model.addAttribute("summonerInfo", result);
		model.addAttribute("summonerTier", result2);
		return result;
	}
	
	
	
	
}
