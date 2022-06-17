package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConnectionUtil;
import vo.Goods;

public class GoodsDao {

	private static GoodsDao instance = new GoodsDao();
	private GoodsDao() {}
	public static GoodsDao getInstance() {
		return instance;
	}
	
	public Goods getGoodsByNo(int goodsNo) throws SQLException {
		String sql = "select * "
				   + "from soccer_goods "
				   + "where goods_no = ? ";
		
		Goods goods = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, goodsNo);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			goods = new Goods();
			goods.setGoodsNo(rs.getInt("goods_no"));
			goods.setGoodsName(rs.getString("goods_name"));
			goods.setGoodsPrice(rs.getInt("goods_price"));
			goods.setClubNo(rs.getInt("club_no"));
			goods.setGoodsCreated(rs.getDate("good_created_date"));
			goods.setGoodsUpdated(rs.getDate("goods_updated_date"));
			goods.setGoodsLikeCount(rs.getInt("goods_like_count"));
			goods.setGoodsReviewCount(rs.getInt("goods_review_count"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return goods;
	}
	
	/**
	 * 전체 굿즈정보를 반환하는 메소드
	 * @return 전체 굿즈정보 목록
	 * @throws SQLException
	 */
	public List<Goods> getAllGoods() throws SQLException {
		String sql = "select goods_no, goods_name, goods_price, club_no "
				   + "from soccer_goods "
				   + "order by goods_no desc ";
		
		List<Goods> goods = new ArrayList<>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Goods good = new Goods();
			
			good.setGoodsNo(rs.getInt("goods_no"));
			good.setGoodsName(rs.getString("goods_name"));
			good.setGoodsPrice(rs.getInt("goods_price"));
			good.setClubNo(rs.getInt("club_no"));
			
			goods.add(good);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return goods;
	}
	
	public List<Goods> getGoods(int beginIndex, int endIndex) throws SQLException {
		String sql = "select goods_no, goods_name, goods_price "
				   + "from (select row_number() over (order by goods_no desc) row_number, "
				   + "             goods_no, goods_name, goods_price "
				   + "      from soccer_goods) "
				   + "where row_number >= ? and row_number <= ? ";
		
		List<Goods> goods = new ArrayList<>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, beginIndex);
		pstmt.setInt(2, endIndex);;
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Goods good = new Goods();
			good.setGoodsNo(rs.getInt("goods_no"));
			good.setGoodsName(rs.getString("goods_name"));
			good.setGoodsPrice(rs.getInt("goods_price"));
			
			goods.add(good);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return goods;
	}
	
	/**
	 * 전체 행의 갯수를 반환한다.
	 * @return 행의 갯수
	 * @throws SQLException
	 */
	public int getTotalRowsCount() throws SQLException{
		String sql = "select count(*) cnt from soccer_goods ";
		
		int totalRowsCount = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalRowsCount = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return totalRowsCount;
		
	}
}
