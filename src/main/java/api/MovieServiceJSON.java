package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
Servlet implementation class MovieServiceJSON
 */
@WebServlet("/MovieServiceJSON")
public class MovieServiceJSON extends HttpServlet {

	private static final long serialVersionUID = 1L;
		/*
		 * @see HttpServlet#HttpServlet()
		 */
		public MovieServiceJSON() {
			super();
		}
		
		/*
			@see HttpServlet#doGet(HttpServletRequest request, response)
		 */

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			
		}
		/*
		@see HttopServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String clientId = "YOUR_CLIENT_ID";//애플리케이션 클라이언트 아이디값;
			String clientSecret = "YOUR_CLIENT_SECRET"; //애플리케이션 클라이언트 시크릿값;
			
			String text = req.getParameter("query");
			
			try {
				text = URLEncoder.encode(text, "UTF-8"); //한글화
				String apiURL = "https://openapi.naver.con/v1/search/movie.json?query="+ text;// json 결과
				//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+text; //xml결과
				
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) {//정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { //에러발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				
				String inputLine;
				StringBuffer sb = new StringBuffer();
				while((inputLine = br.readLine()) != null) {//br.readLine()가 널이 아닐때만 inputLine에 br.readLine값 집어놓고 while문 실행
					sb.append(inputLine);
				}
				br.close();
				//System.out.println(sb.toString);
				
				//json으로 보내줘야해.. 어.. 어케보내주지
				resp.setContentType("text/html;charset=UTF-8");
				resp.getWriter().print(sb.toString());
				resp.getWriter().close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	
}
