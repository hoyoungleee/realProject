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

public class memberEdit extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		HttpSession session = req.getSession();
		
		Object id = session.getAttribute("userID");
		String userID = (String)id;
		
		
		String name = req.getParameter("userName");
		String pwd = req.getParameter("userPassword1");
		String email = req.getParameter("userEmail");
		String interest = req.getParameter("interest");
		
		dto.setUserID(userID);
		dto.setUserName(name);
		dto.setUserPassword1(pwd);
		dto.setUserEmail(email);
		dto.setInterest(interest);
		
		int editCount1 = dao.interestEdit(dto);
		int editCount2 = dao.memberEdit(dto);
		
		dao.close();
		if(editCount1 == 1 && editCount2 == 1) {
			JSFunction.alertLocation(resp, "회원수정이 완료되었습니다.", "./main.jsp");
		}
		else {
			System.out.println("회원 수정 실패");
		}
		
	}
}
