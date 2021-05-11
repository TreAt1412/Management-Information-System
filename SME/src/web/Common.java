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
			default:
				showLoginPage(request, response);
				break;
			}
		} catch (Exception e) {
			System.out.println(e);
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
		System.out.println("code" + companyCode);
		System.out.println("companyName" + companyName);
		System.out.println("taxNum" + taxNum);
		System.out.println("detail" + detail);
		System.out.println("email" + email);
		System.out.println("managerName" + managerName);
		System.out.println("username" + username);
		System.out.println("password" + password);
		
		int check = dao.createCompany(companyName, companyCode, taxNum, detail, managerName, username, password, email);
		
		if(check == 1) {
			response.sendRedirect("/SME");
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
		
	}

	private void showRegisterPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		// TODO Auto-generated method stub
		System.out.println("registerpage");
		request.getRequestDispatcher("Register.jsp").forward(request, response);
	}

	private void showLoginPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
	
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
