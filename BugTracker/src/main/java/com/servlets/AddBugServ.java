package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BugDao;
import com.entitites.Alert;
import com.entitites.Bug;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class AddBugServ
 */
@WebServlet("/AddBugServ")
@MultipartConfig
public class AddBugServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBugServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("iname");
		String des = request.getParameter("des");
		String proj = request.getParameter("proj");
		int stat = Integer.parseInt(request.getParameter("stat"));
		String date = request.getParameter("date");
		Part part = request.getPart("media");
		String email = request.getParameter("email");
		String iname = part.getSubmittedFileName();
		
		Bug bug = new Bug(name,des,proj,stat,date,iname,email);
		BugDao dao = new BugDao(ConnectionProvider.getConnection());
		
		HttpSession s = request.getSession();
		if(dao.saveBug(bug)) {
			Alert alert = new Alert("success", "Bug added successfully !!");
			s.setAttribute("AddBugMSG", alert);
			response.sendRedirect("AddBug.jsp");
		}else {
			Alert alert = new Alert("danger", "Bug couldn't be added !!");
			s.setAttribute("AddBugMSG", alert);
			response.sendRedirect("AddBug.jsp");
		}
	}
}
