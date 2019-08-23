package com.chinsa.miniproject.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.chinsa.miniproject.dto.BuyListDTO;
import com.chinsa.miniproject.dto.SellListDTO;
import com.chinsa.miniproject.service.SellListService;

@RestController
@RequestMapping("/api/selllist")
public class SellListRestController {
	@Autowired
	SellListService sellListService;
	
	@PostMapping("/update")
	public String postUpdateSellList(@RequestBody Map<String, Integer> map) {
		int sPno = map.get("pNo");
		SellListDTO sellList = sellListService.getSellList(sPno);
		if(sellList.getsState().equals("wait")) {
			System.out.println(sellList.toString());
			sellList.setsState("sold");
			if(sellListService.updateSellList(sellList))
				return "success";
			else
				return "fail";
		}
		else {
			return "notWait";
		}
	}
	@PostMapping("/delete")
	public String postDeleteSellList(@RequestBody Map<String, Integer> map) {
		int sPno = map.get("pNo");
		System.out.println(sPno);
		if(sellListService.deleteSellList(sPno))
			return "success";
		else
			return "fail";
	}
	
	@GetMapping("/getdata")
	public List<SellListDTO> getData(@RequestParam String sSeller) {
		System.out.println(sellListService.getSellList(sSeller));
		return sellListService.getSellList(sSeller);
	}
}
