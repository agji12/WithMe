package wm.spring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

import wm.spring.dto.SummonerInfoDTO;
import wm.spring.dto.SummonerTierDTO;
import wm.spring.services.RecordService;

@Controller
@RequestMapping("/record/")
public class RecordController {

	@Autowired
	private RecordService recordService;
	
	@Autowired
	private Gson gson;
	
	@RequestMapping("toSearchRecord")
	public String toSearchRecord(String summonerName, Model model) {

		// 소환사 이름 검색 정보 (닉네임, 레벨, 아이콘ID)
		SummonerInfoDTO summonerInfo = recordService.callAPISummonerByName(summonerName);

		// 소환사 이름 티어 정보 (솔로랭크, 자유랭크)
		String summonerId = summonerInfo.getId();
		List<SummonerTierDTO> summonerTier = recordService.callAPIRankById(summonerId);
		
		// 소환사 최근 매치 10개의 ID 정보
		String summonerPuuid = summonerInfo.getPuuid();
		JsonArray summonerMatchId = recordService.callAPIMatchIdByPuuid(summonerPuuid);
		
		// 소환사 최근 매치 10개의 세부 정보
		System.out.println(summonerMatchId);
		System.out.println(summonerMatchId.get(0));
		/*
		for(int i=0; i < summonerMatchId.size(); i++) {
			recordService.callAPIMatchById(summonerMatchId.get(i));
		}
		*/
		recordService.callAPIMatchById(summonerMatchId.get(0));
		

		model.addAttribute("summonerName", summonerName);
		model.addAttribute("summonerInfo", summonerInfo);
		model.addAttribute("summonerTier", summonerTier);

		return "/record/summoner";
	}

}
