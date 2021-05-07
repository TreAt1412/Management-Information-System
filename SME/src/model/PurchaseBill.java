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
    Date accountingDate;
    Date voucherDate;
    String reason;
    String reciever;
    int companyID;
    int overBalanceID;

    public PurchaseBill() {
    }

	public PurchaseBill(int id, String sellerCode, String sellerName, String billCode, Date accountingDate,
			Date voucherDate, String reason, String reciever, int companyID, int overBalanceID) {
		super();
		this.id = id;
		this.sellerCode = sellerCode;
		this.sellerName = sellerName;
		this.billCode = billCode;
		this.accountingDate = accountingDate;
		this.voucherDate = voucherDate;
		this.reason = reason;
		this.reciever = reciever;
		this.companyID = companyID;
		this.overBalanceID = overBalanceID;
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

	public Date getAccountingDate() {
		return accountingDate;
	}

	public void setAccountingDate(Date accountingDate) {
		this.accountingDate = accountingDate;
	}

	public Date getVoucherDate() {
		return voucherDate;
	}

	public void setVoucherDate(Date voucherDate) {
		this.voucherDate = voucherDate;
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

    
    
}
