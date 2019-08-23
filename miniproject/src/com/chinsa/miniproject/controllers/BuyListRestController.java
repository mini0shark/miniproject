package com.chinsa.miniproject.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.chinsa.miniproject.dto.BuyListDTO;
import com.chinsa.miniproject.dto.SellListDTO;
import com.chinsa.miniproject.service.BuyListService;
import com.chinsa.miniproject.service.SellListService;

@RestController
@RequestMapping("/api/buylist")
public class BuyListRestController {
	@Autowired
	BuyListService buyListService;
	@Autowired
	SellListService sellListService;
	@PostMapping("/add")
	public String postAddBuyList(@RequestBody Map<String, Integer> map, final HttpSession session) {
		String loginId = (String) session.getAttribute("id");
		int bPno = map.get("pNo");
		if(loginId!=null) {
			SellListDTO sellList = sellListService.getSellList(bPno);
			if(sellList.getsState().equals("ing")) {
				BuyListDTO buyList = new BuyListDTO();
				buyList.setbName(sellList.getsName());
				buyList.setbPno(sellList.getsPno());
				buyList.setbImg(sellList.getsImg());
				buyList.setbSeller(sellList.getsSeller());
				buyList.setbBuyer(loginId);
				buyList.setbState("wait");
				buyList.setbCategory(sellList.getsCategory());
				buyList.setbPrice(sellList.getsPrice());
				if(buyListService.insertBuyList(buyList))
					return "success";
				else
					return "fail";
			}
			else {
				return "notIng";
			}
		}
		else {
			return "notLogin";
		}
	}
	@PostMapping("/delete")
	public String postDeleteBuyList(@RequestBody Map<String, Integer> map) {
//		int bPno = Integer.parseInt(map.get("pNo"));
		int bPno = map.get("pNo");
		System.out.println(bPno);
		if(buyListService.deleteBuyList(bPno))
			return "success";
		else
			return "fail";
	}
	@GetMapping("/getdata")
	public List<BuyListDTO> getData(@RequestParam String bBuyer) {
		System.out.println(buyListService.getBuyList(bBuyer));
		return buyListService.getBuyList(bBuyer);
	}
}
