package wm.spring.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import wm.spring.dto.MatchInfoDTO;
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
	
	@GetMapping("toSearchRecord")
	public String toSearchRecord(String summonerName, Model model) {

		// datadragon-version
		String ddragon_ver = "13.18.1";
		
		// 소환사 이름 검색 정보 (닉네임, 레벨, 아이콘ID)
		summonerName = summonerName.replaceAll(" ", "%20"); // 공백 제거
		SummonerInfoDTO summonerInfo = recordService.callAPISummonerByName(summonerName);

		// 소환사 이름 티어 정보 (솔로랭크, 자유랭크)
		String summonerId = summonerInfo.getId();
		List<SummonerTierDTO> summonerTier = recordService.callAPIRankById(summonerId);
		
		// 소환사 최근 매치 10개의 ID 정보
		String summonerPuuid = summonerInfo.getPuuid();
		JsonArray summonerMatchId = recordService.callAPIMatchIdByPuuid(summonerPuuid, 0, 10);
		
		// 소환사 최근 매치 10개의 세부 정보 (게임 시간, 승리팀, 게임 참가자 정보)
		ArrayList<MatchInfoDTO> matchList = new ArrayList<>();
		
		// 완성 후 2 -> summonerMatchId.size()
		for(int i=0; i < summonerMatchId.size(); i++) {
			matchList.add(recordService.callAPIMatchById(summonerMatchId.get(i)));
		}
		
		model.addAttribute("summonerName", summonerName);
		model.addAttribute("summonerInfo", summonerInfo);
		model.addAttribute("summonerTier", summonerTier);
		model.addAttribute("matchList", matchList);
		model.addAttribute("ddragon_ver", ddragon_ver);

		return "/record/summoner";
	}
	
	@ResponseBody
	@GetMapping("additionalMatch")
	public List<MatchInfoDTO> additionalMatch(@RequestParam String summonerPuuid, @RequestParam int start, @RequestParam int count) {
		// 추가 매치 5개의 ID 정보
		ArrayList<MatchInfoDTO> addtionalMatchList = new ArrayList<>();
		
		// 추가 매치 5개의 세부 정보
		JsonArray summonerMatchId = recordService.callAPIMatchIdByPuuid(summonerPuuid, start, count);
		
		for(int i=0; i < summonerMatchId.size(); i++) {
			addtionalMatchList.add(recordService.callAPIMatchById(summonerMatchId.get(i)));
		}
		
		return addtionalMatchList;
	}
	
}
