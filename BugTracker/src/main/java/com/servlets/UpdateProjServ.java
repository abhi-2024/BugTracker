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
 * Servlet implementation class UpdateProjServ
 */
@WebServlet("/UpdateProjServ")
public class UpdateProjServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProjServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String ti = request.getParameter("na");
		String des = request.getParameter("des");
		String ty = request.getParameter("ty");
		String st = request.getParameter("st");
		String dt = request.getParameter("dt");
		Project proj = new Project(id, ti, des, st, ty, dt);
		ProjectDao dao = new ProjectDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		
		if(dao.updateProject(proj)) {
			s.setAttribute("currentProj", proj);
			Alert alert = new Alert("success", "Updated Successfully");
			s.setAttribute("singProjMSG", alert);
			response.sendRedirect("SingleProject.jsp");
		}else {
			Alert alert = new Alert("danger", "Couldn't Update...!!!!");
			s.setAttribute("singProjMSG", alert);
			response.sendRedirect("SingleProject.jsp");
		}
	}
}
