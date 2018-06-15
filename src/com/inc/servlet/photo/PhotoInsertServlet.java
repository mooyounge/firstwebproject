package com.inc.servlet.photo;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;
import com.inc.vo.PhotoVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/photo/insert")
public class PhotoInsertServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		//파일생성
		String realpath = request.getServletContext().getRealPath("/photo");
		MultipartRequest mr = new MultipartRequest(
				request, 
				realpath,
				1024*1024*5,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		File file = mr.getFile("photo");
		String filename = file.getName();
		
		//아이디생성
		String id = mr.getParameter("id");
		//컨텐트생성
		String content = mr.getParameter("content");
		
		// uri 생성
		String uri = String.format("%s/%s",realpath,filename);
		
		// 저장 객체 생성
		PhotoVo pvo = new PhotoVo();
		pvo.setU_id(id);
		pvo.setContent(content);
		pvo.setUri(uri);
		pvo.setFilename(filename);
		//데이터베이스에 저장
		PhotoDao.getInstance().insert(pvo);
		
		response.sendRedirect(request.getContextPath()+"/photo");
	}

}
