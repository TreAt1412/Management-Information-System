/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Huy_Dat
 */
public class SellingDetail {

    int id;
    int sellingID;
    String goodName;
    int quantity;
    int price;
    
    

    public SellingDetail() {
    }

	public SellingDetail(int id, int sellingID, String goodName, int quantity, int price) {
		super();
		this.id = id;
		this.sellingID = sellingID;
		this.goodName = goodName;
		this.quantity = quantity;
		this.price = price;
	}

	public int getSellingID() {
		return sellingID;
	}

	public void setSellingID(int sellingID) {
		this.sellingID = sellingID;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}

    
    
}
