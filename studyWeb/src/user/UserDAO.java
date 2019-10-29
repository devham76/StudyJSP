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
			//Class.forName("com.mysql.jdbc.Drvier");
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
		System.out.println("2conn:"+conn);
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
}
