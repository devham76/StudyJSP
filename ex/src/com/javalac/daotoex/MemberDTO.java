package com.javalac.daotoex;
// db에서 가져온 데이터를 관리해주는 클래스
public class MemberDTO {
	
	private String userId;
	private String userPw;
	private String userName;
	
	public MemberDTO(String userId, String userPw, String userName) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	

}
