
package DAO;
import java.sql.Connection;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;
import javax.sound.midi.Soundbank;


import model.Customer;
import model.Employee;


public class Dao {
	public static Connection connection;
	public static ResultSet re;
	
	public Dao() {
		try {
			String connectString = "jdbc:mysql://localhost:3306/sme";
	        Class.forName("com.mysql.jdbc.Driver");
	        connection = (Connection) DriverManager.getConnection(connectString, "root", "Thang310599");
	        
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public int checkCompanyCodeExit(String code) throws SQLException{
		String sql="select * from company where code = ?";
		
		PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, code);
       
        
        re=ps.executeQuery();
        while(re.next()) {
        	return -1;
        }
        
        return 1;
		
	}
	public int checkCompanyTaxNumExit(String taxNum) throws SQLException{
		String sql="select * from company where taxNum = ?";
		
		PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, taxNum);
    
        
        re=ps.executeQuery();
        while(re.next()) {
        	return -1;
        }
        
        return 1;
		
	}
	
	// Dang ki doanh nghiep
	public int createCompany(String name, String code, String taxNum, String detail, String managerName
			,String username, String password, String email ) throws SQLException{
		if(checkCompanyCodeExit(code) == -1)
			return -1;
		if(checkCompanyTaxNumExit(taxNum) == -1)
			return -1;
		
		String sql="insert into company (name, code, taxNum, detail)\r\n" + 
				"values  (?,?, ?, ?)";
		PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, name);
        ps.setString(2, code);
        ps.setString(3, taxNum);
        ps.setString(4, detail);
        ps.executeUpdate();
        re = ps.getGeneratedKeys();
        int companyID =0;
		if(re.next()) {
			companyID = re.getInt(1);
		}
		
		int managerAccountID = createAccount(username, password,companyID,0,  email);
		
		int temp = createManager(managerName, "", managerAccountID);
		
		return 1;
	}
	public int createAccount(String username, String password, int companyID, int role, String email) throws SQLException{
		
		
		if(checkAccountExist(username, companyID, email) != -1)
			return -1;
		
		String sql="insert into account (username, password, companyID, role, email)\r\n" + 
				"values  (?,?, ?, ?,?)";
		PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, username);
        ps.setString(2, String.valueOf(password.hashCode()));
        ps.setInt(3, companyID);
        ps.setInt(4,role);
        ps.setString(5, email);
        ps.executeUpdate();
        re = ps.getGeneratedKeys();
        int accountID =0;
		if(re.next()) {
			accountID = re.getInt(1);
		}
		
        return accountID;
	}
	
	
	public int checkAccountExist(String username, int companyID, String email) throws SQLException{
		String sql = "select * from account where username=? and companyID = ? and email=?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, companyID);
		ps.setString(3, email);
		ps.executeQuery();
		int accountID =-1;
		if(re.next()) {
			accountID = re.getInt(1);
		}
		
		return accountID;
	}
	
	public int createManager(String name, String phoneNum, int accountID) throws SQLException{
		
		String sql="insert into manager (name, phoneNum, accountID)\r\n" + 
				"values  (?, ?,?)";
		PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, phoneNum);
        ps.setInt(3, accountID);
        ps.executeUpdate();
		return 1;
	}
	
	public int[] login(String companyCode, String username, String password ) throws SQLException{
		String sql = "select company.id, account.id, account.role  from account,company"
				+ " where account.username=? and account.password = ? "
				+ " and account.companyID = company.id"
				+ "	and company.code = ?";
		System.out.println("1111");
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, username);
	    ps.setString(2, String.valueOf(password.hashCode()));
	    ps.setString(3, companyCode);
	    
	    re = ps.executeQuery();
	    int companyID=0, accountID=0, role=0;
        while (re.next()) {
       	 	companyID = re.getInt(1);
       	 	accountID = re.getInt(2);
       	 	role = re.getInt(3);
        }
        System.out.println(2222);
        int[] array= {0,0,0};
        array[0] = companyID;
        array[1] = accountID;
        array[2] = role;
        System.out.println(3333);
		return array;
	}
	
	//Customer
	public ArrayList<Customer> getAllCust() throws SQLException{
	
		ArrayList<Customer> list = new ArrayList<Customer>();
		String sql = "select * from customer";
		PreparedStatement ps = connection.prepareStatement(sql);
		 re = ps.executeQuery();
		while(re.next()) {
			int id = re.getInt("id");
			String code = re.getString("code");
			String name = re.getString("name");
			String address = re.getString("address");
			String taxNum = re.getString("taxNum");
			
			Customer c = new Customer(id, code, name, address, taxNum, 0);
			list.add(c);
		}
		return list;
		
	}
	
	public ArrayList<Customer> getCustById(int companyID) throws SQLException{
		
		ArrayList<Customer> list = new ArrayList<Customer>();
		String sql = "select * from customer where companyID = ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, companyID);
		re = ps.executeQuery();
		while(re.next()) {
			int id = re.getInt("id");
			String code = re.getString("code");
			String name = re.getString("name");
			String address = re.getString("address");
			String taxNum = re.getString("taxNum");
			
			Customer c = new Customer(id, code, name, address, taxNum, companyID);
			list.add(c);
		}
		return list;
		
	}
	
	public boolean addCustomer(Customer c) throws SQLException {
		String sql = "insert into customer(code, name, address, taxNum, companyID) values(?, ?, ?, ?, ?)";
		PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, c.getCode());
		ps.setString(2, c.getName());
		ps.setString(3, c.getAddress());
		ps.setString(4, c.getTaxNum());
		ps.setInt(5, c.getCompanyID());
		re = ps.getGeneratedKeys();
		
		boolean check = ps.executeUpdate() > 0;
		return check;	
	}
	
	
	//Employee
	public ArrayList<Employee> getAllNV()  {
        ArrayList<Employee> listNV = new ArrayList<>();      
        String sql = "SELECT * FROM employee";
        try{
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
         
        while (rs.next()){
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String department = rs.getString("department");
            String role = rs.getString("role");
            String bankAccount = rs.getString("bankAccount");
            String bankName = rs.getString("bankName");
            int wage = rs.getInt("wage");
      
            Employee nv = new Employee(id, name, department, role, bankAccount, bankName, wage, 0 );
            listNV.add(nv);
        }
        }catch(SQLException ex){
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listNV;
    }
    public boolean addEmployee(Employee nv) throws SQLException, ClassNotFoundException {
            boolean rs;
            String query = "INSERT INTO employee (name,department,role,bankAccount,bankName,wage,CompanyID) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            ps.setString(1, nv.getName());
            ps.setString(2, nv.getDepartment());
            ps.setString(3, nv.getRole());
            ps.setString(4, nv.getBankAccount());
            ps.setString(5, nv.getBankName());
            ps.setInt(6, nv.getWage());
            ps.setInt(7, nv.getCompanyID());
            re = ps.getGeneratedKeys();
            rs = ps.executeUpdate()>0;
            return rs;
    } 
}
