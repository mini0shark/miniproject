package com.chinsa.miniproject.dao;

import java.util.List;

import com.chinsa.miniproject.dto.SellListDTO;
import com.chinsa.miniproject.mapper.Mapper;

@Mapper
public interface SellListMapper {
	public List<SellListDTO> getSellList(String sSeller);
	public List<SellListDTO> getSellLists();
	public int updateSellList(SellListDTO sellList);
	public int insertSellList(SellListDTO sellList);
	public int deleteSellList(int sPno);
}
