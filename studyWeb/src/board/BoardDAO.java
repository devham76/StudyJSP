package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import user.UserDTO;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// db Ä¿³Ø¼Ç
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studyweb";
			String dbID = "root";
			String dbPassword = "devham7676";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e ) {
			System.out.println(e);
		}
	}
	public int newPost(BoardDTO boardDto) {
		String SQL = "Insert into post (title,writer,content,uploadDate) values (?,?,?, now())";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardDto.getTitle());
			pstmt.setString(2, boardDto.getWriter());
			pstmt.setString(3, boardDto.getContent());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // db¿À·ù
	}
	public List<BoardDTO> getBoardList(){
		
		List<BoardDTO> boardList = new ArrayList<>();
		String SQL = "select * from post order by uploadDate";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				BoardDTO boardDto = new BoardDTO();
				boardDto.setTitle(rs.getString("title"));
				boardDto.setWriter(rs.getString("writer"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setUploadDate(rs.getString("uploadDate"));
				boardDto.setHit(rs.getInt("hit"));
				boardList.add(boardDto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
}
