package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BDto;

public class BDao {

	DataSource dataSource;
	
	public BDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
			System.out.println("context : "+context);
			System.out.println("dataSource : "+dataSource);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void write(String bName, String bTitle, String bContent) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String SQL = "Insert into post (title,writer,content,uploadDate) values (?,?,?, now())";
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			int rn = preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	
	public List<BDto> list() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		List<BDto> boardList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			
			String SQL = "select * from post order by uploadDate desc";
			preparedStatement = connection.prepareStatement(SQL);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				int bId = resultSet.getInt("id");
				String bName = resultSet.getString("writer");
				String bTitle = resultSet.getString("title");
				String bContent = resultSet.getString("content");
				Timestamp bDate = resultSet.getTimestamp("uploadDate");
				int bHit = resultSet.getInt("hit");
				int bGroup = resultSet.getInt("group");
				int bStep = resultSet.getInt("step");
				int bIndent = resultSet.getInt("indent");
				System.out.println(bId);
				BDto dto = new BDto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
				boardList.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}

	public BDto contentView(String bId) {
		// 조회수 +1
		upHit(bId);
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		BDto bdto = null;
		try {
			// dbcp이용한 커넥셕
			connection = dataSource.getConnection();
			
			String SQL = "select * from post where id=?";
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setInt(1, Integer.parseInt(bId));
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				String bName = resultSet.getString("writer");
				String bTitle = resultSet.getString("title");
				String bContent = resultSet.getString("content");
				Timestamp bDate = resultSet.getTimestamp("uploadDate");
				int bHit = resultSet.getInt("hit");
				int bGroup = resultSet.getInt("group");
				int bStep = resultSet.getInt("step");
				int bIndent = resultSet.getInt("indent");
				System.out.println(bId);
				bdto = new BDto(Integer.parseInt(bId), bName, bTitle, 
						bContent, bDate, bHit, bGroup, bStep, bIndent);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bdto;
	}

	//--------------------
	// 조회수 증가 시킨다
	//--------------------
	private void upHit(String bId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = dataSource.getConnection();
			String SQL = "update post set hit = hit+1 where id=?";
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setInt(1, Integer.parseInt(bId));
			preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	//--------------------
	// 글을 수정한다
	//--------------------
	public int modify(String bId, String bName, String bTitle, String bContent) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		try {	
			connection = dataSource.getConnection();
			String SQL = "update post set "
					+ "  title   = ?"
					+ ", content = ?"
					+ " where id = ? ";
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setString(1, bTitle);
			preparedStatement.setString(2, bContent);
			preparedStatement.setInt(3, Integer.parseInt(bId));
			result = preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				
				e2.printStackTrace();
				result = -1;
			}
		}
		
		return result;
	}
	
}
