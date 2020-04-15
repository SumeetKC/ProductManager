package com.product.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Lob;

@Embeddable
public class Item {
	
	@Column(name="item_name")
	private String name;
	@Column(name="item_description")
	private String description;
	@Lob
	@Column(name="item_category")
	private String category;
	@Column(name="item_cost")
	private String cost;
	@Column(name="item_quantity")
	private int quantity;

	public Item() {
	}


	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}


	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}


	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}


	/**
	 * @return the cost
	 */
	public String getCost() {
		return cost;
	}

	/**
	 * @param cost the cost to set
	 */
	public void setCost(String cost) {
		this.cost = cost;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @param itemId
	 * @param name
	 * @param description
	 * @param image
	 * @param cost
	 * @param quantity
	 */
	public Item(String name, String description, String category, String cost, int quantity) {
		super();
		this.name = name;
		this.description = description;
		this.category = category;
		this.cost = cost;
		this.quantity = quantity;
	}

}