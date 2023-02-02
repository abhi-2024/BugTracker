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
 * Servlet implementation class SignUpServ
 */
@WebServlet("/SignUpServ")
public class SignUpServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String f = request.getParameter("fName");
		String l = request.getParameter("lName");
		String p = request.getParameter("profession");
		String e = request.getParameter("email");
		String pass = request.getParameter("password");
		String add = request.getParameter("add");
		
		User user = new User(f, l, p, e, pass, add);
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		
		if(dao.saveUser(user)) {
			Alert alert = new  Alert("success", "Registered-Successfully!!");
			s.setAttribute("loginMSG", alert);
			response.sendRedirect("Login.jsp");
		}else {
			response.sendRedirect("Signup.jsp");
			System.out.println("Error!!");
		}
	}

}
