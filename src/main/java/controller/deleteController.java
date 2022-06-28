package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import realProject.MemberDAO;
import realProject.MemberDTO;
import utils.JSFunction;

public class deleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		HttpSession session = req.getSession();
		Object sessionId = session.getAttribute("userID");
		String userID = (String)sessionId;
		
		dto.setUserID(userID);
		int deleteCheck1 = dao.deleteInterest(dto);
		int deleteCheck2 = dao.deleteMember(dto);
		
		if(deleteCheck1 == 1 && deleteCheck2 == 1) {
			session.invalidate(); 
			JSFunction.alertMsg("ㅅㄱㅇ", null);
			resp.sendRedirect("./default.jsp");
		}
		else {
			System.out.println("회원탈퇴 오류 발생");
		}
	}
}
