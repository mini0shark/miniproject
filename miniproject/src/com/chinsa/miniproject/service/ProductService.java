package com.chinsa.miniproject.service;

import java.util.List;

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
