package model;

import java.util.Date;

public class InBill {
	int id;
	String payer, reason;
	int amount;
	int overBalanceID;
	Date date;
	public InBill() {
		super();
	}
	public InBill(int id, String payer, String reason, int amount, int overBalanceID, Date date) {
		super();
		this.id = id;
		this.payer = payer;
		this.reason = reason;
		this.amount = amount;
		this.overBalanceID = overBalanceID;
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
	public int getOverBalanceID() {
		return overBalanceID;
	}
	public void setOverBalanceID(int overBalanceID) {
		this.overBalanceID = overBalanceID;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
