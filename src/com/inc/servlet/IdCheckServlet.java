package com.inc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;

@WebServlet("/Idcheck")
public class IdCheckServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
				
		int countId = UserDao.getInstance().getId(id);
		
		if(countId == 0 ) {
			response.getWriter().print("n");
		}else if(countId == -1){
			response.getWriter().print("error");
		}else {
			response.getWriter().print("y");
		}
		
	}

	
}
