package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

	private Connection conn;

	public ItemDAO(Connection conn) {

		this.conn =conn;
	}

	public int insertItem(ItemDTO dto) {
		
		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into item (name,price,quantity,id,saveFileName,num) ";
			sql+= "values (?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setString(3, dto.getQuantity());
			pstmt.setString(4, dto.getId());
			pstmt.setString(5, dto.getSaveFileName());
			pstmt.setString(6, dto.getNum());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	//�ѷ��� ���̵� ��ü����
	public List<ItemDTO> getLists(String id){

		List<ItemDTO> lists = new ArrayList<ItemDTO>();

		PreparedStatement pstmt =null;

		ResultSet rs = null;
		String sql;

		try {

			sql="select name,price,quantity,id,saveFileName,num ";
			sql+="from item where id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,id);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				ItemDTO dto = new ItemDTO();

				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setQuantity(rs.getString("quantity"));
				dto.setId(rs.getString("id"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setNum(rs.getString("num"));

				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	//�ߺ� ������ ī��Ʈ ���ϱ�
	public int checkOverlap	(String id, String name) {
	
		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql="select nvl(count(*),0) from item "; 
			sql+="where id=? and name=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, name);

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
				
	//��ü ������ ī��Ʈ ���ϱ�
	public int getDataCount(String id) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql="select nvl(count(*),0) from item "; 
			sql="where id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dataCount = rs.getInt(1);//1��° �÷�
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dataCount;
	}

	//Cart���� ������ư�� �ϳ��� item ����
	public int deleteItemByName(String name,String id) {

		int result =0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete from item where name=? and id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, id);

			result = pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	//Id ��ü Cart���� ����� 
	public int deleteAllItems(String id) {

		int result =0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql ="delete from item where id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	//Cart���� ���������ϱ�
	public int updateItemByName(String id,String name,String quantity) {

		int result=0;

		PreparedStatement pstmt = null;
		String sql;
	
		try {
			
			sql="update item set quantity=? ";
			sql+="where name=? and id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, quantity);
			pstmt.setString(2, name);
			pstmt.setString(3, id);

			result=pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//Cart�� �̹� �ߺ��Ǵ� å�� ���� ���>> ���� ������Ʈ���ֱ�
	public int updateItemWhenOverlap(ItemDTO idto) {

		int result=0;

		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		String str=null;
		
		try {
			
			sql="select quantity from item ";
			sql+="where id=? and name=?";
			
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1, idto.getId());
			pstmt.setString(2, idto.getName());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {

				str = rs.getString(1);//1��° �÷�
			}
			
			int originalquantity= Integer.parseInt(str);
			int newquantity = Integer.parseInt(idto.getQuantity());
			
			String updatedquantity =Integer.toString(originalquantity+newquantity);
						
			sql="update item set quantity=? ";
			sql+="where name=? and id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, updatedquantity);
			pstmt.setString(2, idto.getName());
			pstmt.setString(3, idto.getId());

			result=pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
