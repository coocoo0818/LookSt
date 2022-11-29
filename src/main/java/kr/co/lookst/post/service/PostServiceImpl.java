package kr.co.lookst.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.post.dao.PostDao;
import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.TpostDto;
import kr.co.lookst.post.domain.OrderFormPageDto;
import kr.co.lookst.post.domain.OrderPagePrdtDto;
import kr.co.lookst.post.domain.post_com_tagDto;
import kr.co.lookst.post.domain.snsPrdtImgDto;
import kr.co.lookst.post.domain.sns_Main_ImgDto;
import kr.co.lookst.post.domain.sns_com_tagDto;
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

	@Override
	public List<post_com_tagDto> postComTaglist(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return postDao.postComTaglist(post_no);
	}

	@Override
	public List<sns_Main_ImgDto> snsmainimg(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return postDao.snsmainimg(post_no);
	}

	@Override
	public List<snsPrdtImgDto> snsPrdtImg(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return postDao.snsPrdtImg(post_no);
	}

	
	@Override 
	public List<sns_com_tagDto> snsComTag(Integer post_no) throws Exception { 
		// TODO Auto-generated method stub 
		return postDao.snsComTag(post_no); 
	}

	@Override
	public List<TpostDto> postTotalList() throws Exception {
		// TODO Auto-generated method stub
		return postDao.postTotalList();
	}

	@Override
	public List<OrderPagePrdtDto> orderPagePrdt(Integer product_no) throws Exception {
		// TODO Auto-generated method stub
		return postDao.orderPagePrdt(product_no);
	}

	/*
	 * @Override public orderFormPageDto orderFormpage(orderFormPageDto
	 * orderFormpage) throws Exception { // TODO Auto-generated method stub return
	 * postDao.orderFormpage(); }
	 */









	

}
