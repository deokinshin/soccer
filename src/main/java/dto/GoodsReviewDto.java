package dto;

import java.util.Date;

public class GoodsReviewDto {

	private int reviewNo;
	private int userNo;
	private String userName;
	private int goodsNo;
	private String reviewCountent;
	private String reviewDeletes;
	private Date reviewCreatedDate;
	private Date reviewUpDatedDate;
	
	public GoodsReviewDto() {}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getReviewCountent() {
		return reviewCountent;
	}

	public void setReviewCountent(String reviewCountent) {
		this.reviewCountent = reviewCountent;
	}

	public String getReviewDeletes() {
		return reviewDeletes;
	}

	public void setReviewDeletes(String reviewDeletes) {
		this.reviewDeletes = reviewDeletes;
	}

	public Date getReviewCreatedDate() {
		return reviewCreatedDate;
	}

	public void setReviewCreatedDate(Date reviewCreatedDate) {
		this.reviewCreatedDate = reviewCreatedDate;
	}

	public Date getReviewUpDatedDate() {
		return reviewUpDatedDate;
	}

	public void setReviewUpDatedDate(Date reviewUpDatedDate) {
		this.reviewUpDatedDate = reviewUpDatedDate;
	}

	

	
}
