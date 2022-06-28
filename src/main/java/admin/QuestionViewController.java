package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
어노테이션을 통한 매핑은 요청명을 해당 컨트롤러 상단에 기술하면 된다.
이 또한 요청명에 대한 기술이 잘못될 경우 톰켓이 시작되지 않을 수 있으므로
주의해야한다.
 */
public class QuestionViewController extends HttpServlet{
	
	/*
	service()는 서블릿의 수명주기 메서드 중 사용자의 요청을 전송방식에
	상관없이 먼저 받아 doGet() 혹은 doPost()로 요청을 전달하는 역할을 한다.
	따라서 방식에 상관없이 처리할 수 있다.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//커넥션풀을 통해 DB연결
		QuestionDAO dao = new QuestionDAO();
		//일련번호를 파라미터로 받음
		String idx = req.getParameter("idx");
		//조회수 증가
		//게시물 조회
		QuestionDTO dto = dao.selectView(idx);
		dao.close();
		
		//내용에 대해 줄바꿈 처리를 위해 <br>태그로 변환한다.
		//<textarea>에서 엔터키를 통한 줄바꿈은 \r\n으로 저장된다.
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		//request영역에 DTO를 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./QuestionView.jsp").forward(req, resp);
	}

}
