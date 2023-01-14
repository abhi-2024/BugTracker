package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userDao;
import com.entities.User;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String nName = request.getParameter("newName");
		String nEmail = request.getParameter("newEmail");
		String nPassword = request.getParameter("newPassword");
		
		HttpSession s = request.getSession();
	    User usa = (User)s.getAttribute("currentUser");
		usa.setName(nName);
		usa.setEmail(nEmail);
		usa.setPassword(nPassword);
		
		userDao dao = new userDao(ConnectionProvider.getConnection());
		if(dao.updateUser(usa)) {
			response.sendRedirect("viewBugs.jsp");
		}else {
			out.print("Error");
		}
	}

}
