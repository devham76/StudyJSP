package com.javalac.daotoex;

import java.sql.*;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;
// db�� ���� ����/����
public class MemberDAO {

	private String dbUrl = "jdbc:mysql://localhost:3306/studyweb";
	private String dbId = "root";
	private	String dbPw = "devham7676";

	public MemberDAO() {
		try {
			// ����̺� �ε�
			Class.forName("com.mysql.jdbc.Drvier");	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MemberDTO> memberSelect() {
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// ����̹� �޴����� Ŀ�ؼ��� �Ѵ�
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			String sql = "select * from user where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "hyemi");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {

				String id = rs.getString("userId");
				String pw = rs.getString("userPw");
				String name = rs.getString("name");

				MemberDTO dto = new MemberDTO(id, pw, name);
				dtos.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
}
