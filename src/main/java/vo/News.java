package vo;

import java.util.Date;

public class News {
	
	private int newsNo;
	private int clubNo;
	private int leagueNo;
	private String newsName;
	private String newsTitle;
	private String newsContent1;
	private String newsContent2;
	private Date newsCreatedDate;
	private Date newsUpdatedDate;
	private int newsLikeCount;
	private int newsDislikeCount;
	private int newsViewCount;
	
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

	public int getNewsLikeCount() {
		return newsLikeCount;
	}

	public void setNewsLikeCount(int newsLikeCount) {
		this.newsLikeCount = newsLikeCount;
	}

	public int getNewsViewCount() {
		return newsViewCount;
	}

	public void setNewsViewCount(int newsViewCount) {
		this.newsViewCount = newsViewCount;
	}

	public int getNewsDislikeCount() {
		return newsDislikeCount;
	}

	public void setNewsDislikeCount(int newsDislikeCount) {
		this.newsDislikeCount = newsDislikeCount;
	}

	public String getNewsContent1() {
		return newsContent1;
	}

	public void setNewsContent1(String newsContent1) {
		this.newsContent1 = newsContent1;
	}

	public String getNewsContent2() {
		return newsContent2;
	}

	public void setNewsContent2(String newsContent2) {
		this.newsContent2 = newsContent2;
	}

	
		
	
}
