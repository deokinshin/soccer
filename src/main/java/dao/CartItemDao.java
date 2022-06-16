package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CartItemDto;
import util.ConnectionUtil;
import vo.CartItem;

public class CartItemDao {

	private static CartItemDao instance = new CartItemDao();
	private CartItemDao() {}
	public static CartItemDao getInstance() {
		return instance;
	}
	
	/**
	 * 지정된 장바구니 아이템정보를 전달받아서 동일한 정보가 존재하면 수량을 증가시키고, 정보가 존재하지 않으면 추가한다.
	 * @param cartItem 장바구니 아이템정보
	 * @throws SQLException
	 */
	public void mergeCartItem(CartItem cartItem) throws SQLException {
		String sql = "merge "
				+ "    into soccer_carts C "
				+ "using dual "
				+ "    on (C.user_no = ? and C.goods_no = ?) "
				+ "when matched then "
				+ "    update "
				+ "        set  "
				+ "            C.cart_item_quantity = C.cart_item_quantity + 1, "
				+ "            C.cart_item_updated_date = sysdate "
				+ "when not matched then "
				+ "    insert (cart_item_no, user_no, goods_no, cart_item_quantity) "
				+ "    values (soccer_cartitems_seq.nextval, ?, ?, 1)";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, cartItem.getUserNo());
		pstmt.setInt(2, cartItem.getGoodsNo());
		pstmt.setInt(3, cartItem.getUserNo());
		pstmt.setInt(4, cartItem.getGoodsNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 지정된 장바구니 아이템번호와 일치하는 장바구니 아이템정보를 반환한다.
	 * @param itemNo 아이템번호
	 * @return 장바구니 아이템 정보
	 * @throws SQLException
	 */
	public CartItem getCartItemByItemNo(int itemNo) throws SQLException {
		String sql = "select * "
				   + "from soccer_carts "
				   + "where cart_item_no = ? ";
		
		CartItem item = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, itemNo);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			item = new CartItem();
			
			item.setGoodsNo(rs.getInt("cart_item_no"));
			item.setUserNo(rs.getInt("user_no"));
			item.setGoodsNo(rs.getInt("goods_no"));
			item.setCartItemQuantity(rs.getInt("cart_item_quantity"));
			item.setCartItemCreatedDate(rs.getDate("cart_item_created_date"));
			item.setCartItemUpdatedDate(rs.getDate("cart_item_updated_date"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return item;
	}

	/**
	 * 지정된 장바구니 아이템번호와 일치하는 장바구니 아이템정보를 삭제한다.
	 * @param itemNo 장바구니 아이템번호
	 * @throws SQLException
	 */
	public void deleteCartItem(int itemNo) throws SQLException {
		String sql = "delete from soccer_carts "
				   + "where cart_item_no = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, itemNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 지정된 사용자번호로 저장된 장바구니 아이템정보를 반환한다.
	 * @param userNo 사용자번호
	 * @return 장바구니 아이템 목록
	 * @throws SQLException
	 */
	public List<CartItemDto> getCartItemsByUserNo(int userNo) throws SQLException {
		String sql = "select C.cart_item_no, C.user_no, C.goods_no, C.cart_item_quantity, G.goods_name, G.goods_price "
				   + "from soccer_carts C, soccer_goods G "
				   + "where C.user_no = ? "
				   + "and C.goods_no = G.goods_no "
				   + "order by C.cart_item_no desc ";
		
		List<CartItemDto> cartItems = new ArrayList<>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			CartItemDto item = new CartItemDto();
			item.setCartItemNo(rs.getInt("cart_item_no"));
			item.setUserNo(rs.getInt("user_no"));
			item.setGoodsNo(rs.getInt("goods_no"));
			item.setCartItemQuantity(rs.getInt("cart_item_quantity"));
			item.setGoodsName(rs.getString("goods_name"));
			item.setGoodsPrice(rs.getInt("goods_price"));
			
			cartItems.add(item);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return cartItems;
	}
}
