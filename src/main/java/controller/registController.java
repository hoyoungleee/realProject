package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import realProject.MemberDAO;
import realProject.MemberDTO;
import utils.JSFunction;

public class registController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("./membership.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = new MemberDTO();
			
			String userID = req.getParameter("userID");
			String userPassword1 = req.getParameter("userPassword1");
			String userName = req.getParameter("userName");
			String userEmail = req.getParameter("userEmail");
			
			dto.setUserID(userID);
			dto.setUserPassword1(userPassword1);
			dto.setUserName(userName);
			dto.setUserEmail(userEmail);
			
			int registResult = dao.memberInsert(dto);
			dao.close();
			if(registResult == 1) {
				req.setAttribute("userID",userID);
				req.getRequestDispatcher("./recommend.jsp").forward(req, resp);
			}
			else {
				JSFunction.alertLocation(resp, "회원가입에 실패하였습니다. 관리자에게 문의하세요", "./default.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 중 예외발생");
		}
			

	}
}
