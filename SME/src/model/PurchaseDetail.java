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
public class PurchaseDetail {
    int id;
    int purchaseID;
    String goodName;
    int quantity;
    int price;
   
    

    public PurchaseDetail() {
    }



	public PurchaseDetail(int id, int purchaseID, String goodName, int quantity, int price) {
		super();
		this.id = id;
		this.purchaseID = purchaseID;
		this.goodName = goodName;
		this.quantity = quantity;
		this.price = price;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getPurchaseID() {
		return purchaseID;
	}



	public void setPurchaseID(int purchaseID) {
		this.purchaseID = purchaseID;
	}



	public String getGoodName() {
		return goodName;
	}



	public void setGoodName(String goodName) {
		this.goodName = goodName;
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
