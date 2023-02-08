package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProjectDao;
import com.entitites.Alert;
import com.entitites.Project;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class AddProjServ
 */
@WebServlet("/AddProjServ")
public class AddProjServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProjServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String t = request.getParameter("title");
		String d = request.getParameter("desc");
		String s = request.getParameter("state");
		String ty = request.getParameter("type");
		String date = request.getParameter("date");
		String u = request.getParameter("user");
		Project proj = new Project(t, d, s, ty, date, u);
		
		ProjectDao dao = new ProjectDao(ConnectionProvider.getConnection());
		
		HttpSession se = request.getSession();
		if(dao.saveProject(proj)) {
			Alert alert = new Alert("success", "New Project Added !!");
			se.setAttribute("addProjMSG", alert);
			response.sendRedirect("Projects.jsp");
		}else {
			Alert alert = new Alert("danger", "Project Already Exists !!");
			se.setAttribute("addProjMSG", alert);
			response.sendRedirect("Projects.jsp");
		}
	}

}
