package vo;

public class OrderGoods {

	private int orderNo;
	private int goodsNo;
	private int orderGoodsQuantity;
	private int orderGoodsPrice;
	
	public OrderGoods() {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
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
