package dao;

import java.sql.SQLException;
import java.util.List;

import helper.DaoHelper;
import vo.Player;

public class PlayerDao {
	
	private static PlayerDao instance = new PlayerDao();
	private PlayerDao() {}
	public static PlayerDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();

	public void insertPlayer(Player player) throws SQLException {
		String sql = "insert into SOCCER_PLAYERS "
				   + "(PLAYER_NO, CLUB_NO, PLAYER_NAME, PLAYER_UF_NO, PLAYER_BIRTH,"
				   + "PLAYER_NATIONALITY, PLAYER_GOAL, PLAYER_POSITION, PLAYER_FILE_NAME)"
				   + "values "
				   + "(PLAYER_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		helper.insert(sql, player.getClubNo(), player.getName(), player.getUfNo(), player.getBirth(),
				player.getNationality(), player.getGoal(), player.getPosition(), player.getFileName());
	}
	
	public List<Player> getClubNoPlayer(int clubNo) throws SQLException {
		String sql = "select * "
				   + "from SOCCER_PLAYERS "
				   + "where CLUB_NO = ? ";
		
		return helper.selectList(sql, rs -> {
			Player player = new Player();
			
			player.setPlayerNo(rs.getInt("PLAYER_NO"));
			player.setClubNo(rs.getInt("CLUB_NO"));
			player.setName(rs.getString("PLAYER_NAME"));
			player.setUfNo(rs.getInt("PLAYER_UF_NO"));
			player.setBirth(rs.getDate("PLAYER_BIRTH"));
			player.setNationality(rs.getString("PLAYER_NATIONALITY"));
			player.setGoal(rs.getInt("PLAYER_GOAL"));
			player.setPosition(rs.getString("PLAYER_POSITION"));
			
			return player;
		},clubNo );
	}
	
	public Player getPlayerNoPlayer(int playerNo) throws SQLException {
		String sql = "select * "
				   + "from SOCCER_PLAYERS "
				   + "where PLAYER_NO = ? ";
		
		return helper.selectOne(sql, rs -> {
			Player player = new Player();
			
			player.setPlayerNo(rs.getInt("PLAYER_NO"));
			player.setClubNo(rs.getInt("CLUB_NO"));
			player.setName(rs.getString("PLAYER_NAME"));
			player.setUfNo(rs.getInt("PLAYER_UF_NO"));
			player.setBirth(rs.getDate("PLAYER_BIRTH"));
			player.setNationality(rs.getString("PLAYER_NATIONALITY"));
			player.setGoal(rs.getInt("PLAYER_GOAL"));
			player.setPosition(rs.getString("PLAYER_POSITION"));
			
			return player;
		},playerNo );
	}
	
}
