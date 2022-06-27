package dao;

import java.sql.SQLException;
import java.util.List;

import helper.DaoHelper;
import vo.League;

public class LeagueDao {

	private static LeagueDao instance = new LeagueDao();
	private LeagueDao() {}
	public static LeagueDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	
	public List<League> getAllLeagues() throws SQLException {
		String sql = "select * "
				   + "from SOCCER_LEAGUES ";
		
		return helper.selectList(sql, rs -> {
			League league = new League();
			
			league.setLeagueNo(rs.getInt("LEAGUE_NO"));
			league.setName(rs.getString("LEAGUE_NAME"));
			league.setInformation(rs.getString("LEAGUE_INFORMATION"));
			return league;
		});
	}
	
	public League getLeagueNoLeague(int leagueNo) throws SQLException {
		String sql = "select * "
				   + "from SOCCER_LEAGUES "
				   + "where LEAGUE_NO = ? ";
		
		return helper.selectOne(sql, rs -> {
			League league = new League();
			
			league.setLeagueNo(rs.getInt("LEAGUE_NO"));
			league.setName(rs.getString("LEAGUE_NAME"));
			league.setInformation(rs.getString("LEAGUE_INFORMATION"));


			return league;
		},leagueNo );
	}
}
