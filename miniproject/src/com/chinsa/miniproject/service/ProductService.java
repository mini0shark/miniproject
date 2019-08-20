package com.chinsa.miniproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinsa.miniproject.dao.ProductMapper;
import com.chinsa.miniproject.dto.ProductDTO;
import com.chinsa.miniproject.dto.UserDTO;

@Service
public class ProductService {
	@Autowired
	ProductMapper productDao;

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
	public boolean insertProduct(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = productDao.insertProduct(productDTO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(result==0)
			return false;
		else
			return true;
	}
}
