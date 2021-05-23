/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Huy_Dat
 */
public class SellingBill {
    int id;
   
    String billCode;
    
    Date date;
    String reason;
    String seller;
    int companyID;
    int overBalanceID;
    int totalAmount;
    String reciever;
    
    public SellingBill() {
    }

	public SellingBill(int id, String billCode, Date date, String reason, String seller, int companyID,
			int overBalanceID, int totalAmount, String reciever) {
		super();
		this.id = id;
		this.billCode = billCode;
		this.date = date;
		this.reason = reason;
		this.seller = seller;
		this.companyID = companyID;
		this.overBalanceID = overBalanceID;
		this.totalAmount = totalAmount;
		this.reciever = reciever;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBillCode() {
		return billCode;
	}

	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public int getCompanyID() {
		return companyID;
	}

	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}

	public int getOverBalanceID() {
		return overBalanceID;
	}

	public void setOverBalanceID(int overBalanceID) {
		this.overBalanceID = overBalanceID;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

    
	
    
}
