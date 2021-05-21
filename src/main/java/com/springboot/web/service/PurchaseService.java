package com.springboot.web.service;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.springboot.web.model.Purchase;
import com.springboot.web.model.User;
import com.dao.PurchaseRepository;
import com.dao.UserRepository;

@Service
@Transactional
public class PurchaseService {
	
	private PurchaseRepository purchaseRepository;
	 private static int todoCount = 1;
	
	public PurchaseService(PurchaseRepository purchaseRepository)
	{
		this.purchaseRepository=purchaseRepository;
	}
	
	/*
	 * public void saveMyPurchase(Purchase purchase) {
	 * purchaseRepository.save(purchase); }
	 */
	
	   public void addTodo(String name, String comp, String user, String date, int price) {
			/* todos.add(new Todo(++todoCount, name, desc, targetDate, isDone)); */
		   purchaseRepository.save(new Purchase(++todoCount, user, name, comp, date, price));
	    }
	   
	public List<Purchase> showAllPurchases(){
		List<Purchase> purs = new ArrayList<Purchase>();
		for(Purchase pur : purchaseRepository.findAll()) {
			purs.add(pur);
		}
		
		return purs;
	}

}
