package com.chinsa.miniproject.dao;

import java.util.List;

import com.chinsa.miniproject.dto.ProductDTO;
import com.chinsa.miniproject.mapper.Mapper;

@Mapper
public interface ProductMapper {
	public ProductDTO getProduct(int pNo);
	public List<ProductDTO> getProducts();
	public int updateProduct(ProductDTO product);
	public int insertProduct(ProductDTO product);
	public int deleteProduct(int pNo);
}
