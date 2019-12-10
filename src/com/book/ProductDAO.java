package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	
	private Connection conn;
	
	public ProductDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int insertData(ProductDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into product (name,price,num,review,saveFileName,category,writer) ";
			sql+= "values (?,?,?,?,?,?,?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, dto.getReview());
			pstmt.setString(5, dto.getSaveFileName());
			pstmt.setString(6, dto.getCategory());
			pstmt.setString(7, dto.getWriter());
			
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	public ProductDTO getReadData(int num) {
		
		ProductDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select name,price,num,review,saveFileName,category,writer ";
			sql+= "from product where num=? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new ProductDTO();
				
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setNum(rs.getInt("num"));
				dto.setReview(rs.getString("review"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setCategory(rs.getString("category"));
				dto.setWriter(rs.getString("writer"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select nvl(max(num),0) from product";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
	
	public int getDataCount() {
		
		int dataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(count(*),0) from product";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dataCount = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dataCount;
	}
	
	public List<ProductDTO> getLists(int start, int end){
		
		List<ProductDTO> lists = new ArrayList<ProductDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (";
			sql += "select rownum rnum,data.* from (";
			sql += "select name,price,num,review,saveFileName,";
			sql += "category,writer from product order by num desc) data) ";
			sql += "where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setNum(rs.getInt("num"));
				dto.setReview(rs.getString("review"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setCategory(rs.getString("category"));
				dto.setWriter(rs.getString("writer"));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}

	public List<ProductDTO> getLists(String category, int start, int end){
		
		List<ProductDTO> lists = new ArrayList<ProductDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (";
			sql += "select rownum rnum,data.* from (";
			sql += "select name,price,num,review,saveFileName,";
			sql += "category,writer from product order by num desc) data where category=?) ";
			sql += "where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setNum(rs.getInt("num"));
				dto.setReview(rs.getString("review"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setCategory(rs.getString("category"));
				dto.setWriter(rs.getString("writer"));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	//책삭제하는
	public int deleteData(String name) { //책이름 받아서 

		int result =0;

		PreparedStatement pstmt = null;
		String sql;
		System.out.println("1");

		try {

			sql = "delete from product where name = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	} 

	//삭제할 책 이름 가져와서 하나의 데이터 셀렉
	public ProductDTO getReadData(String name) {

		ProductDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select name,price,num,review,saveFileName,category,writer ";
			sql+= "from product where name=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new ProductDTO();

				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setNum(rs.getInt("num"));
				dto.setReview(rs.getString("review"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setCategory(rs.getString("category"));
				dto.setWriter(rs.getString("writer"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}


}
