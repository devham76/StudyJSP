package user;

import java.sql.*;
public class mysqlTest {

	public static void main(String[] args) {

		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;

		System.out.println("userdao !!!");
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studyweb";
			// �츮 �Ŀ� ��ġ�� mysql������ �ǹ�, bbs��� ������ ���̽��� ����
			String dbID = "root";
			String dbPassword = "devham7676";
			System.out.println("1");
			//Class.forName("com.mysql.jdbc.Drvier");
			// ����̹� : mysql�� ������ �� �ֵ��� �ϴ� �ϳ��� �ް�ü
			System.out.println("2");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("1conn:"+conn);
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}



	}

}
