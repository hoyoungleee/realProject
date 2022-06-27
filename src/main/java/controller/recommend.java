package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import realProject.MemberDAO;
import realProject.MemberDTO;
import utils.JSFunction;

public class recommend extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		String userID = (String) req.getAttribute("userID");
		String interest = req.getParameter("interst");
		
		dto.setUserID(userID);
		dto.setInterest(interest);
		
		int interestResult = dao.interestInsert(dto);
		
		if(interestResult == 1) {
			JSFunction.alertLocation(resp, "이용해주셔서 감사합니다. 로그인을 진행해주세요", interest);
		}
		
		
	}
}
