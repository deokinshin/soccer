package vo;

import java.util.Date;

public class News {
	
	private int newsNo;
	private int clubNo;
	private int leagueNo;
	private String newsName;
	private String newsTitle;
	private String newsContent;
	private Date newsCreatedDate;
	private Date newsUpdatedDate;
	
	public News () {}

	public int getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}

	public int getClubNo() {
		return clubNo;
	}

	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}

	public int getLeagueNo() {
		return leagueNo;
	}

	public void setLeagueNo(int leagueNo) {
		this.leagueNo = leagueNo;
	}

	public String getNewsName() {
		return newsName;
	}

	public void setNewsName(String newsName) {
		this.newsName = newsName;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	public Date getNewsCreatedDate() {
		return newsCreatedDate;
	}

	public void setNewsCreatedDate(Date newsCreatedDate) {
		this.newsCreatedDate = newsCreatedDate;
	}

	public Date getNewsUpdatedDate() {
		return newsUpdatedDate;
	}

	public void setNewsUpdatedDate(Date newsUpdatedDate) {
		this.newsUpdatedDate = newsUpdatedDate;
	}

	
	
	
	
}
