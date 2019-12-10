package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.net.aso.r;

public class ReviewDAO {
	
private Connection conn;
	
	public ReviewDAO(Connection conn) {
		this.conn = conn;
	}
	
		//�ѷ��� Review ������ ���� //�ֽż��� ������ ���� asc
		public List<ReviewDTO> getLists(int num,int start, int end){

			List<ReviewDTO> reviewLists = new ArrayList<ReviewDTO>();

			PreparedStatement pstmt =null;

			ResultSet rs = null;
			String sql;

			try {
		
				sql="select * from (";
				sql+="select rownum rnum,data.* from (";
				sql+="select * from review ";
				sql+="where num=? order by reviewDate desc) data) ";
				sql+="where rnum>=? and rnum<=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, num);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
				rs = pstmt.executeQuery();

				while(rs.next()) {
					
					ReviewDTO reDto = new ReviewDTO();

					reDto.setUserName(rs.getString("userName"));
					reDto.setEmail(rs.getString("email"));
					reDto.setReviewDate(rs.getString("reviewDate"));
					reDto.setRating(rs.getInt("rating"));
					reDto.setReviewContent(rs.getString("reviewContent"));
					reDto.setNum(rs.getString("num"));
					reDto.setR_seq(rs.getString("r_seq"));
					reDto.setUserId(rs.getString("userId"));
					reDto.setUserPwd(rs.getString("userPwd"));
					
					
					reviewLists.add(reDto);
					
				}
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return reviewLists;
		}
		
			
		
		//���� �μ�Ʈ
			public int insertDataOfReview (ReviewDTO dto) {
				
				
				int result = 0;
				PreparedStatement pstmt = null;
				String sql;
				
				try {
					
					sql = "insert into review (userName,email,reviewDate,rating,reviewContent,num,r_seq,userId,userPwd) ";
					sql+= "values (?,?,sysdate,?,?,?,r_seq.nextval,?,?)";
					
				
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, dto.getUserName());
					pstmt.setString(2, dto.getEmail());
					pstmt.setInt(3, dto.getRating());
					pstmt.setString(4, dto.getReviewContent());
					pstmt.setString(5, dto.getNum());
					pstmt.setString(6, dto.getUserId());
					pstmt.setString(7, dto.getUserPwd());
				
					result = pstmt.executeUpdate();
					pstmt.close();
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				return result;
			}
			
			
			//���� ���� ī��Ʈ �ϱ�
			public int reviewCountByProductNum(int num) {
		
				int dataCount = 0;

				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql;

				try {

					sql="select nvl(count(*),0) from review "; 
					sql+="where num=?";

					pstmt = conn.prepareStatement(sql);
					

					pstmt.setInt(1, num);

					rs = pstmt.executeQuery();

					if(rs.next()) {

						dataCount = rs.getInt(1);
					}
					
					pstmt.close();
					rs.close();
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				return dataCount;
			}

			
			//ȸ�� ���� �����
			public int ReviewDeletion(String r_seq) {
				
				

				int result = 0;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql;
				
				try {
					
					sql="delete from review where r_seq=?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, r_seq);
					
					result =pstmt.executeUpdate();
					
					pstmt.close();
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				return result;
			}
				
			
			//��ȸ�� ���� ����
			public int visitorReviewDeletion(String r_seq) {
				
				int result = 0;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql;
				
				try {
					
					sql="delete from review where r_seq=?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, r_seq);	
					
					result =pstmt.executeUpdate();
					
					pstmt.close();
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				return result;
			}
			
			
			/*public int pwdCheck(String r_seq,String userPwd){

				MemberDTO dto = null;

				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql;
				
				int result = 0; // �ߺ��� ���̵� ������ 1�� �ٲ��

				try {

					sql = "select userId from member where r-seq=? and userPwd=?";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, r_seq);
					pstmt.setString(1, userPwd);

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
	
			}*/

}