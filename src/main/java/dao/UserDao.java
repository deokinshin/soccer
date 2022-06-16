package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.ConnectionUtil;
import vo.User;

public class UserDao {

	private static UserDao instance = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return instance;
	}
	
	/**
	 * 지정된 이메일과 일치하는 사용자정보를 반환한다.
	 * @param email 이메일
	 * @return 사용자 정보, 일치하는 정보가 없으면 null이 반환된다.
	 * @throws SQLException
	 */
	public User getUserByEmail(String email) throws SQLException {
		String sql = "select * "
				   + "from soccer_users "
				   + "where user_email = ? ";
		
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setCreatedDate(rs.getDate("user_created_date"));
			user.setTel(rs.getString("user_tel"));
			user.setAddress(rs.getString("user_address"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
}
