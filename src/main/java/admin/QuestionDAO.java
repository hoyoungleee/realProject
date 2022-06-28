package admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

//모델2 방식의 자료실형 게시판에서 사용할 DAO클래스 생성. 
//DB연결은 커넥션풀(DBCP)을 사용한다. 
public class QuestionDAO extends DBConnPool {

	//부모클래스의 기본생성자 호출을 통해 DB를 연결한다. 
	public QuestionDAO() {
		super();
	}
	
	//mvcboard테이블의 게시물의 갯수를 카운트 하여 반환한다. 
	//목록의 페이징 처리나 게시물의 가상번호 부여에 사용한다. 
	public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM QuestionBoard ";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        
        try {
            stmt = con.createStatement();    
            rs = stmt.executeQuery(query);   
            rs.next();   
            totalCount = rs.getInt(1);  
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }
        return totalCount; 
    }
	
	/*
	모델1 방식에서는 board테이블 및 BoardDTO클래스를 사용했지만
	모델2 방식에서는 mvcboard테이블 및 MVCBoardDTO클래스를 사용하므로 
	해당 코드만 수정하면 된다. 
	
	모델2 방식의 게시판 목록에 대한 페이징 처리 쿼리문 실행
	 */
    public List<QuestionDTO> selectListPage(Map<String, Object> map) {
    	
        List<QuestionDTO> board = new ArrayList<QuestionDTO>();  
        
        String query = "SELECT * FROM ( "
        			+ "    SELECT Tb.*, ROWNUM rNum FROM ( "
                    + "        SELECT * FROM QuestionBoard ";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }        
        query += "      	ORDER BY idx DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
            	QuestionDTO dto = new QuestionDTO();
                
                //테이블이 변경되었으므로 저장하는 부분은 수정이 필요함..
                dto.setIdx(rs.getString(1));
                dto.setUserID(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setOfile(rs.getString(6));
                dto.setSfile(rs.getString(7));
                dto.setDowncount(rs.getInt(8));
                dto.setPass(rs.getString(9));
                dto.setVisitcount(rs.getInt(10));

                board.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        return board;
    }
    //글쓰기 처리시 첨부파일까지 함께 입력	
    public int insertWrite(QuestionDTO dto) {
        int result = 0;
        try {
        	/*
        	컬럼설명
        	ofile : 원본 파일명 
        	sfile : 서버에 저장된 파일명
        	 */
            String query = "INSERT INTO QuestionBoard ( "
                         + "  userID, title, content, ofile, sfile) "
                         + " VALUES ( "
                         + " ?,?,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getUserID());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
	//매개변수로 전달된 일련번호(idx)를 통해 하나의 레코드 조회
    public QuestionDTO selectView(String idx) {
    	
    	//조회된 레코드를 DTO객체 저장한 후 반환한다. 
    	QuestionDTO dto = new QuestionDTO();  
        //인파라미터가 있는 쿼리문 작성
        String query = "SELECT * FROM QuestionBoard WHERE idx=?";  
        try {
        	//쿼리실행을 위한 객체생성 및 인파라미터 설정
            psmt = con.prepareStatement(query);  
            psmt.setString(1, idx); 
            rs = psmt.executeQuery(); 
            
            //조회된 레코드가 있을때 DTO객체에 각 컬럼값을 저장한다.
            if (rs.next()) { 
                dto.setIdx(rs.getString(1));
                dto.setUserID(idx);
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setOfile(rs.getString(6));
                dto.setSfile(rs.getString(7));
                dto.setDowncount(rs.getInt(8));
                dto.setPass(rs.getString(9));
                dto.setVisitcount(rs.getInt(10));
            }
        }
        catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        return dto;  
    }
    //주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킨다.
    public void updateVisitCount(String idx) {
        String query = "UPDATE QuestionBoard SET "
                     + " visitcount=visitcount+1 "
                     + " WHERE idx=?"; 
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            psmt.executeQuery();
        }
        catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }
    //파일 다운로드 횟수 증가
    public void downCountPlus(String idx) {
        String sql = "UPDATE QuestionBoard SET "
                + " downcount=downcount+1 "
                + " WHERE idx=? "; 
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, idx);
            psmt.executeUpdate();
        }
        catch (Exception e) {}
    }
    
    //수정/삭제전 해당 게시물의 패스워드를 검증한다. 
    //즉, 게시물의 일련번호와 패스워드를 통해 조건에 부합하는 레코드가 있는지 확인한다.
    public boolean confirmPassword(String pass, String idx) {
        boolean isCorr = true;
        try {
            String sql = "SELECT COUNT(*) FROM QuestionBoard WHERE pass=? AND idx=?";
            psmt = con.prepareStatement(sql);
            psmt.setString(1, pass);
            psmt.setString(2, idx);
            rs = psmt.executeQuery();
            
            /*
            select문에 count()함수를 사용하는 경우 조건(where절)에 만족하는 레코드가
            없을때는 0, 만족하는 레코드가 있을때는 1이상의 정수값이 반환된다. 
            즉 어떤경우에도 결과값이 있으므로 next() 호출시 if문이 필요하지 않다. 
            */
            rs.next();
            /*
            if(rs.next())
            	=> 일반적인 select문을 사용하는 경우에 1개의 레코드만 반환될때 사용한다. 
            	주로 일련번호를 조건으로 추가하는 경우인데, 만족하는 레코드가 없다면
            	next()를 사용할때 에러가 발생된다. 
            while(rs.next())
            	=> select의 결과가 2개 이상일때 사용된다. 주로 게시판의 목록과 같이
            	여러개의 레코드가 반환되는 경우에 사용한다. 
            */
            
            //일치하는 결과가 없는 경우 false를 반환한다. 
            if (rs.getInt(1) == 0) {
                isCorr = false;
            }
        }
        catch (Exception e) {
        	//예외가 발생하면 검증이 안된것이므로 이때도 false를 반환한다. 
            isCorr = false;
            e.printStackTrace();
        }
        //검증이 완료되었을때만 true를 반환한다.
        return isCorr;
    }
    //게시물 삭제하기
    public int deletePost(String idx) {
        int result = 0;
        try {
            String query = "DELETE FROM QuestionBoard WHERE idx=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
    
    public int updatePost(QuestionDTO dto) {
        int result = 0;
        try {
            String query = "UPDATE QuestionBoard"
                         + " SET title=?, userID=?, content=?, ofile=?, sfile=? "
                         + " WHERE idx=? and pass=?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getUserID());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            psmt.setString(6, dto.getIdx());
            psmt.setString(7, dto.getPass());

            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
    
}








