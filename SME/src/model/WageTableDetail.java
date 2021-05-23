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
public class WageTableDetail {
    int id;
    String employeeName;
    String department;
    String role;
    int wage;
    String note;
    int wagetableID;

    public WageTableDetail() {
    }

	public WageTableDetail(int id, String employeeName, String department, String role, int wage, String note,
			int wagetableID) {
		super();
		this.id = id;
		this.employeeName = employeeName;
		this.department = department;
		this.role = role;
		this.wage = wage;
		this.note = note;
		this.wagetableID = wagetableID;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getWage() {
		return wage;
	}

	public void setWage(int wage) {
		this.wage = wage;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getWagetableID() {
		return wagetableID;
	}

	public void setWagetableID(int wagetableID) {
		this.wagetableID = wagetableID;
	}

    
    
}
