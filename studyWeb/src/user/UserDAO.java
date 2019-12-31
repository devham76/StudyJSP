package user;

import java.sql.*;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// db 커넥션
	public UserDAO() {
		System.out.println("userdao !!");
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studyweb";
			// 우리 컴에 설치된 mysql서버를 의미, studyWeb라는 데이터 베이스에 접속
			String dbID = "root";
			String dbPassword = "devham7676";
			//Class.forName("com.mysql.jdbc.Drvier");	// 주석처리하니까 실행됬음. 원인이 뭘까?
			// 드라이버 : mysql에 접속할 수 있도록 하는 하나의 메게체
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		System.out.println("id : "+ userID+", pw: "+userPassword);
		String SQL = "Select userPw from user where userId = ? ";
		System.out.println("login conn:"+conn);
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // db오류
	}
	
	public int join(UserDTO userDto) {
		//System.out.println("id : "+ userId+", pw: "+userPw+", name :"+userName);
		String SQL = "Insert into user (userId, userPw, name) values (? ,? ,?) ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userDto.getUserId());
			pstmt.setString(2, userDto.getUserPw());
			pstmt.setString(3, userDto.getUserPw());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}
	
	//-- 아이디 중복 검사
	public int checkId(String id) {
		String SQL = "Select userId from user where userId = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return -1; // 아이디 이미 존재
			}
			return 1; // 아이디 없음. 사용가능.

		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // db오류
	}
	
	//-- 회원정보 가져오기
	public UserDTO getUserInfo(String id) {
		String SQL = "Select * from user where userId = ?";
		UserDTO userDto = new UserDTO();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userDto.setUserId( rs.getString("userId"));			
				userDto.setUserName( rs.getString("name"));
				userDto.setUserPw( rs.getString("userPw"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userDto;
		
	}
	// 회원정보 수정
	public int modifyUserInfo(UserDTO dto) {
		String SQL = "Update user set name = ?, userPw = ? where userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getUserName());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserId());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;	 // db 오류
	}
}
