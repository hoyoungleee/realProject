package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

public class passController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Object sessionPass = session.getAttribute("password"); 
		
		String pass = (String)sessionPass;
		
		
		String inputPass = req.getParameter("pass");
		
		if(pass.equals(inputPass)) {
			JSFunction.alertMsg("비밀번호 인증성공", null);
			session.setAttribute("passConfirm", 1);
			
		}
		
		
	}
}
