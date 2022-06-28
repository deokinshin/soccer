package dao;

import java.sql.SQLException;
import java.util.List;

import helper.DaoHelper;
import vo.Club;
import vo.League;
import vo.News;


import vo.NewsDislikeUser;
import vo.NewsLikeUser;
import vo.NewsReply;
import vo.Player;


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
			news.setNewsViewCount(rs.getInt("NEWS_VIEW_COUNT"));
				
			
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
			news.setNewsViewCount(rs.getInt("NEWS_VIEW_COUNT"));
				
			
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
			news.setNewsViewCount(rs.getInt("NEWS_VIEW_COUNT"));
			
			
			return news;
		},newsNo);
	}
	
	public void updateNews(News news) throws SQLException {
		String sql = "update soccer_news1 "
				   + "set "
				   + "		news_updated_date = sysdate, "
				   + "		news_like_count = ?, "
				   + "		news_dislike_count = ?, "
				   + "		news_view_count = ? "
				   + "where news_no = ? " ;
		
		helper.update(sql, news.getNewsLikeCount(), news.getNewsDislikeCount(), news.getNewsViewCount(), news.getNewsNo() );
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

	public List<Player> getRankNoLeague(int leagueNo) throws SQLException {
		String sql = "SELECT * "
				   + "FROM (SELECT RANK() OVER (ORDER BY P.PLAYER_GOAL DESC) AS RANK, P.PLAYER_NO, P.PLAYER_NAME, P.PLAYER_BIRTH, "
				   + 							"P.PLAYER_NATIONALITY, P.PLAYER_GOAL, C.CLUB_NO, C.CLUB_NAME, L.LEAGUE_NO, L.LEAGUE_NAME "
				   + 		"FROM SOCCER_PLAYERS P, SOCCER_CLUBS C, SOCCER_LEAGUES L "
				   +		"WHERE P.CLUB_NO = C.CLUB_NO "
				   +		"AND C.LEAGUE_NO = L.LEAGUE_NO "
				   +		"AND C.LEAGUE_NO = ? ) "
				   + "WHERE RANK <= 4 " ;
		
		return helper.selectList(sql, rs -> {
			Player player = new Player();
			
			player.setPlayerNo(rs.getInt("PLAYER_NO"));
			player.setName(rs.getString("PLAYER_NAME"));
			player.setBirth(rs.getDate("PLAYER_BIRTH"));
			player.setNationality(rs.getString("PLAYER_NATIONALITY"));
			player.setGoal(rs.getInt("PLAYER_GOAL"));
			player.setRank(rs.getInt("RANK"));
			
			Club club = new Club();
			
			club.setClubNo(rs.getInt("CLUB_NO"));
			club.setName(rs.getString("CLUB_NAME"));
			player.setClub(club);
			
			League league = new League();
			
			league.setLeagueNo(rs.getInt("LEAGUE_NO"));
			league.setName(rs.getString("LEAGUE_NAME"));
			player.setLeague(league);
			
			
			return player;
		}, leagueNo);
	}
	
	public void insertNewsReply(NewsReply newsReply) throws SQLException {
		String sql = "insert into soccer_news_replys "
				   + "(reply_no, user_no, user_id, news_no, reply_contents) "
				   + "values "
				   + "(soccer_news_replys_seq.nextval, ?, ?, ?, ?) ";
		helper.insert(sql, newsReply.getUserNo(), newsReply.getUserId(), newsReply.getNewsNo(), newsReply.getContent());
	}
	
	
	public List<NewsReply> getNewsReply(int newsNo) throws SQLException {
		String sql = "select R.reply_no, R.reply_contents, U.user_no, U.user_id, R.reply_created_date, R.reply_updated_date, R.reply_deleted "
				   + "from soccer_news_replys R, soccer_users U "
				   + "where R.user_no = U.user_no "
				   + "and R.reply_deleted = 'N' "
				   + "and R.news_no = ? ";
		
		return helper.selectList(sql, rs -> {
			
			NewsReply newsReply = new NewsReply();
			
			newsReply.setReplyNo(rs.getInt("REPLY_NO"));
			newsReply.setContent(rs.getString("REPLY_CONTENTS"));
			newsReply.setCreatedDate(rs.getDate("REPLY_CREATED_DATE"));
			newsReply.setUpdatedDate(rs.getDate("REPLY_UPDATED_DATE"));
			newsReply.setUserId(rs.getString("USER_ID"));
			newsReply.setUserNo(rs.getInt("USER_NO"));
			newsReply.setDeleted(rs.getString("REPLY_DELETED"));

			
			return newsReply;
			
		},newsNo);	
	}
	
	public void updateNewsReply(NewsReply newsReply) throws SQLException {
		String sql = "update soccer_news_replys "
				   + "set "
				   + "		reply_updated_date = sysdate, "
				   + "		reply_contents = ?, "
				   + "		reply_deleted = ? "
				   + "where reply_no = ? " ;
		
		helper.update(sql, newsReply.getContent(), newsReply.getDeleted(), newsReply.getReplyNo() );
	}
	
	public NewsReply getReplyNo(int replyNo) throws SQLException {
		String sql = "select USER_NO, USER_ID, NEWS_NO, REPLY_CONTENTS, REPLY_CREATED_DATE, REPLY_UPDATED_DATE, REPLY_DELETED, REPLY_NO "
				   + "from SOCCER_NEWS_REPLYS "
				   + "where REPLY_NO = ? " ;
		
		return helper.selectOne(sql,rs -> {
			NewsReply reply = new NewsReply();
			
			reply.setUserNo(rs.getInt("USER_NO"));
			reply.setUserId(rs.getString("USER_ID"));
			reply.setNewsNo(rs.getInt("NEWS_NO"));
			reply.setContent(rs.getString("REPLY_CONTENTS"));
			reply.setCreatedDate(rs.getDate("REPLY_CREATED_DATE"));
			reply.setUpdatedDate(rs.getDate("REPLY_UPDATED_DATE"));
			reply.setDeleted(rs.getString("REPLY_DELETED"));
			reply.setReplyNo(rs.getInt("REPLY_NO"));
			
			return reply;
			
		},replyNo);
	}
	
	public List<News> getRankNoNews(int newsNo) throws SQLException {
		String sql = "SELECT * "
				   + "FROM (SELECT RANK() OVER (ORDER BY NEWS_VIEW_COUNT DESC) AS RANK, NEWS_NO, NEWS_NAME, NEWS_VIEW_COUNT "
				   + 		"FROM SOCCER_NEWS1 ) "
				   + "WHERE RANK <= 4 " ;
		
		return helper.selectList(sql, rs -> {
			
			News news = new News();
			
			news.setNewsNo(rs.getInt("NEWS_NO"));
			news.setNewsName(rs.getString("NEWS_NAME"));
			news.setNewsViewCount(rs.getInt("NEWS_VIEW_COUNT"));
			news.setRank(rs.getInt("RANK"));
			
			return news;
			
		}, newsNo);
	}
}
