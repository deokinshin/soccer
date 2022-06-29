package dto;

public class OrderDto {

	private int orderNo;
	private String goodsName;
	private int GoodsPrice;
	private int orderGoodsQuantity;
	private int orderGoodsPrice;
	
	public OrderDto() {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsPrice() {
		return GoodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		GoodsPrice = goodsPrice;
	}

	public int getOrderGoodsQuantity() {
		return orderGoodsQuantity;
	}

	public void setOrderGoodsQuantity(int orderGoodsQuantity) {
		this.orderGoodsQuantity = orderGoodsQuantity;
	}

	public int getOrderGoodsPrice() {
		return orderGoodsPrice;
	}

	public void setOrderGoodsPrice(int orderGoodsPrice) {
		this.orderGoodsPrice = orderGoodsPrice;
	}
	
	
}
