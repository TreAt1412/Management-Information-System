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
    String billCode;
    Date date;
    String reason;
    String receiver;
    String sellerCode;
    int companyID;
    int overBalanceID;
    int totalAmount;

    public PurchaseBill() {
    }
    
	public PurchaseBill(int id, String billCode, Date date, String reason, String receiver, String sellerCode,
			int companyID, int overBalanceID, int totalAmount) {
		super();
		this.id = id;
		this.billCode = billCode;
		this.date = date;
		this.reason = reason;
		this.receiver = receiver;
		this.sellerCode = sellerCode;
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

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSellerCode() {
		return sellerCode;
	}

	public void setSellerCode(String sellerCode) {
		this.sellerCode = sellerCode;
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
