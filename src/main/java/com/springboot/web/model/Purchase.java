package com.springboot.web.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="purchase")
public class Purchase {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String customer;
	private String name;
	private String company;
	private String date;
	private int price;
	public Purchase() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Purchase(int id, String customer, String name, String company, String date, int price) {
		super();
		this.id = id;
		this.customer = customer;
		this.name = name;
		this.company = company;
		this.date = date;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Purchase [id=" + id + ", customer=" + customer + ", name=" + name + ", company=" + company + ", date="
				+ date + ", price=" + price + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
