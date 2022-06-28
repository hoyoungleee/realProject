package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;

public class DownloadController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//파라미터 받아오기
		//원본파일명
		String ofile = req.getParameter("ofile");
		//서버에 저장된 파일명
		String sfile = req.getParameter("sfile");
		//게시물의 일련번호
		String idx = req.getParameter("idx");
		
		//파일 다운로드 처리
		FileUtil.download(req, resp, "/Uploads", sfile, ofile);
		
		
		
	}
}
