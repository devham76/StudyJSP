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
			// 우리 컴에 설치된 mysql서버를 의미, bbs라는 데이터 베이스에 접속
			String dbID = "root";
			String dbPassword = "devham7676";
			System.out.println("1");
			//Class.forName("com.mysql.jdbc.Drvier");
			// 드라이버 : mysql에 접속할 수 있도록 하는 하나의 메게체
			System.out.println("2");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("1conn:"+conn);
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}



	}

}
