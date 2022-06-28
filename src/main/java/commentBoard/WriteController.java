package commentBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

public class WriteController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		HttpSession session = req.getSession();
		
		Object id = session.getAttribute("userID");
		String sId = (String)id;
		
		String content = req.getParameter("comment");
		String score = req.getParameter("score");
		
		dto.setUserID(sId);
		dto.setContents(content);
		dto.setMovieScore(score);
		
		int insertCount = dao.commentInsert(dto);
		
		if(insertCount == 1) {
			JSFunction.alertMsg("댓글 작성 성공", null);
		}
		else {
			JSFunction.alertBack("댓글 작성 실패", null);
			
		}
		
		
	}
	
}
