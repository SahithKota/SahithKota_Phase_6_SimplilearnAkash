package com.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.springboot.web.model.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer>{

}
