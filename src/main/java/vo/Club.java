package vo;

import java.util.Date;

public class Club {
	private int leagueNo;
	private int clubNo;
	private String name;
	private int rank;
	private Date foundingDate;
	private String ointment;
	private String clubHome;
	private String clubCoach;
	private int win;
	private int draw;
	private int defeat;
	private int point;
	private League league;
	
	public Club () {}

	public int getLeagueNo() {
		return leagueNo;
	}

	public void setLeagueNo(int leagueNo) {
		this.leagueNo = leagueNo;
	}

	public int getClubNo() {
		return clubNo;
	}

	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public Date getFoundingDate() {
		return foundingDate;
	}

	public void setFoundingDate(Date founding_date) {
		this.foundingDate = founding_date;
	}

	public String getOintment() {
		return ointment;
	}

	public void setOintment(String ointment) {
		this.ointment = ointment;
	}

	public String getClubHome() {
		return clubHome;
	}

	public void setClubHome(String clubHome) {
		this.clubHome = clubHome;
	}

	public String getClubCoach() {
		return clubCoach;
	}

	public void setClubCoach(String clubCoach) {
		this.clubCoach = clubCoach;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getDefeat() {
		return defeat;
	}

	public void setDefeat(int defeat) {
		this.defeat = defeat;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public League getLeague() {
		return league;
	}

	public void setLeague(League league) {
		this.league = league;
	}
	
	
	
}
