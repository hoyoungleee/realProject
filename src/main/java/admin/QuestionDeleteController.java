package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import realProject.MemberDAO;
import realProject.MemberDTO;
import utils.JSFunction;

public class QuestionDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QuestionDAO dao = new QuestionDAO();
		QuestionDTO dto = new QuestionDTO();
		
		
		int deleteCheck1 = dao.deleteQuestion();
		
		if(deleteCheck1 >= 0) {
			
			JSFunction.alertMsg("건의함을 정리하였습니다.", null);
			resp.sendRedirect("./QuestionList.do");
		}
		else {
			System.out.println("건의함 정리 중 오류 발생");
		}
	}
}
