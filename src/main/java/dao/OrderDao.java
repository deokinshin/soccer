package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.ConnectionUtil;
import vo.Order;

public class OrderDao {
	
	private static OrderDao instance = new OrderDao();
	private OrderDao() {}
	public static OrderDao getInstance() {
		return instance;
	}
	
	public Order getOrderByNo(int orderNo) throws SQLException {
		String sql = "select * "
				   + "from soccer_orders "
				   + "where order_no = ? ";
		
		Order order = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			order = new Order();
			order.setOrderNo(rs.getInt("order_no"));
			order.setUserNo(rs.getInt("user_no"));
			order.setOrderTotalPrice(rs.getInt("order_total_price"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return order;
	}
}
