package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BugDao;
import com.entitites.Alert;
import com.entitites.Bug;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class BugEditServ
 */
@WebServlet("/BugEditServ")
public class BugEditServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BugEditServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("t");
		String des = request.getParameter("d");
		String proj = request.getParameter("proj");
		int stat = Integer.parseInt(request.getParameter("stat"));
		String date = request.getParameter("date");
		
		Bug bug = new Bug(id, title, des, proj, stat, date);
		
		BugDao dao = new BugDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		if(dao.updateBug(bug)) {
			Alert alert = new Alert("success","Updated Successfully!!");
			s.setAttribute("viewBugMSG", alert);
			response.sendRedirect("ViewBugs.jsp");
		}else {
			Alert alert = new Alert("danger","Couldn't Update!!");
			s.setAttribute("viewBugMSG", alert);
			response.sendRedirect("ViewBugs.jsp");
		}
	}
	

}
