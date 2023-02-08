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
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class DelBugServ
 */
@WebServlet("/DelBugServ")
public class DelBugServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelBugServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		BugDao dao = new BugDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		if(dao.deleteBug(id)) {
			Alert alert = new Alert("success","Record Deleted Successfully!!");
			s.setAttribute("viewBugMSG", alert);
			response.sendRedirect("ViewBugs.jsp"); 
		}else {
			Alert alert = new Alert("danger","Failed to delete!!");
			s.setAttribute("viewBugMSG", alert);
			response.sendRedirect("ViewBugs.jsp");
		}
	}

}
