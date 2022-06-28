package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

public class logoutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
//		session.setAttribute("id", "value");
//		String id = (String)session.getAttribute("id"); //리턴 타입은 Object
//		session.removeAttribute("id");
		session.invalidate(); 
		JSFunction.alertLocation(resp, "로그아웃 되었습니다.", "./main.jsp");
	}
}
