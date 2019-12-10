package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderCartDAO {

	private Connection conn;

	public OrderCartDAO(Connection conn) {

		this.conn =conn;
	}

	//Item 데이터 insert
	public int insertItem(ItemDTO dto,String num) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into ordercart (name,price,quantity,id,saveFileName,num) ";
			sql+= "values (?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setString(3, dto.getQuantity());
			pstmt.setString(4, dto.getId());
			pstmt.setString(5, dto.getSaveFileName());
			pstmt.setString(6, num);
			
			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//개인 전체 주문정보 구하기
	public List<OrderCartDTO> getLists(String id){
		
		//세션 대신, 임시로 임의의 Id 값을 받아서 진행

		List<OrderCartDTO> lists = new ArrayList<OrderCartDTO>();

		PreparedStatement pstmt =null;

		ResultSet rs = null;
		String sql;

		try {
			
			sql="select name,price,quantity,id,saveFileName ";
			sql+="from ordercart where id=?";

			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderCartDTO dto = new OrderCartDTO();
				
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setQuantity(rs.getString("quantity"));
				dto.setId(rs.getString("id"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	public int getDataCount(String id) {
		
		int dataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql="select nvl(count(*),0) from ordercart "; 
			sql="where id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dataCount = rs.getInt(1);//1번째 컬럼
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dataCount;
	}
	
	public void deleteData(String num) {
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete orderCart where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}