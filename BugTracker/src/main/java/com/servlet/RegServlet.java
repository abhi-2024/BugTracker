package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.userDao;
import com.entities.User;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
@MultipartConfig
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String check = request.getParameter("user_check");
		if(check==null) {
			out.print("Agree to terms & conditions");
		}else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			
			userDao dao = new userDao(ConnectionProvider.getConnection());
			
			User user =  new User(name, email, password);
			
			if(dao.saveUser(user)) {
				out.print("Done!");
			}
			else {
				out.print("Error");
			}
			
		}
         

	}

}
