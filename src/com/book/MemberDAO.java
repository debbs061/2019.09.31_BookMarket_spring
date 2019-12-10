package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn;
	
	public MemberDAO(Connection conn) {
		this.conn = conn;
	}
	
	public void insertData(MemberDTO dto) {
		
		PreparedStatement pstmt = null;
		
		String sql;
		
		try {
			
			sql = "insert into member (userId,userPwd,userName,";
			sql += "userBirth,userTel,email) values (?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,dto.getUserId());
			pstmt.setString(2,dto.getUserPwd());
			pstmt.setString(3,dto.getUserName());
			pstmt.setString(4,dto.getUserBirth());
			pstmt.setString(5,dto.getUserTel());
			pstmt.setString(6,dto.getEmail());
			
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	//userId으로 조회한 한 개의 데이터
	public MemberDTO getReadData(String userId){

		MemberDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select userId,userPwd,userName,to_char(userBirth,'YYYY-MM-DD') userBirth,userTel,email ";
			sql += "from member where userId=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new MemberDTO();

				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserTel(rs.getString("userTel"));
				dto.setEmail(rs.getString("email"));
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	public int IdCheck(String userId){

		MemberDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		int result = 0; // 중복된 아이디가 있으면 1로 바뀌도록

		try {

			sql = "select userId from member where userId=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				result = 1;
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
