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
    int goodCategory;

    public Good() {
    }

    public Good(int id, String name, int goodCategory) {
        this.id = id;
        this.name = name;
        this.goodCategory = goodCategory;
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

    public int getGoodCategory() {
        return goodCategory;
    }

    public void setGoodCategory(int goodCategory) {
        this.goodCategory = goodCategory;
    }
    
}
