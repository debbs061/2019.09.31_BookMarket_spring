package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {
	
	private Connection conn;
	
	public BoardDAO(Connection conn) {
		this.conn = conn; 
	}
	
	public int insertData(int num, String userId) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into board (userId,num) values (?,?)"; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	
		public int getMaxNum() {
			
			int maxNum = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				sql = "select nvl(max(num),0) from board"; 
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next())  {
					
					maxNum = rs.getInt(1); 
					
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.toString());
			}
			
			return maxNum;
			
		}
		
	// 모임 개설 메소드 
	public int createData(BoardDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into board (num,bookName,advisorId,place,bookDate,time,totalMember,currentMember) ";
			sql += "values (?,?,?,?,?,?,?,?)"; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getBookName());
			pstmt.setString(3, dto.getAdvisorId());
			pstmt.setString(4, dto.getPlace());
			pstmt.setString(5, dto.getBookDate());
			pstmt.setString(6, dto.getTime());
			pstmt.setInt(7, dto.getTotalMember());
			pstmt.setInt(8, 1);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	
	// 해당 월의 모임 list를 가져오는 메소드
	public List<BoardDTO> getLists(String dateStr) {

		List<BoardDTO> lists = new ArrayList<BoardDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			dateStr = dateStr + "%";

			sql = "select substr(bookDate,(instr(bookDate,'-')+1)) as bookDate,"; 
			sql += "num, bookName, time, place, totalMember, currentMember, advisorId ";
			sql += "from board where bookDate like ? and advisorId is not null";
					
			pstmt = conn.prepareStatement(sql);
				
			pstmt.setString(1, dateStr);
			
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("num")); // 모임 고유번호
				dto.setBookName(rs.getString("bookName"));// 책제목
				dto.setTime(rs.getString("time"));// 모임 시작 시간
				dto.setPlace(rs.getString("place")); // 모임 장소
				dto.setBookDate(rs.getString("bookDate")); 
				dto.setTotalMember(rs.getInt("totalMember"));
				dto.setCurrentMember(rs.getInt("currentMember"));
				dto.setAdvisorId(rs.getString("advisorId"));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	
	// num을 이용해 해당 모임의 참가 인원을 반환하는 메소드
	public int getDataCount(int num) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
				
			sql = "select count(*) from board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,num);
			
			rs = pstmt.executeQuery();

			if(rs.next())  {

				dataCount = rs.getInt(1); 

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}

		return dataCount;

	}
	
	// 참가 인원 증가 시 현재 인원수 증가시키기
	public int updateData(int num) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update board set currentMember=currentMember+1 ";
			sql += "where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());

		}
		return result;
	}
	
	
	public BoardDTO getReadData(int num){

		BoardDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from board where num=? and advisorId is not null";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {

				dto = new BoardDTO();
				
				dto.setNum(rs.getInt("num")); // 모임 고유번호
				dto.setBookName(rs.getString("bookName"));// 책제목
				dto.setTime(rs.getString("time"));// 모임 시작 시간
				dto.setPlace(rs.getString("place")); // 모임 장소
				dto.setBookDate(rs.getString("bookDate"));
				dto.setTotalMember(rs.getInt("totalMember"));
				dto.setCurrentMember(rs.getInt("currentMember"));
				dto.setAdvisorId(rs.getString("advisorId"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	
	public  List<BoardDTO> checkUserId(int num) {
		
		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = " select num,userId from board where num=? and userId is not null"; 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num); 
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setUserId(rs.getString("userId"));
				
				lists.add(dto);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	

}
