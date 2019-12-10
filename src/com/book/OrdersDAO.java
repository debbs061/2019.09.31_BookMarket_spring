package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAO {
	
	private Connection conn;
	
	public OrdersDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int insertData(OrdersDTO dto,String num) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into orders (username,email,tel,addr,id,notes,num,orderdate) ";
			sql+= "values (?,?,?,?,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getId());
			pstmt.setString(6, dto.getNotes());
			pstmt.setString(7, num);
			
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//주문한정보,제품정보 == 결제내역

	public List<OrdersDTO> getList(String id){//id가지고 들어와서 
		
		List<OrdersDTO> lists = new ArrayList<OrdersDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			/*
			sql = "select * from ";
			sql+= "(select * from ";
			sql+= "(select a.orderDate, a.addr, a.id, a.num, b.name, b.price, b.saveFileName, b.quantity ";
			sql+= "from orders a, ordercart b where a.num=b.num) where id= ? ) order by orderDate desc ";
			*/
			
			/*
			select * from
			(select a.name, a.price, a.saveFileName, a.quantity,
			b.orderDate, b.addr, b.id, b.num, c.num booknum
			from ordercart a, orders b, product c
			where a.num=b.num and a.name=c.name)
			where id=? order by orderDate desc;
			*/
			
			sql = "select * from (select a.name, a.price, a.saveFileName, a.quantity,";
			sql += "b.orderDate, b.addr, b.id, b.num,c.num booknum ";
			sql += "from ordercart a, orders b, product c ";
			sql += "where a.num=b.num and a.name=c.name) ";
			sql += "where id=? order by orderDate desc";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrdersDTO dto = new OrdersDTO();
				
				dto.setOrderDate(rs.getString("orderDate"));
				dto.setAddr(rs.getString("addr"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setNum(rs.getString("num"));
				dto.setQuantity(rs.getString("quantity"));
				dto.setBookNum(rs.getString("booknum"));
				
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	public void deleteData(String num) {
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete orders where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public OrdersDTO getData(String num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		OrdersDTO dto = new OrdersDTO();
		
		try {
			
			sql = "select userName,addr,id,num from orders ";
			sql+= "where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setUserName(rs.getString("userName"));
				dto.setId(rs.getString("id"));
				dto.setAddr(rs.getString("addr"));
				dto.setNum(rs.getString("num"));
		
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	public void updateData(String num,String addr) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update orders set addr = ? ";
			sql+= "where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addr);
			pstmt.setString(2, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	

}
