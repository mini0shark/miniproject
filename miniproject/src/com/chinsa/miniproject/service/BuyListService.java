package com.chinsa.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinsa.miniproject.dao.BuyListMapper;
import com.chinsa.miniproject.dao.ProductMapper;
import com.chinsa.miniproject.dao.SellListMapper;
import com.chinsa.miniproject.dto.BuyListDTO;
import com.chinsa.miniproject.dto.ProductDTO;
import com.chinsa.miniproject.dto.SellListDTO;

@Service
public class BuyListService {
	@Autowired
	BuyListMapper buyListDao;
	@Autowired
	SellListMapper sellListDao;
	@Autowired
	ProductMapper productDao;
	@Transactional
	public boolean insertBuyList(BuyListDTO buyList) {
		int result = 0;
		result = buyListDao.insertBuyList(buyList);
		if(result==1) {
			result = 0;
			SellListDTO sellList = sellListDao.getSellList(buyList.getbPno());
			sellList.setsBuyer(buyList.getbBuyer());
			sellList.setsState(buyList.getbState());
			result = sellListDao.updateSellList(sellList);
			if(result==1) {
				result = 0;
				ProductDTO product = productDao.getProduct(buyList.getbPno());
				product.setpState(buyList.getbState());
				result = productDao.updateProduct(product);
				if(result==1) {
					return true;
				}
				else {
					return false;
				}
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
	}
	@Transactional
	public boolean deleteBuyList(int bPno) {
		int result = 0;
		result = buyListDao.deleteBuyList(bPno);
		if(result==1) {
			result = 0;
			SellListDTO sellList = sellListDao.getSellList(bPno);
			if(sellList.getsState().equals("sold"))
				return false;
			sellList.setsState("ing");
			result = sellListDao.updateSellList(sellList);
			if(result==1) {
				result = 0;
				ProductDTO product = productDao.getProduct(bPno);
				product.setpState("ing");
				result = productDao.updateProduct(product);
				if(result==1) {
					return true;
				}
				else {
					return false;
				}
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
	}
	public List<BuyListDTO> getBuyList(String bBuyer){
		return buyListDao.getBuyListsBuyer(bBuyer);
	}
}
