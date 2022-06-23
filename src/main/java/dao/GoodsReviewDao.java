package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.GoodsReviewDto;
import util.ConnectionUtil;

public class GoodsReviewDao {

	private static GoodsReviewDao instance = new GoodsReviewDao();
	private GoodsReviewDao() {}
	public static GoodsReviewDao getInstance() {
		return instance;
	}
	
	public List<GoodsReviewDto> getgoodsReviewDtos(int goodsNo) throws SQLException {
		String sql = "select R.review_no, R.user_no, R.goods_no, R.review_content, R.review_created_date, U.user_no, U.user_name "
				   + "from goods_reviews R, soccer_users U "
				   + "where R.user_no = U.user_no "
				   + "and R.goods_no = ? ";
		
		List<GoodsReviewDto> reviews = new ArrayList<>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, goodsNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			GoodsReviewDto review = new GoodsReviewDto();
			review.setReviewNo(rs.getInt("review_no"));
			review.setUserNo(rs.getInt("user_no"));
			review.setReviewCountent(rs.getString("review_content"));
			review.setReviewCreatedDate(rs.getDate("review_created_date"));
			review.setUserName(rs.getString("user_name"));
			
			reviews.add(review);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
}
