package kr.co.lookst.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.post.dao.PostDao;
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
		return postDao.prod_info();
	}

	@Override
	public List<snslist_infoDto> getpostlistInfo() throws Exception {
		// TODO Auto-generated method stub
		return postDao.postlist_Info();
	}

}
