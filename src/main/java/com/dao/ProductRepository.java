package com.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.springboot.web.model.Product;
import com.springboot.web.model.User;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer>{
	/*List<Product> findByProductname(String lastName);*/
}
