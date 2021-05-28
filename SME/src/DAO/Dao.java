
package DAO;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;
import javax.sound.midi.Soundbank;

import model.Account;
import model.Customer;
import model.Employee;
import model.Good;
import model.GoodCategory;
import model.InBill;
import model.OutBill;
import model.OverBalance;
import model.PurchaseBill;
import model.PurchaseDetail;
import model.SellingBill;
import model.SellingDetail;
import model.WageTable;
import model.WageTableDetail;


public class Dao {
	public static Connection connection;
	public static ResultSet re;
	
	public Dao() {
		try {
			String connectString = "jdbc:mysql://b42nprse0flpxiihx96f-mysql.services.clever-cloud.com:3306/b42nprse0flpxiihx96f";
	        Class.forName("com.mysql.jdbc.Driver");
	        connection = (Connection) DriverManager.getConnection(connectString, "uv7gr4cxwtprm0ft", "mEQPoLMvqQfGxgjq6hCC");
	        
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
	public ArrayList<Customer> getAllCust(int companyID) throws SQLException{
	
		ArrayList<Customer> list = new ArrayList<Customer>();
		String sql = "select * from customer  where companyID = ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, companyID);
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
	
	public boolean addCustomer(Customer c, int accountID) throws SQLException {
		String sql = "insert into customer(code, name, address, taxNum, companyID) values(?, ?, ?, ?, ?)";
		PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, c.getCode());
		ps.setString(2, c.getName());
		ps.setString(3, c.getAddress());
		ps.setString(4, c.getTaxNum());
		ps.setInt(5, c.getCompanyID());
		ps.executeUpdate();
        ResultSet sss = ps.getGeneratedKeys();
		int id = 0;
		if (sss.next()) {
			id = sss.getInt(1);
			
		}
		sss.close();
		System.out.println("I1D: "+ id);
		
		
		sql = "insert into history(companyID, accountID, object,date, idObject) values(?,?,?,?,?)";
		ps = connection.prepareStatement(sql);
		ps.setInt(1,c.getCompanyID());
		ps.setInt(2, accountID);
		ps.setString(3, "Customer");
		ps.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
		ps.setInt(5, id);
		ps.executeUpdate();
		return true;
	}
	
	
	//Employee
	public ArrayList<Employee> getAllNV(int companyID)  {
        ArrayList<Employee> listNV = new ArrayList<>();      
        String sql = "SELECT * FROM employee where companyID = ?";
        try{
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, companyID);
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
    public boolean addEmployee(Employee nv, int companyID) throws SQLException, ClassNotFoundException {
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
    
    //Good
    public ArrayList<Good> getAllGood(int companyID)  {
        ArrayList<Good> listGood = new ArrayList<>();      
        String sql = "SELECT * FROM good where companyID = ?";
        try{
	        PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setInt(1, companyID);
	        re = ps.executeQuery();
	         
	        while (re.next()){
	            int id = re.getInt("id");
	            String name = re.getString("name");
	            String category = re.getString("goodCategory");
	            
      
            Good g = new Good(id, name, category, 0);
            listGood.add(g);
        }
        }catch(SQLException ex){
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listGood;
    }
    
    public boolean addGood(Good g, int companyID) throws SQLException, ClassNotFoundException {
        boolean rs;
        String query = "INSERT INTO good (name,goodCategory,CompanyID) VALUES (?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        
        ps.setString(1, g.getName());
        ps.setString(2, g.getGoodCategory());
        ps.setInt(3, g.getCompanyID());
        re = ps.getGeneratedKeys();
        rs = ps.executeUpdate()>0;
        return rs;
    
 	 }

    public ArrayList<GoodCategory> getAllGoodCategory()  {
        ArrayList<GoodCategory> listGC = new ArrayList<>();      
        String sql = "SELECT * FROM goodcategory";
        try{
	        PreparedStatement ps = connection.prepareStatement(sql);
	        re = ps.executeQuery();
	         
	        while (re.next()){
	            int id = re.getInt("id");
	            String name = re.getString("name");
	        GoodCategory gc = new GoodCategory(id, name);
            listGC.add(gc);
            System.out.print(listGC);
        }
        }catch(SQLException ex){
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listGC;
    }
    
    //PurchaseBill
    public ArrayList<PurchaseBill> getAllPurchaseBill(int companyID) throws ParseException  {
        ArrayList<PurchaseBill> listPB = new ArrayList<>();      
        String sql = "SELECT * FROM purchasebill where companyID = ?";
        try{
	        PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setInt(1, companyID);
	        re = ps.executeQuery();
	        SimpleDateFormat formater= new SimpleDateFormat("dd/MM/yyyy");
	        while (re.next()){
	            int id = re.getInt("id");
	            String billCode = re.getString("billCode");
	            Date date = re.getDate("Date");
	            String dateS = new SimpleDateFormat("yyyy-MM-dd").format(date);
	            System.out.println("date" +dateS);
	            java.util.Date  dateU =  new SimpleDateFormat("yyyy-MM-dd").parse(dateS);
	            
	            String reason = re.getString("reason");
	            String receiver = re.getString("receiver");
	            String sellerCode = re.getString("sellerName");
	            companyID = re.getInt("companyID");
	            int overBalanceID= re.getInt("overBalanceID");
	            int totalAmount = re.getInt("totalAmount");
	        PurchaseBill pb = new PurchaseBill(id, billCode, date, reason, receiver, sellerCode, companyID, overBalanceID, totalAmount);
            listPB.add(pb);
            System.out.print(listPB);
        }
        }catch(SQLException ex){
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPB;
    }
    
    
    public void addPurchaseBill(String code, String date, String reason, String receiver, 
    	int companyID, int overBalanceID, int totalAmount, String sellerName, List<PurchaseDetail> listPD) throws SQLException, ClassNotFoundException, ParseException {
        boolean rs;
        String query = "INSERT INTO purchasebill (billCode, Date, reason, receiver, companyID, overBalanceID,"
        		+ "totalAmount, sellerName ) VALUES (?, ?, ?, ?, ? ,? , ?, ?)";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        
        ps.setString(1, code);
        java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        ps.setDate(2,  new java.sql.Date(utilDate.getTime()));
        ps.setString(3, reason);
        ps.setString(4, receiver);
        ps.setInt(5, companyID);
        ps.setInt(6, overBalanceID);
        ps.setInt(7, totalAmount);
        ps.setString(8, sellerName);
        ps.executeUpdate();
        re = ps.getGeneratedKeys();
        int pdKey = 0;
        if(re.next()) {
        	pdKey = re.getInt(1);
        }
        for(int i=0; i< listPD.size(); i++) {
        	query = "insert into purchasedetail(purchaseID, goodName, quantity, price) values(?, ?, ?, ?)";
        	ps = connection.prepareStatement(query);
        	
        	ps.setInt(1, pdKey);
        	ps.setString(2, listPD.get(i).getGoodName());
        	ps.setInt(3, listPD.get(i).getQuantity());
        	ps.setInt(4, listPD.get(i).getPrice());
        	ps.execute();
        }
        
    
 	 }
    
    //SellingBill
    public ArrayList<SellingBill> getAllSellingBill(int companyID) throws ParseException  {
        ArrayList<SellingBill> listSB = new ArrayList<>();      
        String sql = "SELECT * FROM sellingbill where companyID = ?";
        try{
	        PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setInt(1, companyID);
	        re = ps.executeQuery();
	        SimpleDateFormat formater= new SimpleDateFormat("dd/MM/yyyy");
	        while (re.next()){
	            int id = re.getInt("id");
	            String billCode = re.getString("billCode");
	            Date date = re.getDate("Date");
	            
	            
	            String reason = re.getString("reason");
	            String receiver = re.getString("receiver");
	            String sellerName = re.getString("seller");
	            companyID = re.getInt("companyID");
	            int overBalanceID= re.getInt("overBalanceID");
	            int totalAmount = re.getInt("totalAmount");
	            SellingBill pb = new SellingBill(id, billCode, date, reason, receiver, companyID, overBalanceID, totalAmount, sellerName);
	        listSB.add(pb);
            System.out.print(listSB);
        }
        }catch(SQLException ex){
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSB;
    }
    
    public void addSellingBill(String code, String date, String reason, String receiver, 
    	int companyID, int overBalanceID, int totalAmount, String seller, List<SellingDetail> listSD) throws SQLException, ParseException {
    	 boolean rs;
         String query = "INSERT INTO sellingbill (billCode, Date, reason, receiver, seller, companyID, overBalanceID,"
         		+ "totalAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
         PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
         
         ps.setString(1, code);
         java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
         ps.setDate(2,  new java.sql.Date(utilDate.getTime()));
         ps.setString(3, reason);
         ps.setString(4, receiver);
         ps.setString(5, seller);
         ps.setInt(6, companyID);
         ps.setInt(7, overBalanceID);
         ps.setInt(8, totalAmount);
         
         ps.executeUpdate();
         re = ps.getGeneratedKeys();
         int pdKey = 0;
         if(re.next()) {
         	pdKey = re.getInt(1);
         }
         for(int i=0; i< listSD.size(); i++) {
         	query = "insert into sellingdetail(sellingID, goodName, quantity, price) values(?, ?, ?, ?)";
         	ps = connection.prepareStatement(query);
         	
         	ps.setInt(1, pdKey);
         	ps.setString(2, listSD.get(i).getGoodName());
         	ps.setInt(3, listSD.get(i).getQuantity());
         	ps.setInt(4, listSD.get(i).getPrice());
         	ps.execute();
         }
         
     
    }
    
    //OverBalance
    public ArrayList<OverBalance> getAllOB(int companyID)  {
        ArrayList<OverBalance> listOB = new ArrayList<>();      
        String sql = "SELECT * FROM overbalance where companyID = ?";
        try{
	        PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setInt(1, companyID);
	        re = ps.executeQuery();
	         
	        while (re.next()){
	            int id = re.getInt("id");
	            String code = re.getString("code");
	            String name = re.getString("name");
	            String bankName = re.getString("bankName");
	            String bankAccount = re.getString("bankAccount");
	            
	            companyID = re.getInt("companyID");
	            int offset = re.getInt("offset");
      
            OverBalance ob = new OverBalance(id, code, name, bankName, bankAccount, companyID, offset);
            listOB.add(ob);
        }
        }catch(SQLException ex){
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOB;
    }
    
    //WageTable
    public ArrayList<WageTable> getAllWT(int companyID)  {
        ArrayList<WageTable> listWT = new ArrayList<>();      
        String sql = "SELECT * FROM wagetable where companyID = ?";
        try{
	        PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setInt(1, companyID);
	        re = ps.executeQuery();
	         
	        while (re.next()){
	            int id = re.getInt("id");
	            int month = re.getInt("month");
	            int year = re.getInt("year");
	            int totalMoney = re.getInt("totalMoney");
	            companyID = re.getInt("companyID");
	       
      
            WageTable wt = new WageTable(id, month, year, totalMoney, companyID);
            listWT.add(wt);
        }
        }catch(SQLException ex){
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listWT;
    }
    
    public void addWageTable(List<WageTableDetail> list, int month, int year, int totalMoney, int companyID ) throws SQLException, ClassNotFoundException {
        String query = "INSERT INTO wagetable (month, year, totalMoney, companyID) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        
        ps.setInt(1, month);
        ps.setInt(2, year);
        ps.setInt(3, totalMoney);
        ps.setInt(4, companyID);
        ps.executeUpdate();
        re = ps.getGeneratedKeys();
        int wagetableID = 0;
        if(re.next()) {
        	wagetableID = re.getInt(1);
        }
        
        for(int i=0; i< list.size(); i++) {
        	query = "insert into wagetabledetail(employeeName, department, role, wage, note, wagetableID) values(?, ?, ?, ?, ?, ?)";
        	ps = connection.prepareStatement(query);
        	
        	ps.setString(1, list.get(i).getEmployeeName());
        	ps.setString(2, list.get(i).getDepartment());
        	ps.setString(3, list.get(i).getRole());
        	ps.setInt(4, list.get(i).getWage());
        	ps.setString(5, list.get(i).getNote());
        	ps.setInt(6, wagetableID);
        	ps.execute();
        }
        
    } 
    
    public List<WageTableDetail> getWageTableDetail1(int id) throws SQLException {
    	String sql = "select * from wagetabledetail where wagetableID = ? ";
    	PreparedStatement ps = connection.prepareStatement(sql);
    	
    	ps.setInt(1, id);
    
    	re = ps.executeQuery();
    	List<WageTableDetail> list = new ArrayList<WageTableDetail>();
    	while(re.next()) {
    		String name = re.getString("employeeName");
    		String department = re.getString("department");
    		String role = re.getString("role");
    		int wage = re.getInt("wage");
    		System.out.println(wage);	
    		String note = re.getString("note");
    		WageTableDetail a = new WageTableDetail(0, name, department, role, wage, note, id);
    		list.add(a);
    	}
    	System.out.println("");
    	return list;
    	
    }
    
    public List<WageTableDetail> getWageTableDetail(int companyID) throws SQLException {
    	String sql = "select * from wagetabledetail where companyID = ?";
    	PreparedStatement ps = connection.prepareStatement(sql);
    	ps.setInt(1, companyID);
    	re = ps.executeQuery();
    	List<WageTableDetail> list = new ArrayList<WageTableDetail>();
    	while(re.next()) {
    		String name = re.getString("employeeName");
    		String department = re.getString("department");
    		String role = re.getString("role");
    		int wage = re.getInt("wage");
    		
    		String note = re.getString("note");
    		int wagetableID = re.getInt("wagetableID");
    		WageTableDetail a = new WageTableDetail(0, name, department, role, wage, note, wagetableID);
    		list.add(a);
    	}
    
    	return list;
    	
    } 
    
    
    //InBill
    public ArrayList<InBill> getAllInBill(int companyID) throws SQLException {
    	ArrayList<InBill> lib = new ArrayList<InBill>();
    	String sql = "select * from inbill where companyID = ?";
    	PreparedStatement ps = connection.prepareStatement(sql);
    	 ps.setInt(1, companyID);
    	re = ps.executeQuery();
    	while(re.next()) {
    		String payer = re.getString("payer");
    		String reason = re.getString("reason");
    		int amount = re.getInt("amount");
    		companyID = re.getInt("companyID");
    		java.sql.Date date = re.getDate("date");
    		int overBalanceID = re.getInt("overBalanceID");
    		lib.add(new InBill(0, payer, reason, amount, companyID, date,overBalanceID));
    	}
    	return lib;
    	
    }
    
    public void addInBill(String payer, String reason, int amount, int companyID, String date, int overbalanceID) throws SQLException, ParseException {
		String sql = "insert into inbill(payer, reason, amount, companyID, date, overbalanceID) values(?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, payer);
		ps.setString(2, reason);
		ps.setInt(3, amount);
		ps.setInt(4, companyID);
		java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
	    ps.setDate(5,  new java.sql.Date(utilDate.getTime()));
		ps.setInt(6, overbalanceID);
		re = ps.getGeneratedKeys();
		
		ps.executeUpdate();
        re = ps.getGeneratedKeys();
	}
    
    
   //OutBill
    
    public ArrayList<OutBill> getAllOutBill(int companyID) throws SQLException {
    	ArrayList<OutBill> lob = new ArrayList<OutBill>();
    	String sql = "select * from outbill where companyID = ?";
    	PreparedStatement ps = connection.prepareStatement(sql);
    	 ps.setInt(1, companyID);
    	re = ps.executeQuery();
    	while(re.next()) {
    		String payer = re.getString("receiver");
    		String reason = re.getString("reason");
    		int amount = re.getInt("amount");
    		companyID = re.getInt("companyID");
    		java.sql.Date date = re.getDate("date");
    		int overBalanceID = re.getInt("overBalanceID");
    		lob.add(new OutBill(0, payer, reason, amount, companyID, date,overBalanceID));
    	}
    	return lob;
    	
    }
    
    public void addOutBill(String receiver, String reason, int amount, int companyID, String date, int overbalanceID) throws SQLException, ParseException {
		String sql = "insert into outbill(receiver, reason, amount, companyID, date, overbalanceID) values(?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, receiver);
		ps.setString(2, reason);
		ps.setInt(3, amount);
		ps.setInt(4, companyID);
		java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
	    ps.setDate(5,  new java.sql.Date(utilDate.getTime()));
		ps.setInt(6, overbalanceID);
		re = ps.getGeneratedKeys();
		
		ps.executeUpdate();
        re = ps.getGeneratedKeys();
	}
    
    //GTGT
    public int getTNCN(int companyID) {
    	int sum = 0;
    	ArrayList<WageTable> list = new ArrayList<WageTable>();
    	list = getAllWT(companyID);
    	for(int i=0; i< list.size(); i++) {
    		sum += list.get(i).getTotalMoney();
    	}
    	System.out.println(list.size());
    	return sum;
    }
    
    //Daonh thu
    public int getDTBH(int companyID) throws ParseException {
    	int sum = 0;
    	ArrayList<SellingBill> list = new ArrayList<SellingBill>();
    	list = getAllSellingBill(companyID);
    	for(int i=0; i<list.size(); i++) {
    		sum += list.get(i).getTotalAmount();
    	}
    	System.out.println(list.size());
    	System.out.println(sum);
    	return sum;
    }
    // Nhap so du
	public void addOverbalance(OverBalance c) throws SQLException {
		String sql = "insert into overbalance(code, name, bankName, bankAccount, companyID,offset) values(?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, c.getCode());
		ps.setString(2, c.getName());
		ps.setString(3, c.getBankName());
		ps.setString(4, c.getBankAccount());
		ps.setInt(5, c.getCompanyID());
		ps.setInt(6, c.getOffset());
			
		ps.executeUpdate();		
	}
	//bao cao
	public ArrayList<Integer> getBCTC(int companyID) throws ParseException, SQLException{
		ArrayList<OverBalance> listOB = getAllOB(companyID);
		ArrayList<Integer> listBCTC = new ArrayList<>();
		ArrayList<PurchaseBill> listPB = getAllPurchaseBill(companyID);
		ArrayList<SellingBill> listSB = getAllSellingBill(companyID);
		ArrayList<InBill> listIB = getAllInBill(companyID);
		ArrayList<OutBill> listOutB  = getAllOutBill(companyID);
		for(int i=0; i<listOB.size();i++) {
			int sum = 0;
			for(int j = 0; j<listPB.size();j++) {
				if(listPB.get(j).getOverBalanceID()== Integer.parseInt(listOB.get(i).getCode())) {
					sum -= listPB.get(j).getTotalAmount();
				}				
			}
			for(int j = 0; j<listSB.size();j++) {
				if(listSB.get(j).getOverBalanceID()== Integer.parseInt(listOB.get(i).getCode())) {
					sum += listSB.get(j).getTotalAmount();	
				}						
			}
			for(int j = 0; j<listIB.size();j++) {				
				if(listIB.get(j).getOverBalanceID()== Integer.parseInt(listOB.get(i).getCode())) {
					sum += listIB.get(j).getAmount();
				}
			}
			for(int j = 0; j<listOutB.size();j++) {				
				if(listOutB.get(j).getOverBalanceID()== Integer.parseInt(listOB.get(i).getCode())) {
					sum -= listOutB.get(j).getAmount();	
				}
			}
			listBCTC.add(sum);
		}
		return listBCTC;
	}

	public List<Account> getAllAccount(int companyID) throws SQLException {
		// TODO Auto-generated method stub
		List<Account> la = new ArrayList<Account>();
		String sql = "select * from account where companyID = ?";
		
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, companyID);
		re = ps.executeQuery();
		while(re.next()) {
			int id = re.getInt("id");
			String username = re.getString("username");
			int role = re.getInt("role");
			String email = re.getString("email");
			la.add(new Account(0, username, "", companyID, role, email));
		}
		
		return la;
	}
}
