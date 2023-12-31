package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAo;
@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			JobDAo dao=new JobDAo(DBConnect.getConn());
			boolean f=dao.deleteJobs(id);
            HttpSession session=req.getSession();
			
			if (f) {
				session.setAttribute("succMsg","jobs delete Successfully..");
				resp.sendRedirect("view_jobs.jsp");
			}
			else {
				session.setAttribute("succMsg", "something went wrong...");
				resp.sendRedirect("view_jobs.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
