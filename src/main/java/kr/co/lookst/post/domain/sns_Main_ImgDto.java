package kr.co.lookst.post.domain;

public class sns_Main_ImgDto {

	private String post_img_img;
	
	public sns_Main_ImgDto() {
		
	}

	public sns_Main_ImgDto(String post_img_img) {
		//super();
		this.post_img_img = post_img_img;
	}

	public String getPost_img_img() {
		return post_img_img;
	}

	public void setPost_img_img(String post_img_img) {
		this.post_img_img = post_img_img;
	}

	@Override
	public String toString() {
		return "sns_Main_ImgDto [post_img_img=" + post_img_img + "]";
	}
	
	
	
}
