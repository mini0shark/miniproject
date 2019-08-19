package com.chinsa.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinsa.miniproject.dao.ProductMapper;
import com.chinsa.miniproject.dto.ProductDTO;

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
}
