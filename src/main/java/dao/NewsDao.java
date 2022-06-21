package dao;

import java.sql.SQLException;
import java.util.List;

import helper.DaoHelper;
import vo.News;

public class NewsDao {

	private static NewsDao instance = new NewsDao();
	private NewsDao() {}
	public static NewsDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	public int getTotalRows() throws SQLException {
		String sql = "select count(*) cnt "
				   + "from soccer_news ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("cnt");
		});
	}
		
	
	public List<News> getNews(int beginIndex, int endIndex) throws SQLException{
		String sql = "select news_no, club_no, league_no, news_name, news_content, news_title, news_created_date, news_updated_date "
				+ "from (select row_number() over (order by news_no desc) row_number, "
				+ "			   news_no, club_no, league_no, news_name, news_content, news_title, news_created_date, news_updated_date "
				+ "		from soccer_news)"
				+ "where row_number >= ? and row_number <= ? "
				+ "order by news_no";

		return helper.selectList(sql, rs -> {

			News news = new News();

			
			news.setNewsNo(rs.getInt("NEWS_NO"));
			news.setNewsName(rs.getString("NEWS_NAME"));
			news.setClubNo(rs.getInt("CLUB_NO"));
			news.setLeagueNo(rs.getInt("LEAGUE_NO"));
			news.setNewsCreatedDate(rs.getDate("NEWS_CREATED_DATE"));
			news.setNewsUpdatedDate(rs.getDate("NEWS_UPDATED_DATE"));
			news.setNewsTitle(rs.getString("NEWS_TITLE"));
			news.setNewsContent(rs.getString("NEWS_CONTENT"));
				
			
			return news;
		},beginIndex, endIndex);			
	}
	
	
}
