package com.springboot.web.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.springboot.web.model.Product;
import com.dao.ProductRepository;

@Service
@Transactional
public class ProductService {
	
	private ProductRepository productRepository;
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository=productRepository;
	}
	
	public List<Product> showAllProducts(){
		List<Product> products = new ArrayList<Product>();
		for(Product pro : productRepository.findAll()) {
			products.add(pro);
		}
		
		return products;
	}
	

}
