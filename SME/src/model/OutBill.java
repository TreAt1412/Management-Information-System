package model;

import java.util.Date;

public class OutBill {
	int id;
	String receiver, reason;
	int amount, overBalanceID;
	Date date;
	public OutBill() {
		super();
	}
	public OutBill(int id, String receiver, String reason, int amount, int overBalanceID, Date date) {
		super();
		this.id = id;
		this.receiver = receiver;
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
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
