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
public class PurchaseBill {
    int id;
    String sellerCode;
    String sellerName;
    String billCode;
    Date date;
    String reason;
    String reciever;
    int companyID;
    int overBalanceID;
    int totalAmount;

    public PurchaseBill() {
    }

	public PurchaseBill(int id, String sellerCode, String sellerName, String billCode, Date date, String reason,
			String reciever, int companyID, int overBalanceID, int totalAmount) {
		super();
		this.id = id;
		this.sellerCode = sellerCode;
		this.sellerName = sellerName;
		this.billCode = billCode;
		this.date = date;
		this.reason = reason;
		this.reciever = reciever;
		this.companyID = companyID;
		this.overBalanceID = overBalanceID;
		this.totalAmount = totalAmount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSellerCode() {
		return sellerCode;
	}

	public void setSellerCode(String sellerCode) {
		this.sellerCode = sellerCode;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
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

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
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

	

    
    
}
