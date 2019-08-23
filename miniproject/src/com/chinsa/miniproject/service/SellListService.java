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
public class SellListService {
	@Autowired
	BuyListMapper buyListDao;
	@Autowired
	SellListMapper sellListDao;
	@Autowired
	ProductMapper productDao;
	public SellListDTO getSellList(int sPno) {
		return sellListDao.getSellList(sPno);
	}
	@Transactional
	public boolean updateSellList(SellListDTO sellList) {
		int result = 0;
		System.out.println(sellList.toString());
		result = sellListDao.updateSellList(sellList);
		System.out.println(result);
		if(result==1) {
			result = 0;
			BuyListDTO buyList = buyListDao.getBuyList(sellList.getsPno());
			buyList.setbState(sellList.getsState());
			result = buyListDao.updateBuyList(buyList);
			if(result==1) {
				result = 0;
				ProductDTO product = productDao.getProduct(sellList.getsPno());
				product.setpState(sellList.getsState());
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
	public boolean deleteSellList(int sPno) {
		int result = 0;
		result = sellListDao.deleteSellList(sPno);
		if(result==1) {
			result = 0;
			result = buyListDao.deleteBuyList(sPno);
			if(result==1) {
				result = 0;
				ProductDTO product = productDao.getProduct(sPno);
				if(product.getpState().equals("sold"))
					return false;
				result = productDao.deleteProduct(sPno);
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
	public List<SellListDTO> getSellList(String sSeller){
		return sellListDao.getSellListsSeller(sSeller);
	}
}
