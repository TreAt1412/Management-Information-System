package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import model.Customer;
import model.Employee;

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
			default:
				showLoginPage(request, response);
				break;
			}
		} catch (Exception e) {
			System.out.println(e);
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
        boolean check = new Dao().addEmployee(nv);
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
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
			}
			
		}
		System.out.println(companyID);
		Customer c = new Customer(0, code, name, address, taxNum, companyID);
		boolean check = new Dao().addCustomer(c);
		if (check == true){
			response.sendRedirect("Customer");
		}
		else {
			Cookie message = new Cookie("message", "not success");
			response.addCookie(message);
			
			response.sendRedirect("Customer");
		}
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
