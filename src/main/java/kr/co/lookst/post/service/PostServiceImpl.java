package kr.co.lookst.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.post.dao.PostDao;
import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.snslist_infoDto;


@Service
public class PostServiceImpl implements PostService{

	@Autowired
	PostDao postDao;
	
	@Override
	public List<Post_imgDto> getpostlistimg() throws Exception {
		return postDao.post_listimg();
	}

	@Override
	public List<ProdInfoDto> getprodInfo() throws Exception {
		// TODO Auto-generated method stub
		return postDao.prod_info();
	}

	@Override
	public List<ProdInfoDto> postImgListCarousel(Integer post_no) throws Exception {
		return postDao.postImgListCarousel(post_no);
	}

	@Override
	public List<snslist_infoDto> postImgListPrdt(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return postDao.postImgListPrdt(post_no);
	}

	@Override
	public List<PostDto> snscommentlist(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return postDao.snscommentlist(post_no);
	}




	

}
