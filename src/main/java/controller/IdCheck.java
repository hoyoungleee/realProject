package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import realProject.MemberDAO;
import utils.JSFunction;

public class IdCheck extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		// ajax로 값을 받기 때문에 UTF-8로 인코딩해준다.
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
		
		String unCheckID = req.getParameter("userID");
		//membership.jsp에서 받아온 key값이 unCheckID이고
		//value값은 유저가 실제로 적은 값, String unCheckID는 value값이 들어간다.
		PrintWriter out = resp.getWriter();
		
		int idCheck = dao.checkId(unCheckID);
		dao.close();
		//성공여부 확인 : 개발자용
		if(idCheck == 0) {
			System.out.println("이미 존재하는 아이디입니다.");
			req.getRequestDispatcher("./idFalse.jsp").forward(req, resp);
		}
		else if(idCheck == 1) {
			System.out.println("사용 가능한 아이디입니다.");
			req.getRequestDispatcher("./idSuccess.jsp").forward(req, resp);

		}
		
		

	}
}
