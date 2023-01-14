package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.bugDao;
import com.entities.User;
import com.entities.bugs;
import com.entities.msg;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class bugServlet
 */
@WebServlet("/bugServlet")
public class bugServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bugServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession();
		User st = (User)s.getAttribute("currentUser");
		
		String bugName = request.getParameter("bug_title");
		String projName = request.getParameter("project_name");
		String date = request.getParameter("bug_date");
		String abt = request.getParameter("bug_about");
		String mail = st.getEmail();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		bugs b = new bugs(bugName, projName, date, abt, mail);
		bugDao dao = new bugDao(ConnectionProvider.getConnection());
		
		if(dao.saveBug(b)) {
			out.print("done");
			msg ms = new msg("Added !!", "alert", "alert-success");
			s.setAttribute("mmm", ms);
			response.sendRedirect("AddBugs.jsp");
		}else {
			out.print("error");
		}
	
	}

}
