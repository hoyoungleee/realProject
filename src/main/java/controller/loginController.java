package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import realProject.MemberDAO;
import realProject.MemberDTO;
import utils.JSFunction;

public class loginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("./login.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSFunction.alertMsg("로그인 처리중입니다.", null);
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		String userID = req.getParameter("idInput");
		String password = req.getParameter("pwdInput");
		HttpSession session = req.getSession();
		
		System.out.println("userID="+userID);
		System.out.println("password="+password);
		
		dto.setUserID(userID);
		dto.setUserPassword1(password);
		
		 dto = dao.login(userID, password);
		
		dao.close();
		if(dto.getUserID() == userID && dto.getUserPassword1() == password) {
			session.setAttribute("userID", userID);
			session.setAttribute("userName", dto.getUserName());
			session.setAttribute("password", password);
			session.setAttribute("userName", dto.getUserEmail());
			JSFunction.alertLocation(resp, "로그인성공", "./main.jsp");
		}
		else {
			JSFunction.alertBack(resp, "입력한 정보가 올바르지 않습니다.");
		}
		
		
	}
}
