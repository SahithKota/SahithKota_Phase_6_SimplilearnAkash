package com.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.springboot.web.model.Purchase;
import com.springboot.web.model.User;

@Repository
public interface PurchaseRepository extends CrudRepository<Purchase, Integer>{
	
}
