package dao;

import java.sql.SQLException;

import helper.DaoHelper;

public class OrderDao {
	
	private static OrderDao instance = new OrderDao();
	private OrderDao() {}
	public static OrderDao getInstance() {
		return instance;
	}
	private DaoHelper helper = DaoHelper.getInstance();
	
	public int getOrderByNo() throws SQLException {
		String sql = "select soccer_orders_seq.nextval seq "
				   + "from dual ";
		
			return helper.selectOne(sql, rs -> {
			
			return rs.getInt("seq");
		});
	}
	
	
	
	
}
