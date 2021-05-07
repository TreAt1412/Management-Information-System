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
    String buyerCode;
    String buyerName;
    String billCode;
    Date accountingDate;
    Date voucherDate;
    String reason;
    String seller;
    int companyID;
    int overBalanceID;

    public SellingBill() {
    }

	public SellingBill(int id, String buyerCode, String buyerName, String billCode, Date accountingDate,
			Date voucherDate, String reason, String seller, int companyID, int overBalanceID) {
		super();
		this.id = id;
		this.buyerCode = buyerCode;
		this.buyerName = buyerName;
		this.billCode = billCode;
		this.accountingDate = accountingDate;
		this.voucherDate = voucherDate;
		this.reason = reason;
		this.seller = seller;
		this.companyID = companyID;
		this.overBalanceID = overBalanceID;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBuyerCode() {
		return buyerCode;
	}

	public void setBuyerCode(String buyerCode) {
		this.buyerCode = buyerCode;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
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

    
    
}
