package dao;

import java.sql.SQLException;


import helper.DaoHelper;
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

	private DaoHelper helper = DaoHelper.getInstance();
	
	public void insertUser(User user) throws SQLException {
		String sql = "insert into soccer_users "
				   + "(user_no, user_id, user_password, user_name, user_email, user_tel, user_address) "
				   + "values "
				   + "(soccer_users_seq.nextval, ?, ?, ?, ?, ?, ?)";
		helper.insert(sql, user.getId(), user.getPassword(), user.getName(), user.getEmail(), user.getTel(), user.getAddress());
	}
	
	public User getUserById(String id) throws SQLException {
		String sql = "select * "
				   + "from soccer_users "
				   + "where user_id = ? ";
		
		return helper.selectOne(sql, rs -> {
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setCreatedDate(rs.getDate("user_created_date"));
			user.setTel(rs.getString("user_tel"));
			user.setAddress(rs.getString("user_address"));
			
			return user;
		}, id);
	}
	

	public User getUserByEmail(String email) throws SQLException {
		String sql = "select * "
				   + "from soccer_users "
				   + "where user_email = ? ";
		

		return helper.selectOne(sql, rs -> {
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setCreatedDate(rs.getDate("user_created_date"));
			user.setTel(rs.getString("user_tel"));	
      user.setAddress(rs.getString("user_address"));
			return user;
		}, email);
	}
	

}
