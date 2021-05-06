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
    int goodID;
    int quantity;
    float tax;
    int purchaseID;
    String storageAccount;
    String moneyAccount;

    public PurchaseDetail() {
    }

    public PurchaseDetail(int id, int goodID, int quantity, float tax, int purchaseID, String storageAccount, String moneyAccount) {
        this.id = id;
        this.goodID = goodID;
        this.quantity = quantity;
        this.tax = tax;
        this.purchaseID = purchaseID;
        this.storageAccount = storageAccount;
        this.moneyAccount = moneyAccount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGoodID() {
        return goodID;
    }

    public void setGoodID(int goodID) {
        this.goodID = goodID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTax() {
        return tax;
    }

    public void setTax(float tax) {
        this.tax = tax;
    }

    public int getPurchaseID() {
        return purchaseID;
    }

    public void setPurchaseID(int purchaseID) {
        this.purchaseID = purchaseID;
    }

    public String getStorageAccount() {
        return storageAccount;
    }

    public void setStorageAccount(String storageAccount) {
        this.storageAccount = storageAccount;
    }

    public String getMoneyAccount() {
        return moneyAccount;
    }

    public void setMoneyAccount(String moneyAccount) {
        this.moneyAccount = moneyAccount;
    }
    
}
