package realProject;

import common.DBConnPool;



public class MemberDAO extends DBConnPool{

	//부모클래스의 기본생성자 호출을 통해 DB를 연결한다.
	public MemberDAO() {
		super();
		System.out.println("DB연결 호출");
	}
	
	public int checkId(String unCheckID) { // 유저가 입력한 값을 매개변수로 한다.
		int checkCount= 0;
		String query = "SELECT * FROM member ";
		query += " WHERE userID = ?"; // 입력한 값이 테이블에 있는지 확인
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, unCheckID);
			
			rs = psmt.executeQuery();
			
			if(rs.next() || unCheckID.equals("")) {
				checkCount = 0; //이미 존재하는 경우, 생성 불가능
			}
			else {
				checkCount = 1; // 존재하지 않는 경우, 생성 가능
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("id 중복체크 중 오류발생");
		}
		finally {
			close();
		}
		return checkCount;
	}
	
	

	public int memberInsert(MemberDTO dto) {
		
		//회원 가입을 위한 쿼리문 작성
		String query = "INSERT INTO member (userID, userPassword1, userName, userEmail, registDate)"
				+ " values(?,?,?,?,NOW())";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUserID());
			psmt.setString(2, dto.getUserPassword1());
			psmt.setString(3, dto.getUserName());
			psmt.setString(4, dto.getUserEmail());
			return psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	public int interestInsert(MemberDTO dto) {
		
		//회원 가입을 위한 쿼리문 작성
		String query = "INSERT INTO interest (userID, interest)"
				+ " values(?,?)";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUserID());
			psmt.setString(2, dto.getInterest());
			return psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
	public MemberDTO login(String uid, String upass) {
			
		//DTO객체 생성
		MemberDTO dto = new MemberDTO();
		//회원 로그인을 위한 쿼리문 작성
		String query = "SELECT * FROM member WHERE userID=? AND userPassword1=?";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			//반환된 ResultSet객체를 통해 회원정보가 있는지 확인
			if(rs.next()) {
				//정보가 있다면 DTO객체에 회원정보를 저장한다.
				dto.setUserID(uid);
				dto.setUserPassword1(upass);
				dto.setUserName(rs.getString(3));
				dto.setUserEmail(rs.getString(4));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int deleteMember(MemberDTO dto) {
		int deleteCount =0;
		String query = "DELETE FROM member WHERE userID = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUserID());
			return psmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return deleteCount= 1;
	}
	public int deleteInterest(MemberDTO dto) {
		int deleteCount =0;
		String query = "DELETE FROM interest WHERE userID = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUserID());
			return psmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return deleteCount;
	}
	
	public int memberEdit(MemberDTO dto) {
		
		//회원 정보수정을 위한 쿼리문 작성
		String query = "UPDATE member SET userName = ? , userPassword1 = ? , userEmail = ? WHERE userID = ? ";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUserName());
			psmt.setString(2, dto.getUserPassword1());
			psmt.setString(3, dto.getUserEmail());
			psmt.setString(4, dto.getUserID());
			return psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
	public int interestEdit(MemberDTO dto) {
		
		//회원 정보수정을 위한 쿼리문 작성
		String query = "UPDATE interest SET interest = ? WHERE userID = ? ";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getInterest());
			psmt.setString(2, dto.getUserID());
			return psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
}
