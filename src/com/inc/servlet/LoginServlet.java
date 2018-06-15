package com.inc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;
import com.inc.vo.UserVo;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		UserVo uvo = UserDao.getInstance().selectOne(id);
		if(uvo == null) {
			//존재하지않는 아이디
			request.setAttribute("msg","존재하지 않는 아이디 입니다");
			request.setAttribute("url",request.getContextPath()+"/login");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		}else if(!uvo.getPassword().equals(password)) {
			//비밀번호 불일치
			request.setAttribute("msg","비밀번호가 일치하지 않습니다");
			request.setAttribute("url",request.getContextPath()+"/login");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		}else {
			//로그인
			request.getSession().setAttribute("id",uvo.getId());
			request.getSession().setAttribute("name",uvo.getName());
			response.sendRedirect(request.getContextPath()+"/main");	
		}
	}

}
