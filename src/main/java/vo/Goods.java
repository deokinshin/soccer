package vo;

import java.util.Date;

public class Goods {

	private int goodsNo;
	private String goodsName;
	private int goodsPrice;
	private int clubNo;
	private Date goodsCreated;
	private Date goodsUpdated;
	private int goodsLikeCount;
	private int goodsReviewCount;
	
	public Goods() {}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public int getClubNo() {
		return clubNo;
	}

	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}

	public Date getGoodsCreated() {
		return goodsCreated;
	}

	public void setGoodsCreated(Date goodsCreated) {
		this.goodsCreated = goodsCreated;
	}

	public Date getGoodsUpdated() {
		return goodsUpdated;
	}

	public void setGoodsUpdated(Date goodsUpdated) {
		this.goodsUpdated = goodsUpdated;
	}

	public int getGoodsLikeCount() {
		return goodsLikeCount;
	}

	public void setGoodsLikeCount(int goodsLikeCount) {
		this.goodsLikeCount = goodsLikeCount;
	}

	public int getGoodsReviewCount() {
		return goodsReviewCount;
	}

	public void setGoodsReviewCount(int goodsReviewCount) {
		this.goodsReviewCount = goodsReviewCount;
	}

	
	
}
