package com.inc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;
import com.inc.vo.PhotoVo;

@WebServlet("/photo")
public class PhotoServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//로그인체크
		if(request.getSession().getAttribute("id")==null) {
			
			request.setAttribute("msg","로그인 하신 뒤 이용 가능한 페이지입니다.");
			request.setAttribute("url",request.getContextPath()+"/main");
			
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
			return;
		}
		
		List<PhotoVo> pvoList = PhotoDao.getInstance().selectList();
		
		request.setAttribute("pvoList", pvoList);
		
		request.getRequestDispatcher("/views/photo.jsp").forward(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
