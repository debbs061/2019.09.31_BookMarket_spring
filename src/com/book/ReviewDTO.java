package com.book;

public class ReviewDTO {
	
	private String userId;
	private String userName;
	private String email;
	private String reviewDate;
	private int rating;
	private String reviewContent;
	private String num;
	private String r_seq;
	private String userPwd;
	
	//pwd
	//비회원일 경우
	//이름을 동일한 값으로 넣고 
	//비회원인 경우에만 
	//id를 고정/ 익명씨 
	
	
	
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getR_seq() {
		return r_seq;
	}
	public void setR_seq(String r_seq) {
		this.r_seq = r_seq;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
}
