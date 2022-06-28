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
		
		String userID = req.getParameter("userID");
		String interest = req.getParameter("interest");
		
		System.out.println("넘어온 userID="+userID);
		System.out.println("넘어온 interest="+interest);
		
		dto.setUserID(userID);
		dto.setInterest(interest);
		
		
		int interestResult = dao.interestInsert(dto);
		
		dao.close();
		if(interestResult == 1) {
			resp.sendRedirect("./welcome.jsp");
		}
		
		
	}
}
