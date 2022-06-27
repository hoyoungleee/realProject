package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {

	//JDBC를 위한 멤버변수 선언(연결, 쿼리실행, 결과값반환)
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	//기본 생성자
	public JDBConnect() {
		try {
			//마리아 DB연결하기
			//MariaDB JDBC 드라이버 로드
			Class.forName("org.mariadb.jdbc.Driver");
			//커넥션 URL
			String url = "jdbc:mariadb://localhost:3306/project1";
			//아이디/패스워드
			String id = "2ho0";
			String pass = "1234";
			
			con = DriverManager.getConnection(url, id, pass);
			
			System.out.println("DB 연결 성공(MariaDB)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	//자원 반납
	public void close() {
		try {
			//객체가 생성된 것을 확인 후 자원 반납 처리
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("DB 자원반납");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//인자생성자 1
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			//JDBC 드라이버 로드
			Class.forName(driver);
			//DB에 연결
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공(인수 생성자 1)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//인자생성자 2
	public JDBConnect(ServletContext application) {
		/*
		JSP에서는 내장객체를 즉시 사용할 수 있지만 Java에서는 매개변수를 통해
		전달받은 후 사용할 수 있다. DB연결은 매우 빈번히 발생되는 업무로
		컨텍스트 초기화 파라미터를 JSP에서 가져오는 것보다는 훨씬 효율적이다.
		 */
		try {
			String driver = application.getInitParameter("MariaDriver");
			Class.forName(driver);
			String url = application.getInitParameter("MariaURL");
			String id = application.getInitParameter("MariaId");
			String pwd = application.getInitParameter("MariaPwd");
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자2)");		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
