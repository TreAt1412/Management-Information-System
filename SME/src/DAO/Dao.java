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

import javax.sound.midi.Soundbank;


public class Dao {
	public static Connection connection;
	public static ResultSet re;
	
	public Dao() {
		try {
			String connectString = "jdbc:mysql://localhost:3306/sme";
	        Class.forName("com.mysql.jdbc.Driver");
	        connection = (Connection) DriverManager.getConnection(connectString, "root", "123qweasd");
	        
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public int checkCompanyCodeExit(String code, String taxNum) throws SQLException{
		String sql="select * from company where code = ? and taxNum = ?";
		
		PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, code);
        ps.setString(2, taxNum);
        
        re=ps.executeQuery();
        while(re.next()) {
        	return -1;
        }
        
        return 1;
		
	}
	
	// Dang ki doanh nghiep
	public int createCompany(String name, String code, String taxNum, String detail, String managerName
			,String username, String password, String email ) throws SQLException{
		if(checkCompanyCodeExit(code, taxNum) == -1)
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
		
		int temp = createManager(managerName, "", "", "", managerAccountID);
		
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
	
	public int createManager(String name, String phoneNum, String taxNum, String bankAccount, int accountID) throws SQLException{
		
		String sql="insert into manager (name, phoneNum, taxNum, bankAccount, accountID)\r\n" + 
				"values  (?,?, ?, ?,?)";
		PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, phoneNum);
        ps.setString(3, taxNum);
        ps.setString(4, bankAccount);
        ps.setInt(5, accountID);
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
	
}
