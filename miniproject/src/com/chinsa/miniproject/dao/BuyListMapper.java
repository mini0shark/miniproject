package com.chinsa.miniproject.dao;

import java.util.List;

import com.chinsa.miniproject.dto.BuyListDTO;
import com.chinsa.miniproject.mapper.Mapper;

@Mapper
public interface BuyListMapper {
	public List<BuyListDTO> getBuyListsSeller(String bSeller);
	public List<BuyListDTO> getBuyListsBuyer(String bBuyer);
	public BuyListDTO getBuyList(int bPno);
	public int updateBuyList(BuyListDTO buyList);
	public int insertBuyList(BuyListDTO buyList);
	public int deleteBuyList(int bPno);
}
