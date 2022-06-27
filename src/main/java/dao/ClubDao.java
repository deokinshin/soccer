package dao;

import java.sql.SQLException;
import java.util.List;

import helper.DaoHelper;
import vo.Club;

public class ClubDao {

	private static ClubDao instance = new ClubDao();
	private ClubDao() {}
	public static ClubDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	public List<Club> getLeagueNoClubs(int leagueNo) throws SQLException {
		String sql = "select * "
				   + "from SOCCER_CLUBS "
				   + "where LEAGUE_NO = ? ";
		
		return helper.selectList(sql, rs -> {
			Club club = new Club();
			club.setLeagueNo(rs.getInt("LEAGUE_NO"));
			club.setClubNo(rs.getInt("CLUB_NO"));
			club.setName(rs.getNString("CLUB_NAME"));
			club.setRank(rs.getInt("CLUB_RANK"));
			club.setFoundingDate(rs.getDate("FOUNDING_DATE"));
			club.setOintment(rs.getNString("OINTMENT"));
			club.setClubHome(rs.getNString("CLUB_HOME"));
			club.setClubCoach(rs.getNString("CLUB_COACH"));
			club.setWin(rs.getInt("CLUB_WIN"));
			club.setDraw(rs.getInt("CLUB_DRAW"));
			club.setDefeat(rs.getInt("CLUB_DEFEAT"));
			club.setPoint(rs.getInt("CLUB_POINT"));
			
			return club;
		}, leagueNo);
	}
	public List<Club> getClubNoClubs(int clubNo) throws SQLException {
		String sql = "select * "
				   + "from SOCCER_CLUBS "
				   + "where CLUB_NO = ? ";
		
		return helper.selectList(sql, rs -> {
			Club club = new Club();
			club.setLeagueNo(rs.getInt("LEAGUE_NO"));
			club.setClubNo(rs.getInt("CLUB_NO"));
			club.setName(rs.getNString("CLUB_NAME"));
			club.setRank(rs.getInt("CLUB_RANK"));
			club.setFoundingDate(rs.getDate("FOUNDING_DATE"));
			club.setOintment(rs.getNString("OINTMENT"));
			club.setClubHome(rs.getNString("CLUB_HOME"));
			club.setClubCoach(rs.getNString("CLUB_COACH"));
			club.setWin(rs.getInt("CLUB_WIN"));
			club.setDraw(rs.getInt("CLUB_DRAW"));
			club.setDefeat(rs.getInt("CLUB_DEFEAT"));
			club.setPoint(rs.getInt("CLUB_POINT"));
			
			return club;
		}, clubNo);
	}
	
	public List<Club> getAllClubs() throws SQLException{
		String sql = "select * "
				   + "from SOCCER_CLUBS ";
		
		return helper.selectList(sql, rs -> {
			Club club = new Club();
			club.setLeagueNo(rs.getInt("LEAGUE_NO"));
			club.setClubNo(rs.getInt("CLUB_NO"));
			club.setName(rs.getNString("CLUB_NAME"));
			club.setRank(rs.getInt("CLUB_RANK"));
			club.setFoundingDate(rs.getDate("FOUNDING_DATE"));
			club.setOintment(rs.getNString("OINTMENT"));
			club.setClubHome(rs.getNString("CLUB_HOME"));
			club.setClubCoach(rs.getNString("CLUB_COACH"));
			club.setWin(rs.getInt("CLUB_WIN"));
			club.setDraw(rs.getInt("CLUB_DRAW"));
			club.setDefeat(rs.getInt("CLUB_DEFEAT"));
			club.setPoint(rs.getInt("CLUB_POINT"));
			
			return club;
		});
	}
	
	
}
