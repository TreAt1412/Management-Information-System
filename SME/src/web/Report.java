package web;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;

/**
 * Servlet implementation class KCLL
 */

public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Dao dao;
    public Report() { 
        super();
        // TODO Auto-generated constructor stub
        dao = new Dao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		request.setCharacterEncoding("UTF-8");
		System.out.println("action: Report");
		try {
			switch (action) {
			
		
			default:
				showReportPage(request, response);
				break;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private void showReportPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException, SQLException {
		// TODO Auto-generated method stub
		Cookie[] cookiess = request.getCookies();
		int role = 0;
		int companyID = 0;
		if(cookiess!=null){
			for(Cookie cookie:cookiess){
				if(cookie.getName().equals("companyID")){
					companyID = Integer.parseInt(cookie.getValue());
				}
			}
		} 
	    ArrayList<Integer> listBCTC = new Dao().getBCTC(companyID);
		for(int i = 0 ; i<listBCTC.size();i++) {
			System.out.println(listBCTC.get(i));
		}
		request.getRequestDispatcher("Report.jsp").forward(request,response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
