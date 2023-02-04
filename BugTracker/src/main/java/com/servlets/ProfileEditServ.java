package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entitites.Alert;
import com.entitites.User;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class ProfileEditServ
 */
@WebServlet("/ProfileEditServ")
public class ProfileEditServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileEditServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int uid = Integer.parseInt(request.getParameter("id"));
		String fn = request.getParameter("fn");
		String ln = request.getParameter("ln");
		String prof = request.getParameter("prof");
		String em = request.getParameter("em");
		String pass = request.getParameter("pass");
		String ad = request.getParameter("add");
		
		User user = new User(uid, fn, ln, prof, em, pass, ad);
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		if(dao.updateUser(user)) {
			Alert alert = new Alert("success", "Profile-Updated Successfully !!!");
			s.setAttribute("profileMSG", alert);
			s.setAttribute("currentUser", user);
			response.sendRedirect("Profile.jsp");
		}else {
			Alert alert = new Alert("danger", "Can't update profile !!!");
			s.setAttribute("profileMSG", alert);
			response.sendRedirect("Profile.jsp");
		}
	}

}
