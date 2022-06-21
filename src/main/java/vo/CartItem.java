package vo;

import java.util.Date;

public class CartItem {

	private int cartItemNo;
	private int userNo;
	private int goodsNo;
	private int cartItemQuantity;
	private Date cartItemCreatedDate;
	private Date cartItemUpdatedDate;
	
	public CartItem() {}

	public int getCartItemNo() {
		return cartItemNo;
	}

	public void setCartItemNo(int cartItemNo) {
		this.cartItemNo = cartItemNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getCartItemQuantity() {
		return cartItemQuantity;
	}

	public void setCartItemQuantity(int cartItemQuantity) {
		this.cartItemQuantity = cartItemQuantity;
	}

	public Date getCartItemCreatedDate() {
		return cartItemCreatedDate;
	}

	public void setCartItemCreatedDate(Date cartItemCreatedDate) {
		this.cartItemCreatedDate = cartItemCreatedDate;
	}

	public Date getCartItemUpdatedDate() {
		return cartItemUpdatedDate;
	}

	public void setCartItemUpdatedDate(Date cartItemUpdatedDate) {
		this.cartItemUpdatedDate = cartItemUpdatedDate;
	}

	

	
	
}
