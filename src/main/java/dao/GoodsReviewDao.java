package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.GoodsReviewDto;
import helper.DaoHelper;
import util.ConnectionUtil;

public class GoodsReviewDao {

	private static GoodsReviewDao instance = new GoodsReviewDao();
	private GoodsReviewDao() {}
	public static GoodsReviewDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();

	
	public List<GoodsReviewDto> getgoodsReviewDtos(int goodsNo) throws SQLException {
		String sql = "select R.review_no, R.user_no, R.goods_no, R.review_content, R.review_created_date, U.user_no, U.user_name "
				   + "from soccer_goods_reviews R, soccer_users U "
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
	
	public void insertReview(GoodsReviewDto review) throws SQLException {
		String sql = "insert into SOCCER_GOODS_REVIEWS "
				   + "(REVIEW_NO,USER_NO,USER_NAME,GOODS_NO,REVIEW_CONTENT) "
				   + "values "
				   + "(SOCCER_GOODS_REVIEWS_SEQ.nextval , ?, ?, ?, ?) ";
		helper.insert(sql, review.getUserNo(), review.getUserName(),review.getGoodsNo(),review.getReviewCountent());
	}
	
	public void updateReview(GoodsReviewDto review) throws SQLException {
		String sql = "update SOCCER_GOODS_REVIEWS "
				   + "set "
				   + "  REVIEW_CONTENT = ?, "
				   + "  REVIEW_UPDATED_DATE = sysdate "
				   + "WHERE REVIEW_NO = ? ";
		helper.update(sql, review.getReviewCountent(), review.getReviewNo());
	}
	
	public GoodsReviewDto getReviewNoReview(int reviewNo) throws SQLException {
		String sql = "select USER_NO,USER_NAME,GOODS_NO,REVIEW_CONTENT "
				   + "from SOCCER_GOODS_REVIEWS "
				   + "where REVIEW_NO = ? ";
		
		return helper.selectOne(sql, rs -> {
			GoodsReviewDto review = new GoodsReviewDto();
			
			review.setGoodsNo(rs.getInt(reviewNo));
			review.setUserNo(rs.getInt(reviewNo));
			review.setReviewCountent(rs.getString(reviewNo));
			review.setUserName(rs.getNString(reviewNo));
			
			return review;
		}, reviewNo);
	}
}
