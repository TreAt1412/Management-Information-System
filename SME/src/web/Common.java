package web;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.Dao;
import model.Customer;
import model.Employee;
import model.Good;
import model.OverBalance;
import model.PurchaseDetail;
import model.SellingDetail;
import model.WageTableDetail;

/**
 * Servlet implementation class Common
 */

public class Common extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Dao dao;
    public Common() {
        // TODO Auto-generated constructor stub
    	dao = new Dao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		request.setCharacterEncoding("UTF-8");
		System.out.println(action);
		try {
			switch (action) {
			case "/doCreateAccount":
				doCreateAccount(request,response);
				break;
			case "/register":
				showRegisterPage(request, response);
				break;
			case "/doregister":
				doRegister(request, response);
				break;
			case "/login":
				loginAccount(request, response);
				break;
			case "/dologin":
				loginAccount(request, response);
				break;
			case "/temp":
				doTemp(request,response);
				break;
			case "/doCustomer":
				doCustomer(request, response);
				break;
			case "/doEmployee":
				doEmployee(request, response);
				break;
			case "/doGood":
				doGood(request, response);
				break;
			case "/doPurchaseBill":
				doPurchaseBill(request, response);
				break;
			case "/doSellingBill":
				doSellingBill(request, response);
				break;
			case "/doWageTable":
				doWageTable(request, response);
				break;
			case "/doInBill":
				doInBill(request, response);
				break;
			case "/doOutBill":
				doOutBill(request, response);
				break;
			case "/doOverbalance":
				doOverbalance(request, response);
				break;
			default:
				showLoginPage(request, response);
				break;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	

	private void doCreateAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int role = Integer.parseInt(request.getParameter("role"));
		String email = request.getParameter("email");
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		int x = dao.createAccount(username, password, companyID, role, email);
		request.getRequestDispatcher("Account").forward(request, response);;
	}

	private void doOverbalance(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String bankName = request.getParameter("bankName");
		String bankAccount = request.getParameter("bankAccount");
		int offset = Integer.parseInt(request.getParameter("offset"));
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		System.out.println(companyID);
		OverBalance ob = new OverBalance(0, code, name, bankName, bankAccount, companyID,offset);
		new Dao().addOverbalance(ob);
		response.sendRedirect("Overbalance.jsp");	
	}

	private void doOutBill(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException, IOException {
		// TODO Auto-generated method stub
		String receiver = request.getParameter("name");
		String reason = request.getParameter("reason");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String date = request.getParameter("date");
		int overBalanceID = Integer.parseInt(request.getParameter("overBalanceID"));	
		
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		
		dao.addOutBill(receiver, reason, amount, companyID, date, overBalanceID);
		response.sendRedirect("OutBill");
	}

	private void doInBill(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException, IOException {
		// TODO Auto-generated method stub
		String payer = request.getParameter("name");
		String reason = request.getParameter("reason");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String date = request.getParameter("date");
		int overBalanceID = Integer.parseInt(request.getParameter("overBalanceID"));	
		
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		
		dao.addInBill(payer, reason, amount, companyID, date, overBalanceID);
		response.sendRedirect("InBill");
	}

	private void doWageTable(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		int month = Integer.parseInt(request.getParameter("month"));
		System.out.println("month" + month);
		int year = Integer.parseInt(request.getParameter("year"));
		System.out.println("year" + year);
        String[] wages = request.getParameterValues("wage");
        String[] notes = request.getParameterValues("note");
        Cookie[] cookies = request.getCookies();
        int companyID = 0;
        if(cookies!=null){
        	for(Cookie cookie:cookies){
        		if(cookie.getName().equals("companyID"))
        			companyID = Integer.parseInt(cookie.getValue());
        	}
        	
        }
        
        List<WageTableDetail> list = new ArrayList<WageTableDetail>();
        List<Employee> nv = dao.getAllNV(companyID);
        for(int i=0; i<nv.size(); i++) {
        	String name = nv.get(i).getName();
        	String department = nv.get(i).getDepartment();
        	String role = nv.get(i).getRole();
        	list.add(new WageTableDetail(0, name, department, role, Integer.parseInt(wages[i]), notes[i], 0));
        }
        
       
        
        int totalMoney = 0;
        for(int i=0;i<wages.length;i++) {
			totalMoney+=Integer.parseInt(wages[i]);
		}	
        
    
		
		
		dao.addWageTable(list, month, year, totalMoney, companyID);
		response.sendRedirect("WageTable");
		
		
	}
	
	private void doSellingBill(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException, IOException {
		// TODO Auto-generated method stub
		//String nhacc = request.getParameter("nhacc1");		
		String reason = request.getParameter("reason");		
		String receiver = request.getParameter("nhacc");	
		String seller = request.getParameter("NVBH");	
		String date = request.getParameter("date");		
		String code = request.getParameter("code");		
		String[] names = request.getParameterValues("goodName");
		String[] quantity = request.getParameterValues("code1");
		String[] price = request.getParameterValues("code2");	
		String[] total = request.getParameterValues("code3");	
		int overBalanceID = Integer.parseInt(request.getParameter("overBalanceID"));		
		int totalMoney = 0;
		for(int i=0;i<total.length;i++) {
			totalMoney+=Integer.parseInt(total[i]);
		}	
		totalMoney += (int)(totalMoney / 10);
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		List<SellingDetail> sd = new ArrayList<>();
		for(int i=0; i<names.length; i++) {
			String name = names[i];
			int quantity1 = Integer.parseInt(quantity[i]);
			int price1 = Integer.parseInt(price[i]);
			sd.add(new SellingDetail(0, 0, name, quantity1, price1));
			
		}
		dao.addSellingBill(code, date, reason, receiver, companyID, overBalanceID, totalMoney, seller,sd);
		response.sendRedirect("SellingBill");
	}
	
	private void doPurchaseBill(HttpServletRequest request, HttpServletResponse response) 
			throws ClassNotFoundException, SQLException, ParseException, IOException {
		// TODO Auto-generated method stub
		String nhacc = request.getParameter("nhacc1");		
		String reason = request.getParameter("reason");		
		String receiver = request.getParameter("NVMH");		
		String date = request.getParameter("date");		
		String code = request.getParameter("code");		
		String[] names = request.getParameterValues("goodName");
		String[] quantity = request.getParameterValues("code1");
		String[] price = request.getParameterValues("code2");	
		String[] total = request.getParameterValues("code3");	
		int overBalanceID = Integer.parseInt(request.getParameter("overBalanceID"));		
		int totalMoney = 0;
		for(int i=0;i<total.length;i++) {
			totalMoney+=Integer.parseInt(total[i]);
		}	
		totalMoney += (int)(totalMoney / 10);
		
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		List<PurchaseDetail> pd = new ArrayList<>();
		for(int i=0; i<names.length; i++) {
			String name = names[i];
			int quantity1 = Integer.parseInt(quantity[i]);
			int price1 = Integer.parseInt(price[i]);
			pd.add(new PurchaseDetail(0, 0, name, quantity1, price1));
			
		}
		dao.addPurchaseBill(code, date, reason, receiver, companyID, overBalanceID, totalMoney, nhacc, pd);
		response.sendRedirect("PurchaseBill");
	}

	private void doGood(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String goodCategory = request.getParameter("goodCategory");
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		System.out.println(goodCategory);
		Good g = new Good(0, name, goodCategory, companyID);
		
		boolean check = new Dao().addGood(g, companyID);
		if(check == true) {
			response.sendRedirect("Good");
		}
		else {
			Cookie message = new Cookie("message", "not success");
			response.addCookie(message);
			
			response.sendRedirect("Good");
		}
		
	}

	private void doEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ClassNotFoundException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
        String department = request.getParameter("department");    
        String role = request.getParameter("role");
        String bankAccount = request.getParameter("bankAccount");
        String bankName = request.getParameter("bankName");
        int wage = Integer.parseInt(request.getParameter("wage"));
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		
		Employee nv = new Employee(0, name, department, role, bankAccount, bankName, wage, companyID);
        boolean check = new Dao().addEmployee(nv, companyID);
		if (check == true){
			response.sendRedirect("Employee");
		}
		else {
			Cookie message = new Cookie("message", "not success");
			response.addCookie(message);
			
			response.sendRedirect("Employee");
		}
		
	}

	private void doCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String taxNum = request.getParameter("taxNum");
		Cookie[] cookies = request.getCookies();
		int companyID = 0;
		int accountID = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
				if(cookie.getName().equals("accountID"))
					accountID = Integer.parseInt(cookie.getValue());
			}
			
		}
		
		
		System.out.println(companyID);
		Customer c = new Customer(0, code, name, address, taxNum, companyID);
		dao.addCustomer(c, accountID);
		
		response.sendRedirect("Customer");
		
	}

	private void doTemp(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("TEMP: ");
		String[] names = request.getParameterValues("name");
		System.out.println(names.length);
		for( String name: names) {
			System.out.println("NAME: "+name);
		}
		String[] types = request.getParameterValues("type");
		System.out.println(types.length);
		for( String name: types) {
			System.out.println("NAME: "+name);
		}
	}

	private void doRegister(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException{
		// TODO Auto-generated method stub
		String companyCode= request.getParameter("companyCode");
		String companyName= request.getParameter("companyName");
		String taxNum = request.getParameter("taxNum");
		String detail = request.getParameter("detail");
		String email = request.getParameter("email");
		String managerName= request.getParameter("managerName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		
		int check = dao.createCompany(companyName, companyCode, taxNum, detail, managerName, username, password, email);
		
		if(check == 1) {
			response.sendRedirect("/SME");
		}
		else{
			Cookie message = new Cookie("message","notsucess");
		
			response.addCookie(message);
			
			response.sendRedirect("register");
		}
		
	}

	private void loginAccount(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException{
		// TODO Auto-generated method stub
		String companyCode = request.getParameter("companyCode");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(companyCode + username + password);
		int[] loginStatus = dao.login(companyCode, username, password);
		
		int companyID = loginStatus[0];
		int accountID = loginStatus[1];
		int role = loginStatus[2];
		if (companyID !=0) {
			Cookie companyIDCookie = new Cookie("companyID",String.valueOf(companyID));
			companyIDCookie.setMaxAge(30*60);
			Cookie accountIDCookie = new Cookie("accountID",String.valueOf(accountID));
			companyIDCookie.setMaxAge(30*60);
			Cookie roleCookie = new Cookie("role",String.valueOf(role));
			companyIDCookie.setMaxAge(30*60);
			response.addCookie(companyIDCookie);
			response.addCookie(accountIDCookie);
			response.addCookie(roleCookie);
			
			response.sendRedirect("Home");
		}
		else {
			response.addCookie(new Cookie("message", "notsuccess"));
			response.sendRedirect("/SME");
		}
		
	}

	private void showRegisterPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
		String message = "";
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("message"))
					message = cookie.getValue();
			}
			
		}
		
		if(message.equals("")) {
			request.setAttribute("message", "");
		}
		else {
			
			request.setAttribute("message", "Mã công ty hoặc mã số thuế đã được sử dụng");
		}
		response.addCookie(new Cookie("message", ""));
		
		
		request.getRequestDispatcher("Register.jsp").forward(request, response);
	}

	private void showLoginPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
		String message = "";
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("message"))
					message = cookie.getValue();
			}
			
		}
		
		if(message.equals("")) {
			request.setAttribute("message", "");
		}
		else {
			
			request.setAttribute("message", "Tài khoản để đăng nhập không đúng");
		}
		response.addCookie(new Cookie("message", ""));
		request.getRequestDispatcher("Welcome.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
