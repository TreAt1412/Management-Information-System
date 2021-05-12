package model;

import java.util.Date;

public class InBill {
	int id;
	String payer, reason;
	int amount;
	int companyID;
	Date date;
	public InBill() {
		super();
	}
	public InBill(int id, String payer, String reason, int amount, int companyID, Date date) {
		super();
		this.id = id;
		this.payer = payer;
		this.reason = reason;
		this.amount = amount;
		this.companyID = companyID;
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPayer() {
		return payer;
	}
	public void setPayer(String payer) {
		this.payer = payer;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getCompanyID() {
		return companyID;
	}
	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
