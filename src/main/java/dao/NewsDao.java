package dao;

import java.sql.SQLException;
import java.util.List;

import helper.DaoHelper;
import vo.News;
import vo.NewsDislikeUser;
import vo.NewsLikeUser;

public class NewsDao {

	private static NewsDao instance = new NewsDao();
	private NewsDao() {}
	
	public static NewsDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	public int getTotalRows() throws SQLException {
		String sql = "select count(*) cnt "
				   + "from soccer_news1 ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("cnt");
		});
	}
		
	
	public List<News> getNews(int beginIndex, int endIndex) throws SQLException{
		String sql = "select news_no, club_no, league_no, news_name, news_content1, news_content2, news_title, news_created_date, news_updated_date, "
				   + "		 news_view_count, news_like_count, news_dislike_count "		
				   + "from (select row_number() over (order by news_no asc) row_number, "
				   + "			   news_no, club_no, league_no, news_name, news_content1, news_content2, news_title, news_created_date, news_updated_date, "
				   + "			   news_like_count, news_dislike_count, news_view_count "	
				   + "		from soccer_news1)"
				   + "where row_number >= ? and row_number <= ? "
				   + "order by news_no";


		return helper.selectList(sql, rs -> {
			News news = new News();
		
			news.setNewsNo(rs.getInt("NEWS_NO"));
			news.setNewsName(rs.getString("NEWS_NAME"));
			news.setNewsTitle(rs.getString("NEWS_TITLE"));
			news.setNewsContent1(rs.getString("NEWS_CONTENT1"));
			news.setNewsContent2(rs.getString("NEWS_CONTENT2"));
			news.setClubNo(rs.getInt("CLUB_NO"));
			news.setLeagueNo(rs.getInt("LEAGUE_NO"));
			news.setNewsCreatedDate(rs.getDate("NEWS_CREATED_DATE"));
			news.setNewsUpdatedDate(rs.getDate("NEWS_UPDATED_DATE"));
			news.setNewsLikeCount(rs.getInt("NEWS_LIKE_COUNT"));
			news.setNewsDislikeCount(rs.getInt("NEWS_DISLIKE_COUNT"));
				
			
			return news;
		},beginIndex, endIndex);			
	}
	
	public News getArticleByNO(int newsNo) throws SQLException{
		String sql = "select * "
				   + "from soccer_news1 "
				   + "where news_no = ? "
				   + "order by news_no ";

		return helper.selectOne(sql, rs -> {
			News news = new News();
			
			news.setNewsNo(rs.getInt("NEWS_NO"));
			news.setNewsName(rs.getString("NEWS_NAME"));
			news.setNewsTitle(rs.getString("NEWS_TITLE"));
			news.setNewsContent1(rs.getString("NEWS_CONTENT1"));
			news.setNewsContent2(rs.getString("NEWS_CONTENT2"));
			news.setClubNo(rs.getInt("CLUB_NO"));
			news.setLeagueNo(rs.getInt("LEAGUE_NO"));
			news.setNewsCreatedDate(rs.getDate("NEWS_CREATED_DATE"));
			news.setNewsUpdatedDate(rs.getDate("NEWS_UPDATED_DATE"));
			news.setNewsLikeCount(rs.getInt("NEWS_LIKE_COUNT"));
			news.setNewsDislikeCount(rs.getInt("NEWS_DISLIKE_COUNT"));
				
			
			return news;
		},newsNo);
	}
	
	public List<News> getLeagueNoNews(int leagueNo) throws SQLException{
		String sql = "select * "
				   + "from soccer_news1 "
				   + "where news_no = ? ";

		return helper.selectList(sql, rs -> {
			News news = new News();
			
			news.setNewsNo(rs.getInt("NEWS_NO"));
			news.setNewsName(rs.getString("NEWS_NAME"));
			news.setNewsTitle(rs.getString("NEWS_TITLE"));
			news.setNewsContent1(rs.getString("NEWS_CONTENT1"));
			news.setNewsContent2(rs.getString("NEWS_CONTENT2"));
			news.setClubNo(rs.getInt("CLUB_NO"));
			news.setLeagueNo(rs.getInt("LEAGUE_NO"));
			news.setNewsCreatedDate(rs.getDate("NEWS_CREATED_DATE"));
			news.setNewsUpdatedDate(rs.getDate("NEWS_UPDATED_DATE"));
			news.setNewsLikeCount(rs.getInt("NEWS_LIKE_COUNT"));
			news.setNewsDislikeCount(rs.getInt("NEWS_DISLIKE_COUNT"));
				
			
			return news;
		},leagueNo);
	}
	
	public List<News> getArticleNByNews(int newsNo) throws SQLException{
		String sql = "select * "
				   + "from soccer_news1 "
				   + "where news_no = ? ";
		
		return helper.selectList(sql, rs -> {
			News news = new News();
			
			news.setNewsNo(rs.getInt("NEWS_NO"));
			news.setNewsName(rs.getString("NEWS_NAME"));
			news.setNewsTitle(rs.getString("NEWS_TITLE"));
			news.setNewsContent1(rs.getString("NEWS_CONTENT1"));
			news.setNewsContent2(rs.getString("NEWS_CONTENT2"));
			news.setClubNo(rs.getInt("CLUB_NO"));
			news.setLeagueNo(rs.getInt("LEAGUE_NO"));
			news.setNewsCreatedDate(rs.getDate("NEWS_CREATED_DATE"));
			news.setNewsUpdatedDate(rs.getDate("NEWS_UPDATED_DATE"));
			news.setNewsLikeCount(rs.getInt("NEWS_LIKE_COUNT"));
			news.setNewsDislikeCount(rs.getInt("NEWS_DISLIKE_COUNT"));
			
			
			return news;
		},newsNo);
	}
	
	public void updateNews(News news) throws SQLException {
		String sql = "update soccer_news1 "
				   + "set "
				   + "		news_updated_date = sysdate "
				   + "		news_view_count = ? "
				   + "		news_like_count = ? "
				   + "		news_dislike_count = ? "
				   + "where news_no = ? " ;
		
		helper.update(sql, news.getNewsLikeCount(), news.getNewsDislikeCount(), news.getNewsLikeCount() );
	}
	
	public void insertNewsLikeUser(NewsLikeUser newsLikeUser) throws SQLException {
		String sql = "insert into soccer_news_like_users(news_no, user_no) values(?, ?)";
		
		helper.insert(sql, newsLikeUser.getNews().getNewsNo() ,newsLikeUser.getUser().getNo());
	}
	
	public void insertNewsDislikeUser(NewsDislikeUser newsDislikeUser) throws SQLException {
		String sql = "insert into soccer_news_like_users(news_no, user_no) values(?, ?)";
		
		helper.insert(sql, newsDislikeUser.getNews().getNewsNo() ,newsDislikeUser.getUser().getNo());
	}
	
	public NewsLikeUser getNewsLikeUser(int newsNo, int userNo) throws SQLException {
		String sql = "select news_no, user_no "
				   + "from soccer_news_like_users "
				   + "where news_no = ? and user_no = ? ";
		
		return helper.selectOne(sql, rs -> {
			return new NewsLikeUser(newsNo, userNo);
		}, newsNo, userNo);
	}
	
	public NewsDislikeUser getNewsDislikeUser(int newsNo, int userNo) throws SQLException {
		String sql = "select news_no, user_no "
				+ "from soccer_news_like_users "
				+ "where news_no = ? and user_no = ? ";
		
		return helper.selectOne(sql, rs -> {
			return new NewsDislikeUser(newsNo, userNo);
		}, newsNo, userNo);
	}
}
