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
