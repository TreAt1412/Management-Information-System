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
public class Good {
    int id;
    String name;
    String goodCategory;
    int companyID;

    public Good() {
    }

    

    public Good(int id, String name, String goodCategory, int companyID) {
		super();
		this.id = id;
		this.name = name;
		this.goodCategory = goodCategory;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGoodCategory() {
        return goodCategory;
    }

    public void setGoodCategory(String goodCategory) {
        this.goodCategory = goodCategory;
    }
    
}
