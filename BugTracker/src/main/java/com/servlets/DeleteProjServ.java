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
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class DeleteProjServ
 */
@WebServlet("/DeleteProjServ")
public class DeleteProjServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProjServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ProjectDao dao = new ProjectDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		if(dao.deleteProject(id)) {
			Alert alert = new Alert("success", "Deleted-Successfully !!");
			s.setAttribute("viewProjMSG", alert);
			response.sendRedirect("Projects.jsp");
		}else {
			Alert alert = new Alert("danger", "Couldn't Delete..!!!");
			s.setAttribute("singProjMSG", alert);
			response.sendRedirect("SingleProject.jsp");
		}
		// TODO Auto-generated method stub
	}

}
