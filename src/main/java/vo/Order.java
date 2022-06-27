package vo;

import java.sql.Date;

public class Order {

	private int orderNo;
	private int userNo;
	private Date orderCreatedDate;
	private String orderStatus;
	private int orderTotalPrice;
	
	public Order() {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getOrderCreatedDate() {
		return orderCreatedDate;
	}

	public void setOrderCreatedDate(Date orderCreatedDate) {
		this.orderCreatedDate = orderCreatedDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public Order(int orderNo, int userNo, Date orderCreatedDate, String orderStatus, int orderTotalPrice) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.orderCreatedDate = orderCreatedDate;
		this.orderStatus = orderStatus;
		this.orderTotalPrice = orderTotalPrice;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", orderCreatedDate=" + orderCreatedDate
				+ ", orderStatus=" + orderStatus + ", orderTotalPrice=" + orderTotalPrice + "]";
	}
	
	
	
}
