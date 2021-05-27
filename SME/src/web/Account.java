package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;

/**
 * Servlet implementation class Account
 */
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Dao dao;
    public Account() {
        super();
        dao = new Dao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();

		request.setCharacterEncoding("UTF-8");
		try {
			switch (action) {
			
			default:
				showAccountPage(request, response);
				break;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private void showAccountPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		int companyID = 0;
		Cookie[] cookies = request.getCookies();
		String message = "";
		if(cookies != null) {
			for(Cookie cookie: cookies) {
				if(cookie.getName().equals("companyID"))
					companyID = Integer.parseInt(cookie.getValue());
				if(cookie.getName().equals("message"))
					message = cookie.getValue();
			}
		}
		if(message.equals("not-success")) {
			request.setAttribute("message", "Thêm thành công");
		}
		else if(message.equals("success")) {
			request.setAttribute("message", "Tên tài khoản hoặc email đã được sử dụng");
		}
		response.addCookie(new Cookie("message", ""));
		List<model.Account> laccount = dao.getAllAccount(companyID);
		request.setAttribute("laccount", laccount);
		request.getRequestDispatcher("Account.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
