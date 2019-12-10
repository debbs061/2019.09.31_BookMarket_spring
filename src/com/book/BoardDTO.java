package com.book;

public class BoardDTO {

	private int num;
	private String bookName;
	private String advisorId; // ������id
	private String userId; // ������ ���̵�
	private String place; // ��� ���
	private String bookDate; // ��� ����
	private String time; // ��� �����ϴ� �ð�
	private int totalMember; // �� ���� �ο���
	private int currentMember; // ���� �ο� ��

	public int getCurrentMember() {
		return currentMember;
	}
	public void setCurrentMember(int currentMember) {
		this.currentMember = currentMember;
	}
	public int getTotalMember() {
		return totalMember;
	}
	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAdvisorId() {
		return advisorId;
	}
	public void setAdvisorId(String advisorId) {
		this.advisorId = advisorId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getBookDate() {
		return bookDate;
		
	}
	public void setBookDate(String bookDate) {

		this.bookDate = bookDate;
	}


}
