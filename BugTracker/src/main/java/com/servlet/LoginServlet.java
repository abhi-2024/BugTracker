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
import com.entities.msg;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");	
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		
		
		// TODO Auto-generated method stub
		String email = request.getParameter("userEmail");
		String password = request.getParameter("userPassword");
		
		userDao dao = new userDao(ConnectionProvider.getConnection());
		
		User u = dao.getUserDetails(email, password);

	
		if(u==null) {
			//login error
			//out.print("Login Error !! Invalid Details.");
			msg m = new msg("Invalid Details !!", "error", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("MSG", m);
			response.sendRedirect("login.jsp");
			
		}else {
			//login successful
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("index.jsp");
		}
	}

}
