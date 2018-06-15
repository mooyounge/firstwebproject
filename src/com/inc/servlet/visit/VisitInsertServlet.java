package com.inc.servlet.visit;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;
import com.inc.dao.VisitDao;
import com.inc.vo.UserVo;
import com.inc.vo.VisitVo;

@WebServlet("/visit/insert")
public class VisitInsertServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		String u_id = null;
		u_id = request.getParameter("u_id");
		if(u_id == null) {
			request.setAttribute("msg","세션이 만료되었습니다");
			request.setAttribute("url",request.getContextPath()+"/main");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		}
		
		VisitVo vvo = new VisitVo();
		vvo.setContent(content);
		vvo.setU_id(u_id);
		
		VisitDao.getInstance().insert(vvo);
		
		response.sendRedirect(request.getContextPath()+"/board");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
