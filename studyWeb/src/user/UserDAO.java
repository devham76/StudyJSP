package user;

import java.sql.*;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// db Ŀ�ؼ�
	public UserDAO() {
		System.out.println("userdao !!");
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studyweb";
			// �츮 �Ŀ� ��ġ�� mysql������ �ǹ�, studyWeb��� ������ ���̽��� ����
			String dbID = "root";
			String dbPassword = "devham7676";
			//Class.forName("com.mysql.jdbc.Drvier");	// �ּ�ó���ϴϱ� ��������. ������ ����?
			// ����̹� : mysql�� ������ �� �ֵ��� �ϴ� �ϳ��� �ް�ü
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
					return 1; // �α��� ����
				}
				else
					return 0; // ��й�ȣ ����ġ
			}
			return -1; // ���̵� ����
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // db����
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
		return -1; // db����
	}
	
	//-- ���̵� �ߺ� �˻�
	public int checkId(String id) {
		String SQL = "Select userId from user where userId = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return -1; // ���̵� �̹� ����
			}
			return 1; // ���̵� ����. ��밡��.

		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // db����
	}
	
	//-- ȸ������ ��������
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
	// ȸ������ ����
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
		
		return -1;	 // db ����
	}
}
