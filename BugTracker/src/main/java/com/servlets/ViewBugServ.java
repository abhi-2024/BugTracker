package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BugDao;
import com.entitites.Bug;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class ViewBugServ
 */
@WebServlet("/ViewBugServ")
public class ViewBugServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewBugServ() {
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
		
		Bug bug = dao.fetchSingleBug(id);
		
		HttpSession s = request.getSession();
		
		s.setAttribute("currentBug", bug);
		response.sendRedirect("BugEdit.jsp");
	}

}
