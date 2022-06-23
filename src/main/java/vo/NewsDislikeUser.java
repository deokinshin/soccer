package vo;

public class NewsDislikeUser {

	private News news;
	private User user;
	
	public NewsDislikeUser(int newsNo, int userNo) {
		this.news = new News();
		news.setNewsNo(newsNo);
		
		this.user = new User();
		user.setNo(userNo);
	}

	public News getNews() {
		return news;
	}
	
	public User getUser() {
		return user;
	}
	
}
