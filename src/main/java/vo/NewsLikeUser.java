package vo;

public class NewsLikeUser {

	private News news;
	private User user;
	
	public NewsLikeUser(int newsNo, int userNo) {
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
