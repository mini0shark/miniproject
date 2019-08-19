package com.chinsa.miniproject.dao;

import java.util.List;

import com.chinsa.miniproject.dto.BuyListDTO;
import com.chinsa.miniproject.mapper.Mapper;

@Mapper
public interface BuyListMapper {
	public List<BuyListDTO> getSellList(String bBuyer);
	public List<BuyListDTO> getSellLists();
	public int updateSellList(BuyListDTO buyList);
	public int insertSellList(BuyListDTO buyList);
	public int deleteSellList(int sPno);
}
