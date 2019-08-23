package com.chinsa.miniproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinsa.miniproject.dao.ProductMapper;
import com.chinsa.miniproject.dao.SellListMapper;
import com.chinsa.miniproject.dto.ProductDTO;
import com.chinsa.miniproject.dto.SellListDTO;
import com.chinsa.miniproject.dto.UserDTO;

@Service
public class ProductService {
	@Autowired
	ProductMapper productDao;
	@Autowired
	SellListMapper sellListDao;
	public ProductDTO getProduct(int pNo) {
		return productDao.getProduct(pNo);
	}
	public List<ProductDTO> getProducts(){
		return productDao.getProducts();
	}
	public List<ProductDTO> getProductsInCategory(String pCategory, String pLoc, String pSeller, String pName, String orderBy){
		Map<String, String> map = new HashMap<String, String>(); 
		if(pCategory!=null)
			map.put("pCategory", pCategory);
		if(pLoc!=null)
			map.put("pLoc", pLoc);
		if(pName!= null)
			map.put("pName", pName);
		if(pSeller!=null)
			map.put("pSeller", pSeller);
		if(orderBy!=null)
			map.put("orderBy", orderBy);
		else
			map.put("orderBy", "DESC");
		if(map.size()>0)
			return productDao.getProductsSearching(map);
		return null;
	}
	@Transactional
	public boolean insertProduct(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		int result = 0;
		result = productDao.insertProduct(productDTO);
		if(result==1) {
			SellListDTO sellList = new SellListDTO();
			sellList.setsName(productDTO.getpName());
			sellList.setsPno(productDTO.getpNo());
			sellList.setsImg(productDTO.getpImg());
			sellList.setsSeller(productDTO.getpSeller());
			sellList.setsBuyer("");
			sellList.setsState("ing");
			sellList.setsCategory(productDTO.getpCategory());
			sellList.setsPrice(productDTO.getpPrice());
			result = 0;
			result = sellListDao.insertSellList(sellList);
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
}
