package wm.spring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

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

		System.out.println(summonerName);
		// 소환사 이름 검색 정보 (닉네임, 레벨, 아이콘ID)
		String summonerInfo = recordService.callAPISummonerByName(summonerName);

		// 소환사 이름 티어 정보 (솔로랭크, 자유랭크)
		SummonerInfoDTO sName = gson.fromJson(summonerInfo, SummonerInfoDTO.class);
		String summonerId = sName.getId();
		List<SummonerTierDTO> summonerTier = recordService.callAPIRankById(summonerId);

		model.addAttribute("summonerName", summonerName);
		model.addAttribute("summonerInfo", summonerInfo);
		model.addAttribute("summonerTier", summonerTier);

		return "/record/summoner";
	}

}
