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
			// �츮 �Ŀ� ��ġ�� mysql������ �ǹ�, bbs��� ������ ���̽��� ����
			String dbID = "root";
			String dbPassword = "devham7676";
			//Class.forName("com.mysql.jdbc.Drvier");	// �ּ�ó���ϴϱ� ��������. ������ ����?
			// ����̹� : mysql�� ������ �� �ֵ��� �ϴ� �ϳ��� �ް�ü
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("1conn:"+conn);
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
			System.out.println("error1");
			e.printStackTrace();
			System.out.println("error2");
		}
		return -2; // db����
	}
	
	public int join(User user) {
		//System.out.println("id : "+ userId+", pw: "+userPw+", name :"+userName);
		String SQL = "Insert into user (userId, userPw, name) values (? ,? ,?) ";
		System.out.println("join conn:"+conn);
		System.out.println(SQL);
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());
			pstmt.setString(3, user.getUserPw());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("error1");
			e.printStackTrace();
			System.out.println("error2");
		}
		return -1; // db����
	}
}
