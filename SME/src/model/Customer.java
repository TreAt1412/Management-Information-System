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
public class Customer {
    int id;
    String code;
    String name;
    String address;
    String taxNum;
    int companyID;

    public Customer() {
    }

    public Customer(int id, String code, String name, String address, String taxNum, int companyID) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.address = address;
        this.taxNum = taxNum;
        this.companyID = companyID;
    }

    public int getCompanyID() {
		return companyID;
	}

	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTaxNum() {
        return taxNum;
    }

    public void setTaxNum(String taxNum) {
        this.taxNum = taxNum;
    }
    
}
