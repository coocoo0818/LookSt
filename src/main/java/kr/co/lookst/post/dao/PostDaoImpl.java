package kr.co.lookst.post.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.snslist_infoDto;

@Repository
public class PostDaoImpl implements PostDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.post.dao.PostMapper.";
	
	@Override
	public List<Post_imgDto> post_listimg() throws Exception {
		return session.selectList(namespace + "post_img_list");
	}

/*	@Override
	public List<ProdInfoDto> prod_info() throws Exception {
		List<ProdInfoDto> list = session.selectList(namespace + "prod_info_list");
		System.out.println(list);
		return list;
	}*/

	//@Override
	//public List<snslist_infoDto> postlist_Info() throws Exception {
		
	//	return session.selectList(namespace + "sns_post_listInfo");
	//}

	@Override
	public List<ProdInfoDto> prod_info() throws Exception {
		List<ProdInfoDto> list = session.selectList(namespace + "prod_info_list");		
		
		return list;
	}

	@Override
	public List<ProdInfoDto> postImgListCarousel(Integer post_no) throws Exception {
		return session.selectList(namespace + "postImgListCarousel", post_no);
	}

	@Override
	public List<snslist_infoDto> postImgListPrdt(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "postImgListPrdt", post_no);
	}
}
